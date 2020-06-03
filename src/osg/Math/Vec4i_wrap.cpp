
#include <osg/Vec4i>

extern "C"
{

void* _vec4i_new_from_int(int x, int y, int z, int w)
{
    return (void*)new osg::Vec4i(x, y, z, w);
}

void _vec4i_dispose(void* vec)
{
    delete static_cast<osg::Vec4i*>(vec);
    void** ptr = &vec;
    *ptr = 0;
}

bool _vec4i_equals(void* vec1, void* vec2) 
{
    return static_cast<osg::Vec4i*>(vec1) == static_cast<osg::Vec4i*>(vec2);
}

bool _vec4i_less(void* vec1, void* vec2) 
{
    return static_cast<osg::Vec4i*>(vec1) < static_cast<osg::Vec4i*>(vec2);
}

void _vec4i_set(void* vec, int x, int y, int z, int w)
{
    static_cast<osg::Vec4i*>(vec)->set(x, y, z, w);
}

int _vec4i_x(void* vec) { return static_cast<osg::Vec4i*>(vec)->x(); }
int _vec4i_y(void* vec) { return static_cast<osg::Vec4i*>(vec)->y(); }
int _vec4i_z(void* vec) { return static_cast<osg::Vec4i*>(vec)->z(); }
int _vec4i_w(void* vec) { return static_cast<osg::Vec4i*>(vec)->w(); }

int _vec4i_r(void* vec) { return static_cast<osg::Vec4i*>(vec)->r(); }
int _vec4i_g(void* vec) { return static_cast<osg::Vec4i*>(vec)->g(); }
int _vec4i_b(void* vec) { return static_cast<osg::Vec4i*>(vec)->b(); }
int _vec4i_a(void* vec) { return static_cast<osg::Vec4i*>(vec)->a(); }

}