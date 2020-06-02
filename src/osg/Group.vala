

extern void* _group_new();
extern void  _group_add_child(void* group, void* child);
extern void  _group_dispose(void* group);

public class Group : Node {

    internal Group.from_handle(void* handle) {
        base.from_handle(handle);
        set_disposable(true);
    }

    public Group() {
        this.from_handle(_group_new());
    }

    protected override void dispose_handle() {
        _group_dispose(handle);
    }

    public virtual void add_child(Node child) {
        _group_add_child(handle, child.handle);
    }

}