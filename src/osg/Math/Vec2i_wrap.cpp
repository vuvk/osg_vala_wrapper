
#include <osg/Vec2i>

extern "C"
{

void* _vec2i_new_from_int(int x, int y)
{
    return (void*)new osg::Vec2i(x, y);
}

void _vec2i_dispose(void* vec)
{
    delete static_cast<osg::Vec2i*>(vec);
    void** ptr = &vec;
    *ptr = 0;
}

bool _vec2i_equals(void* vec1, void* vec2) 
{
    return static_cast<osg::Vec2i*>(vec1) == static_cast<osg::Vec2i*>(vec2);
}

bool _vec2i_less(void* vec1, void* vec2) 
{
    return static_cast<osg::Vec2i*>(vec1) < static_cast<osg::Vec2i*>(vec2);
}

void _vec2i_set(void* vec, int x, int y)
{
    static_cast<osg::Vec2i*>(vec)->set(x, y);
}

int _vec2i_x(void* vec) { return static_cast<osg::Vec2i*>(vec)->x(); }
int _vec2i_y(void* vec) { return static_cast<osg::Vec2i*>(vec)->y(); }

}