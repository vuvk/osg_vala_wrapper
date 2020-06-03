
#include <osgFX/Outline>

extern "C"
{

void* _outline_new()
{
	return (void*)new osgFX::Outline;
}

void _outline_dispose(void* outline)
{
    static_cast<osgFX::Outline*>(outline)->unref();
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
    
}