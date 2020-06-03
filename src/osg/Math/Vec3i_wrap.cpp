
#include <osg/Vec3i>

extern "C"
{

void* _vec3i_new_from_int(int x, int y, int z)
{
    return (void*)new osg::Vec3i(x, y, z);
}

void _vec3i_dispose(void* vec)
{
    delete static_cast<osg::Vec3i*>(vec);
    void** ptr = &vec;
    *ptr = 0;
}

bool _vec3i_equals(void* vec1, void* vec2) 
{
    return static_cast<osg::Vec3i*>(vec1) == static_cast<osg::Vec3i*>(vec2);
}

bool _vec3i_less(void* vec1, void* vec2) 
{
    return static_cast<osg::Vec3i*>(vec1) < static_cast<osg::Vec3i*>(vec2);
}

void _vec3i_set(void* vec, int x, int y, int z)
{
    static_cast<osg::Vec3i*>(vec)->set(x, y, z);
}

int _vec3i_x(void* vec) { return static_cast<osg::Vec3i*>(vec)->x(); }
int _vec3i_y(void* vec) { return static_cast<osg::Vec3i*>(vec)->y(); }
int _vec3i_z(void* vec) { return static_cast<osg::Vec3i*>(vec)->z(); }

int _vec3i_r(void* vec) { return static_cast<osg::Vec3i*>(vec)->r(); }
int _vec3i_g(void* vec) { return static_cast<osg::Vec3i*>(vec)->g(); }
int _vec3i_b(void* vec) { return static_cast<osg::Vec3i*>(vec)->b(); }

}