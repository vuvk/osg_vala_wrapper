#include <osg/Vec3f>

extern "C"
{

void* _vec3f_new_from_float(float x, float y, float z)
{
    return (void*)new osg::Vec3f(x, y, z);
}

void _vec3f_dispose(void* vec)
{
    delete static_cast<osg::Vec3f*>(vec);
    void** ptr = &vec;
    *ptr = NULL;
}

bool _vec3f_equals(void* vec1, void* vec2) 
{
    return static_cast<osg::Vec3f*>(vec1) == static_cast<osg::Vec3f*>(vec2);
}

bool _vec3f_less(void* vec1, void* vec2) 
{
    return static_cast<osg::Vec3f*>(vec1) < static_cast<osg::Vec3f*>(vec2);
}

void _vec3f_set(void* vec, float x, float y, float z)
{
    static_cast<osg::Vec3f*>(vec)->set(x, y, z);
}

float _vec3f_x(void* vec) { return static_cast<osg::Vec3f*>(vec)->x(); }
float _vec3f_y(void* vec) { return static_cast<osg::Vec3f*>(vec)->y(); }
float _vec3f_z(void* vec) { return static_cast<osg::Vec3f*>(vec)->z(); }

/** Returns true if at least one component has value NaN. */
bool _vec3f_is_nan(void* vec)
{
    return static_cast<osg::Vec3f*>(vec)->isNaN();
}

/** Returns true if all components have values that are not NaN. */
bool _vec3f_valid(void* vec)
{
    return static_cast<osg::Vec3f*>(vec)->valid();
}

/** Dot product. */
float _vec3f_dot(void* vec1, void* vec2)
{
    return *(static_cast<osg::Vec3f*>(vec1)) * *(static_cast<osg::Vec3f*>(vec2));
}

/** Length of the vector = sqrt( vec . vec ) */
float _vec3f_length(void* vec)
{
    return static_cast<osg::Vec3f*>(vec)->length();
}

/** Length squared of the vector = vec . vec */
float _vec3f_length2(void* vec)
{
    return static_cast<osg::Vec3f*>(vec)->length2();
}

/** Normalize the vector so that it has length unity.
     * Returns the previous length of the vector.
*/
float _vec3f_normalize(void* vec)
{
    return static_cast<osg::Vec3f*>(vec)->normalize();
}

}