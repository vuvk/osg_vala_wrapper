
public abstract class OSGObject : Object {
    protected unowned void* handle;

    internal OSGObject.from_handle(void* handle) {
        this.handle = handle;
    }
    
    protected abstract void dispose_handle();

    ~OSGObject() {
        dispose_handle();
    }
}
