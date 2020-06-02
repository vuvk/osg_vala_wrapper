
extern void* _geometry_new();
extern void  _geometry_dispose(void* geometry);

public class Geometry : Drawable {

    public Geometry.from_handle(void* handle) {
        base.from_handle(handle);
    }

    public Geometry() {
        this.from_handle(_geometry_new());
    }

    protected override void dispose_handle() {
        _geometry_dispose(handle);
    }

    ~Geometry() {
        base.dispose();
    }

}