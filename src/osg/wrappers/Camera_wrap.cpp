
#include <GL/gl.h>
#include <osg/Camera>

extern "C"
{
    
void* _camera_new() {
    return (void*) new osg::Camera();
}

void _camera_dispose(void* camera)
{
    static_cast<osg::Camera*>(camera)->unref();
}

GLbitfield _camera_get_clear_mask(void* camera)
{
    return static_cast<osg::Camera*>(camera)->getClearMask();
}

void _camera_set_clear_mask(void* camera, GLbitfield mask)
{
    static_cast<osg::Camera*>(camera)->setClearMask(mask);
}
void _camera_set_clear_stencil(void* camera, int stencil)
{
    static_cast<osg::Camera*>(camera)->setClearStencil(stencil);
}

}