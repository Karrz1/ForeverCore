/*
 * This file is part of the TrinityCore Project. See AUTHORS file for Copyright information
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef TRINITYCORE_BOUNDING_INTERVAL_HIERARCHY_WRAPPER_H
#define TRINITYCORE_BOUNDING_INTERVAL_HIERARCHY_WRAPPER_H

#include "BoundingIntervalHierarchy.h"
#include "Log.h"
#include <cmath>
#include <span>
#include <unordered_map>

template<class T, class BoundsFunc = BoundsTrait<T> >
class BIHWrap
{
    template<class RayCallback>
    struct MDLCallback
    {
        std::size_t objects_size;
        T const* const* objects;
        RayCallback& _callback;

        MDLCallback(RayCallback& callback, T const* const* objects_array, std::size_t objects_size ) : objects_size(objects_size), objects(objects_array), _callback(callback) { }

        /// Intersect ray
        bool operator() (G3D::Ray const& ray, std::size_t idx, float& maxDist, bool /*stopAtFirst*/)
        {
            if (idx >= objects_size)
                return false;
            if (T const* obj = objects[idx])
                return _callback(ray, *obj, maxDist/*, stopAtFirst*/);
            return false;
        }

        /// Intersect point
        void operator() (G3D::Vector3 const& p, std::size_t idx)
        {
            if (idx >= objects_size)
                return;
            if (T const* obj = objects[idx])
                _callback(p, *obj);
        }
    };

    BIH m_tree;
    std::vector<T const*> m_objects;
    std::unordered_map<T const*, std::size_t> m_obj2Idx;
    int unbalanced_times;

public:
    BIHWrap() : unbalanced_times(0) { }

    void insert(T const& obj)
    {
        auto [itr, isNew] = m_obj2Idx.try_emplace(&obj, m_objects.size());
        if (!isNew)
            return;

        m_objects.push_back(itr->first);
        ++unbalanced_times;
    }

    void remove(T const& obj)
    {
        auto node = m_obj2Idx.extract(&obj);
        if (!node)
            return;

        if (node.key() != m_objects.back())
        {
            // update index of last element (will be swapped with removed one)
            m_obj2Idx.find(m_objects.back())->second = node.mapped();

            // move last into removed element slot
            m_objects[node.mapped()] = m_objects.back();
        }

        m_objects.pop_back();

        ++unbalanced_times;
    }

    // An object whose bounds are not finite, or have low above high, makes BIH::build loop for ever (the split never narrows),
    // and the freeze detector then stops the world server. Such objects stay out of the tree (no dynamic collision for them)
    // and are logged; they come back if they are removed and inserted again with usable bounds.
    static bool UsableBounds(G3D::AABox const& box)
    {
        G3D::Vector3 const& lo = box.low();
        G3D::Vector3 const& hi = box.high();
        return std::isfinite(lo.x) && std::isfinite(lo.y) && std::isfinite(lo.z)
            && std::isfinite(hi.x) && std::isfinite(hi.y) && std::isfinite(hi.z)
            && lo.x <= hi.x && lo.y <= hi.y && lo.z <= hi.z;
    }

    void dropUnusableBounds()
    {
        std::vector<T const*> unusable;
        for (T const* obj : m_objects)
        {
            G3D::AABox box;
            BoundsFunc()(obj, box);
            if (!UsableBounds(box))
            {
                TC_LOG_ERROR("maps", "BIHWrap: object {} left out of the collision tree, bounds lo=({}, {}, {}) hi=({}, {}, {})",
                    static_cast<void const*>(obj), box.low().x, box.low().y, box.low().z, box.high().x, box.high().y, box.high().z);
                unusable.push_back(obj);
            }
        }

        for (T const* obj : unusable)
            remove(*obj);
    }

    void balance()
    {
        if (unbalanced_times == 0)
            return;

        dropUnusableBounds();
        m_tree.build(m_objects, BoundsFunc());
        unbalanced_times = 0;
    }

    template<typename RayCallback>
    void intersectRay(G3D::Ray const& ray, RayCallback& intersectCallback, float& maxDist)
    {
        balance();
        MDLCallback<RayCallback> temp_cb(intersectCallback, m_objects.data(), m_objects.size());
        m_tree.intersectRay(ray, temp_cb, maxDist, true);
    }

    template<typename IsectCallback>
    void intersectPoint(G3D::Vector3 const& point, IsectCallback& intersectCallback)
    {
        balance();
        MDLCallback<IsectCallback> callback(intersectCallback, m_objects.data(), m_objects.size());
        m_tree.intersectPoint(point, callback);
    }

    std::span<T const* const> getObjects() const { return m_objects; }
};

#endif // TRINITYCORE_BOUNDING_INTERVAL_HIERARCHY_WRAPPER_H
