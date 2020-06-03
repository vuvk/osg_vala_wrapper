#include <stdbool.h>
#include <osg/Vec3f>
#include <osg/Vec4f>

extern "C"
{

void* _vec4f_new_from_float(float x, float y, float z, float w)
{
    return (void*)new osg::Vec4f(x, y, z, w);
}

void _vec4f_dispose(void* vec)
{
    delete static_cast<osg::Vec4f*>(vec);
    void** ptr = &vec;
    *ptr = NULL;
}

bool _vec4f_equals(void* vec1, void* vec2) 
{
    return static_cast<osg::Vec4f*>(vec1) == static_cast<osg::Vec4f*>(vec2);
}

bool _vec4f_less(void* vec1, void* vec2) 
{
    return static_cast<osg::Vec4f*>(vec1) < static_cast<osg::Vec4f*>(vec2);
}

void _vec4f_set(void* vec, float x, float y, float z, float w)
{
    static_cast<osg::Vec4f*>(vec)->set(x, y, z, w);
}

float _vec4f_x(void* vec) { return static_cast<osg::Vec4f*>(vec)->x(); }
float _vec4f_y(void* vec) { return static_cast<osg::Vec4f*>(vec)->y(); }
float _vec4f_z(void* vec) { return static_cast<osg::Vec4f*>(vec)->z(); }
float _vec4f_w(void* vec) { return static_cast<osg::Vec4f*>(vec)->w(); }

float _vec4f_r(void* vec) { return static_cast<osg::Vec4f*>(vec)->r(); }
float _vec4f_g(void* vec) { return static_cast<osg::Vec4f*>(vec)->g(); }
float _vec4f_b(void* vec) { return static_cast<osg::Vec4f*>(vec)->b(); }
float _vec4f_a(void* vec) { return static_cast<osg::Vec4f*>(vec)->a(); }

uint _vec4f_as_rgba(void* vec) { return static_cast<osg::Vec4f*>(vec)->asRGBA(); }
uint _vec4f_as_abgr(void* vec) { return static_cast<osg::Vec4f*>(vec)->asABGR(); }

/** Returns true if at least one component has value NaN. */
bool _vec4f_is_nan(void* vec)
{
    return static_cast<osg::Vec4f*>(vec)->isNaN();
}

/** Returns true if all components have values that are not NaN. */
bool _vec4f_valid(void* vec)
{
    return !_vec4f_is_nan(vec);
}

/** Dot product. */
float _vec4f_dot(void* vec1, void* vec2)
{
    return *(static_cast<osg::Vec4f*>(vec1)) * *(static_cast<osg::Vec4f*>(vec2));
}

/** Length of the vector = sqrt( vec . vec ) */
float _vec4f_length(void* vec)
{
    return static_cast<osg::Vec4f*>(vec)->length();
}

/** Length squared of the vector = vec . vec */
float _vec4f_length2(void* vec)
{
    return static_cast<osg::Vec4f*>(vec)->length2();
}

/** Normalize the vector so that it has length unity.
     * Returns the previous length of the vector.
*/
float _vec4f_normalize(void* vec)
{
    return static_cast<osg::Vec4f*>(vec)->normalize();
}

}