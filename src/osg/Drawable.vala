
extern void* _drawable_new();
extern void  _drawable_dispose(void* drawable);

public class Drawable : Node {

    public Drawable.from_handle(void* handle) {
        base.from_handle(handle);
    }

    public Drawable() {
        this.from_handle(_drawable_new());
    }

    protected override void dispose_handle() {
        _drawable_dispose(handle);
    }

    ~Drawable() {
        base.dispose();
    }

}