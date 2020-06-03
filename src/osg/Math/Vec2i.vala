
extern void* _vec2i_new_from_int(int x, int y);
extern void  _vec2i_dispose(void* vec);
extern bool  _vec2i_equals(void* vec1, void* vec2);
extern bool  _vec2i_less(void* vec1, void* vec2);
extern void  _vec2i_set(void* vec, int x, int y);
extern int   _vec2i_x(void* vec);
extern int   _vec2i_y(void* vec);


public class Vec2i : OSGObject {

    internal Vec2i.from_handle(void* handle) {
        base.from_handle(handle);
    }

    public Vec2i.from_vec2i(Vec2i vec) {
        this(vec.x(), vec.y());
    }

    public Vec2i(int x = 0, int y = 0) {
        this.from_handle(_vec2i_new_from_int(x, y));
    }

    protected override void dispose_handle () {
        _vec2i_dispose(handle);
    }

    ~Vec2i() {
        base.dispose();
    }

    public Vec2i cpy() {
        return new Vec2i.from_vec2i(this);
    }

    public bool equals(Vec2i vec) {
        return _vec2i_equals(handle, vec.handle);
    }

    public bool less(Vec2i vec) {
        return _vec2i_less(handle, vec.handle);
    }

    public void set_xy(int x, int y) {
        _vec2i_set(handle, x, y);
    }

    public int x() { return _vec2i_x(handle); }
    public int y() { return _vec2i_y(handle); }

    /** Multiply by scalar. */
    public Vec2i mul(int scalar) {
        int x = this.x() * scalar,
            y = this.y() * scalar;

        return new Vec2i(x, y);
    }

    /** Divide by scalar. */
    public Vec2i div(int scalar) {
        if (scalar == 0) {
            return new Vec2i();
        }

        int x = this.x() / scalar,
            y = this.y() / scalar;

        return new Vec2i(x, y);
    }

    /** Binary vector add. */
    public Vec2i add(Vec2i vec) {   
        int x = this.x() + vec.x(),
            y = this.y() + vec.y();

        return new Vec2i(x, y);
    }

    /** Binary vector subtract. */
    public Vec2i sub(Vec2i vec) {   
        int x = this.x() - vec.x(),
            y = this.y() - vec.y();

        return new Vec2i(x, y);
    }

    /** Negation operator. Returns the negative of the Vec2i. */
    public Vec2i neg() {
        return new Vec2i(-x(), -y());
    }
}
