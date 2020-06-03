
extern void* _vec4i_new_from_int(int x, int y, int z, int w);
extern void  _vec4i_dispose(void* vec);
extern bool  _vec4i_equals(void* vec1, void* vec2);
extern bool  _vec4i_less(void* vec1, void* vec2);
extern void  _vec4i_set(void* vec, int x, int y, int z, int w);
extern int   _vec4i_x(void* vec);
extern int   _vec4i_y(void* vec);
extern int   _vec4i_z(void* vec);
extern int   _vec4i_w(void* vec);
extern int   _vec4i_r(void* vec);
extern int   _vec4i_g(void* vec);
extern int   _vec4i_b(void* vec);
extern int   _vec4i_a(void* vec);


public class Vec4i : OSGObject {

    internal Vec4i.from_handle(void* handle) {
        base.from_handle(handle);
    }

    public Vec4i.from_vec4i(Vec4i vec) {
        this(vec.x(), vec.y(), vec.z(), vec.w());
    }

    public Vec4i.from_vec3i(Vec3i vec, int w) {
        this(vec.x(), vec.y(), vec.z(), w);
    }

    public Vec4i(int x = 0, int y = 0, int z = 0, int w = 0) {
        this.from_handle(_vec4i_new_from_int(x, y, z, w));
    }

    protected override void dispose_handle () {
        _vec4i_dispose(handle);
    }

    ~Vec4i() {
        base.dispose();
    }

    public Vec4i cpy() {
        return new Vec4i.from_vec4i(this);
    }

    public bool equals(Vec4i vec) {
        return _vec4i_equals(handle, vec.handle);
    }

    public bool less(Vec4i vec) {
        return _vec4i_less(handle, vec.handle);
    }

    public void set_xyzw(int x, int y, int z, int w) {
        _vec4i_set(handle, x, y, z, w);
    }

    public int x() { return _vec4i_x(handle); }
    public int y() { return _vec4i_y(handle); }
    public int z() { return _vec4i_z(handle); }
    public int w() { return _vec4i_w(handle); }

    public int r() { return _vec4i_r(handle); }
    public int g() { return _vec4i_g(handle); }
    public int b() { return _vec4i_b(handle); }
    public int a() { return _vec4i_a(handle); }

    /** Multiply by scalar. */
    public Vec4i mul(int scalar) {
        int x = this.x() * scalar,
            y = this.y() * scalar,
            z = this.z() * scalar,
            w = this.w() * scalar;

        return new Vec4i(x, y, z, w);
    }

    /** Divide by scalar. */
    public Vec4i div(int scalar) {
        if (scalar == 0) {
            return new Vec4i();
        }

        int x = this.x() / scalar,
            y = this.y() / scalar,
            z = this.z() / scalar,
            w = this.w() / scalar;

        return new Vec4i(x, y, z, w);
    }

    /** Binary vector add. */
    public Vec4i add(Vec4i vec) {   
        int x = this.x() + vec.x(),
            y = this.y() + vec.y(),
            z = this.z() + vec.z(),
            w = this.w() + vec.w();

        return new Vec4i(x, y, z, w);
    }

    /** Binary vector subtract. */
    public Vec4i sub(Vec4i vec) {   
        int x = this.x() - vec.x(),
            y = this.y() - vec.y(),
            z = this.z() - vec.z(),
            w = this.w() - vec.w();

        return new Vec4i(x, y, z, w);
    }

    /** Negation operator. Returns the negative of the Vec4i. */
    public Vec4i neg() {
        return new Vec4i(-x(), -y(), -z(), -w());
    }
}
