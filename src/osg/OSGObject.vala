
public abstract class OSGObject : Object {
    protected unowned void* handle;

    internal OSGObject.from_handle(void* handle) {
        this.handle = handle;
    }
    
    protected bool disposable = false;
    
    public bool is_disposable() {
        return disposable;
    }

    public void set_disposable(bool disposable) {
        this.disposable = disposable;
    }
    
    protected abstract void dispose_handle();

    ~OSGObject() {
        if (disposable) {
            dispose_handle();
        }
    }
}