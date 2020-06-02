

extern void* _node_read_node_file(string file_name);
class Node : OSGObject {

    internal Node.from_handle(void* handle) {
        base.from_handle(handle);
    }

    public Node.from_file(string filename) {
        handle = _node_read_node_file(filename);
    }

    /** Construct a node.
        Initialize the parent list to empty, node name to "" and
        bounding sphere dirty flag to true.*/
    public Node() {

    }
}