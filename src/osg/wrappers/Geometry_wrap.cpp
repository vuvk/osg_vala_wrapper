
#include <osg/Geometry>

extern "C"
{

void* _geometry_new()
{
    return (void*) new osg::Geometry();
}

void _geometry_dispose(void* geometry)
{
    static_cast<osg::Geometry*>(geometry)->unref();
}

}