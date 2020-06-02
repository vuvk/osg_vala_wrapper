
#include <osg/Group>
#include <osg/PositionAttitudeTransform>

#include <osgDB/ReadFile>
#include <osgViewer/Viewer>

#include <osgFX/Outline>

extern "C" 
{
	
void* _node_read_node_file(const char* file_name) 
{
    std::string real_name(file_name);
	return (void*)osgDB::readNodeFile(real_name);
}

void* _group_new() 
{
	return (void*)new osg::Group;
}

void _group_add_child(void* group, void* child)
{
	static_cast<osg::Group*>(group)->addChild((osg::Node*)child);
}

void* _outline_new()
{
	return (void*)new osgFX::Outline;
}

void _outline_set_width(void* outline, float w) 
{
    static_cast<osgFX::Outline*>(outline)->setWidth(w);
}

void _outline_set_color(void* outline, void* vec4f)
{
    static_cast<osgFX::Outline*>(outline)->setColor(*((osg::Vec4*)vec4f));
}

void _outline_add_child(void* outline, void* node)
{
    static_cast<osgFX::Outline*>(outline)->addChild(static_cast<osg::Node*>(node));
}

void _display_settings_set_minimum_num_stencil_bits(int num)
{
    osg::DisplaySettings::instance()->setMinimumNumStencilBits(num);
}

void* _viewer_new()
{
    return (void*)new osgViewer::Viewer();
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

void* _camera_new() {
    return (void*) new osg::Camera();
}

int _camera_get_clear_mask(void* camera)
{
    return static_cast<osg::Camera*>(camera)->getClearMask();
}

void _camera_set_clear_mask(void* camera, int mask)
{
    static_cast<osg::Camera*>(camera)->setClearMask(mask);
}
void _camera_set_clear_stencil(void* camera, int stencil)
{
    static_cast<osg::Camera*>(camera)->setClearStencil(stencil);
}

}
