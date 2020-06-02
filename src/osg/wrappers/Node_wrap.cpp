#include <osg/Node>
#include <osgDB/ReadFile>

extern "C"
{

void* _node_new()
{
    return (void*) new osg::Node();
}

void _node_dispose(void* node)
{
    static_cast<osg::Node*>(node)->unref();
    void** ptr = &node;
    *ptr = NULL;
}

void* _node_get_parent(void* node, int num) 
{
    return (void*) static_cast<osg::Node*>(node)->getParent(num);
}

unsigned int _node_get_num_parents(void* node) 
{
    return static_cast<osg::Node*>(node)->getNumParents();
}

void _node_set_culling_active(void* node, bool active)
{
    static_cast<osg::Node*>(node)->setCullingActive(active);
}

bool _node_get_culling_active(void* node)
{
    return static_cast<osg::Node*>(node)->getCullingActive();
}

bool _node_is_culling_active(void* node)
{
    return static_cast<osg::Node*>(node)->isCullingActive();
}

unsigned int _node_get_num_children_with_occluder_nodes(void* node)
{
    return static_cast<osg::Node*>(node)->getNumChildrenWithOccluderNodes();
}

bool _node_contains_occluder_nodes(void* node)
{
    return static_cast<osg::Node*>(node)->containsOccluderNodes();
}

void _node_set_node_mask(void* node, unsigned int nm)
{
    static_cast<osg::Node*>(node)->setNodeMask(nm);
}

unsigned int _node_get_node_mask(void* node)
{
    return static_cast<osg::Node*>(node)->getNodeMask();
}

const char* _node_get_description(void* node, unsigned int num)
{
    return static_cast<osg::Node*>(node)->getDescription(num).c_str();
}

unsigned int _node_get_num_descriptions(void* node)
{
    return static_cast<osg::Node*>(node)->getNumDescriptions();
}

void _node_add_description(void* node, const char* desc)
{
    std::string description(desc);
    static_cast<osg::Node*>(node)->addDescription(description);
}

void _node_dirty_bound(void* node)
{
    static_cast<osg::Node*>(node)->dirtyBound();
}

void _node_set_thread_safe_ref_unref(void* node, bool thread_safe)
{
    static_cast<osg::Node*>(node)->setThreadSafeRefUnref(thread_safe);
}

void _node_resize_gl_object_buffers(void* node, unsigned int max_size)
{
    static_cast<osg::Node*>(node)->resizeGLObjectBuffers(max_size);
}
	
void* _node_read_node_file(const char* file_name) 
{
    std::string real_name(file_name);
	return (void*)osgDB::readNodeFile(real_name);
}

}