
extern void* _vec3i_new_from_int(int x, int y, int z);
extern void  _vec3i_dispose(void* vec);
extern bool  _vec3i_equals(void* vec1, void* vec2);
extern bool  _vec3i_less(void* vec1, void* vec2);
extern void  _vec3i_set(void* vec, int x, int y, int z);
extern int   _vec3i_x(void* vec);
extern int   _vec3i_y(void* vec);
extern int   _vec3i_z(void* vec);
extern int   _vec3i_r(void* vec);
extern int   _vec3i_g(void* vec);
extern int   _vec3i_b(void* vec);


public class Vec3i : OSGObject {

    internal Vec3i.from_handle(void* handle) {
        base.from_handle(handle);
    }

    public Vec3i.from_vec3i(Vec3i vec) {
        this(vec.x(), vec.y(), vec.z());
    }

    public Vec3i.from_vec2i(Vec2i vec, int z) {
        this(vec.x(), vec.y(), z);
    }

    public Vec3i(int x = 0, int y = 0, int z = 0) {
        this.from_handle(_vec3i_new_from_int(x, y, z));
    }

    protected override void dispose_handle () {
        _vec3i_dispose(handle);
    }

    ~Vec3i() {
        base.dispose();
    }

    public Vec3i cpy() {
        return new Vec3i.from_vec3i(this);
    }

    public bool equals(Vec3i vec) {
        return _vec3i_equals(handle, vec.handle);
    }

    public bool less(Vec3i vec) {
        return _vec3i_less(handle, vec.handle);
    }

    public void set_xyz(int x, int y, int z) {
        _vec3i_set(handle, x, y, z);
    }

    public int x() { return _vec3i_x(handle); }
    public int y() { return _vec3i_y(handle); }
    public int z() { return _vec3i_z(handle); }

    public int r() { return _vec3i_r(handle); }
    public int g() { return _vec3i_g(handle); }
    public int b() { return _vec3i_b(handle); }

    /** Multiply by scalar. */
    public Vec3i mul(int scalar) {
        int x = this.x() * scalar,
            y = this.y() * scalar,
            z = this.z() * scalar;

        return new Vec3i(x, y, z);
    }

    /** Divide by scalar. */
    public Vec3i div(int scalar) {
        if (scalar == 0) {
            return new Vec3i();
        }

        int x = this.x() / scalar,
            y = this.y() / scalar,
            z = this.z() / scalar;

        return new Vec3i(x, y, z);
    }

    /** Binary vector add. */
    public Vec3i add(Vec3i vec) {   
        int x = this.x() + vec.x(),
            y = this.y() + vec.y(),
            z = this.z() + vec.z();

        return new Vec3i(x, y, z);
    }

    /** Binary vector subtract. */
    public Vec3i sub(Vec3i vec) {   
        int x = this.x() - vec.x(),
            y = this.y() - vec.y(),
            z = this.z() - vec.z();

        return new Vec3i(x, y, z);
    }

    /** Negation operator. Returns the negative of the Vec3i. */
    public Vec3i neg() {
        return new Vec3i(-x(), -y(), -z());
    }
}
