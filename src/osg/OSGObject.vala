
public class OSGObject : Object {
    protected void* handle;

    internal OSGObject.from_handle(void* handle) {
        this.handle = handle;
    }
    /*protected void* get_handle() {
        return handle;
    }*/
}