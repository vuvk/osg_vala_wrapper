
#include <osgViewer/Viewer>

extern "C"
{

void* _viewer_new()
{
    return (void*)new osgViewer::Viewer();
}

void _viewer_dispose(void* viewer)
{
    static_cast<osgViewer::Viewer*>(viewer)->unref();
}

void _viewer_set_scene_data(void* viewer, void* node)
{
    static_cast<osgViewer::Viewer*>(viewer)->setSceneData(static_cast<osg::Node*>(node));
}

void* _viewer_get_camera(void* viewer)
{
    return (void*) static_cast<osgViewer::Viewer*>(viewer)->getCamera();
}

void _viewer_run(void* viewer)
{
    static_cast<osgViewer::Viewer*>(viewer)->run();
}

}