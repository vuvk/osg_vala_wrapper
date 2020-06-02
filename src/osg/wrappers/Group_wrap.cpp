#include <osg/Group>

extern "C"
{

void* _group_new() 
{
	return (void*)new osg::Group;
}

void _group_dispose(void* group) 
{
	static_cast<osg::Group*>(group)->unref();
}

void _group_add_child(void* group, void* child)
{
	static_cast<osg::Group*>(group)->addChild((osg::Node*)child);
}

}