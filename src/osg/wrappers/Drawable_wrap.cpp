
#include <osg/Drawable>

extern "C"
{

void* _drawable_new()
{
    return (void*) new osg::Drawable();
}

void _drawable_dispose(void* drawable)
{
    static_cast<osg::Drawable*>(drawable)->unref();
}

}