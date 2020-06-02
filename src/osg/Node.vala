

extern void* _node_new();
extern void  _node_dispose(void* node);
extern void* _node_get_parent(void* node, int num);
extern uint  _node_get_num_parents(void* node);
extern void  _node_set_culling_active(void* node, bool active);
extern bool  _node_get_culling_active(void* node);
extern bool  _node_is_culling_active(void* node);
extern uint  _node_get_num_children_with_occluder_nodes(void* node);
extern bool  _node_contains_occluder_nodes(void* node);
extern void  _node_set_node_mask(void* node, uint nm);
extern uint  _node_get_node_mask(void* node);
extern unowned string? _node_get_description(void* node, uint num);
extern uint  _node_get_num_descriptions(void* node);
extern void  _node_add_description(void* node, string desc);
extern void  _node_dirty_bound(void* node);
extern void  _node_set_thread_safe_ref_unref(void* node, bool thread_safe);
extern void  _node_resize_gl_object_buffers(void* node, uint max_size);
extern void* _node_read_node_file(string file_name);


public class Node : OSGObject {

    internal Node.from_handle(void* handle) {
        base.from_handle(handle);
    }

    public Node.from_file(string filename) {
        this.from_handle(_node_read_node_file(filename));
    }

    /** Construct a node.
        Initialize the parent list to empty, node name to "" and
        bounding sphere dirty flag to true.*/
    public Node() {
        this.from_handle(_node_new());
    }

    protected override void dispose_handle () {
        _node_dispose(handle);
    }

    ~Node() {
        base.dispose();
    }    

    public Group get_parent(int num) {
        return new Group.from_handle(_node_get_parent(handle, num));
    }
    
    public uint get_num_parents() {
        return _node_get_num_parents(handle);
    }

    public void set_culling_active(bool active) {
        _node_set_culling_active(handle, active);
    }

    public bool get_culling_active() {
        return _node_get_culling_active(handle);
    }

    public bool is_culling_active() {
        return _node_is_culling_active(handle);
    }

    public uint get_num_children_with_occluder_nodes() {
        return _node_get_num_children_with_occluder_nodes(handle);
    }

    public bool contains_occluder_nodes() {
        return _node_contains_occluder_nodes(handle);
    }

    public void set_node_mask(uint nm) {
        _node_set_node_mask(handle, nm);
    }

    public uint get_node_mask() {
        return _node_get_node_mask(handle);
    }

    public unowned string? get_description(uint num) {
        return _node_get_description(handle, num);
    }

    public uint get_num_descriptions() {
        return _node_get_num_descriptions(handle);
    }

    public void add_description(string desc) {
        _node_add_description(handle, desc);
    }

    public void dirty_bound() {
        _node_dirty_bound(handle);
    }

    public void set_thread_safe_ref_unref(bool thread_safe) {
        _node_set_thread_safe_ref_unref(handle, thread_safe);
    }

    public void resize_gl_object_buffers(uint max_size) {
        _node_resize_gl_object_buffers(handle, max_size);
    }
}
