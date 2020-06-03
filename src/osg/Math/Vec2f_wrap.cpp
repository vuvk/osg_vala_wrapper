
#include <osg/Vec2f>

extern "C"
{

void* _vec2f_new_from_float(float x, float y)
{
    return (void*)new osg::Vec2f(x, y);
}

void _vec2f_dispose(void* vec)
{
    delete static_cast<osg::Vec2f*>(vec);
    void** ptr = &vec;
    *ptr = NULL;
}

bool _vec2f_equals(void* vec1, void* vec2) 
{
    return static_cast<osg::Vec2f*>(vec1) == static_cast<osg::Vec2f*>(vec2);
}

bool _vec2f_less(void* vec1, void* vec2) 
{
    return static_cast<osg::Vec2f*>(vec1) < static_cast<osg::Vec2f*>(vec2);
}

void _vec2f_set(void* vec, float x, float y)
{
    static_cast<osg::Vec2f*>(vec)->set(x, y);
}

float _vec2f_x(void* vec) { return static_cast<osg::Vec2f*>(vec)->x(); }
float _vec2f_y(void* vec) { return static_cast<osg::Vec2f*>(vec)->y(); }

/** Returns true if at least one component has value NaN. */
bool _vec2f_is_nan(void* vec)
{
    return static_cast<osg::Vec2f*>(vec)->isNaN();
}

/** Returns true if all components have values that are not NaN. */
bool _vec2f_valid(void* vec)
{
    return static_cast<osg::Vec2f*>(vec)->valid();
}

/** Dot product. */
float _vec2f_dot(void* vec1, void* vec2)
{
    return *(static_cast<osg::Vec2f*>(vec1)) * *(static_cast<osg::Vec2f*>(vec2));
}

/** Length of the vector = sqrt( vec . vec ) */
float _vec2f_length(void* vec)
{
    return static_cast<osg::Vec2f*>(vec)->length();
}

/** Length squared of the vector = vec . vec */
float _vec2f_length2(void* vec)
{
    return static_cast<osg::Vec2f*>(vec)->length2();
}

/** Normalize the vector so that it has length unity.
     * Returns the previous length of the vector.
*/
float _vec2f_normalize(void* vec)
{
    return static_cast<osg::Vec2f*>(vec)->normalize();
}

}