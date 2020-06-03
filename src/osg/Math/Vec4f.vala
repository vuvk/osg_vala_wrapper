

extern void* _vec4f_new_from_float(float x, float y, float z, float w);
extern void  _vec4f_dispose(void* vec);
extern bool  _vec4f_equals(void* vec1, void* vec2);
extern bool  _vec4f_less(void* vec1, void* vec2);
extern void  _vec4f_set(void* vec, float x, float y, float z, float w);
extern float _vec4f_x(void* vec);
extern float _vec4f_y(void* vec);
extern float _vec4f_z(void* vec);
extern float _vec4f_w(void* vec);
extern float _vec4f_r(void* vec);
extern float _vec4f_g(void* vec);
extern float _vec4f_b(void* vec);
extern float _vec4f_a(void* vec);
extern uint  _vec4f_as_rgba(void* vec);
extern uint  _vec4f_as_abgr(void* vec);
extern bool  _vec4f_is_nan(void* vec);
extern bool  _vec4f_valid(void* vec);
extern float _vec4f_dot(void* vec1, void* vec2);
extern float _vec4f_length(void* vec);
extern float _vec4f_length2(void* vec);
extern float _vec4f_normalize(void* vec);


public class Vec4f : OSGObject {

    internal Vec4f.from_handle(void* handle) {
        base.from_handle(handle);
    }

    public Vec4f.from_vec4f(Vec4f vec) {
        this(vec.x(), vec.y(), vec.z(), vec.w());
    }

    public Vec4f.from_vec3f(Vec3f vec, float w) {
        this(vec.x(), vec.y(), vec.z(), w);
    }

    public Vec4f(float x = 0, float y = 0, float z = 0, float w = 0) {
        this.from_handle(_vec4f_new_from_float(x, y, z, w));
    }

    protected override void dispose_handle () {
        _vec4f_dispose(handle);
    }

    ~Vec4f() {
        base.dispose();
    }

    public Vec4f cpy() {
        return new Vec4f.from_vec4f(this);
    }

    public bool equals(Vec4f vec) {
        return _vec4f_equals(handle, vec.handle);
    }

    public bool less(Vec4f vec) {
        return _vec4f_less(handle, vec.handle);
    }

    public void set_xyzw(float x, float y, float z, float w) {
        _vec4f_set(handle, x, y, z, w);
    }

    public float x() { return _vec4f_x(handle); }
    public float y() { return _vec4f_y(handle); }
    public float z() { return _vec4f_z(handle); }
    public float w() { return _vec4f_w(handle); }

    public float r() { return _vec4f_r(handle); }
    public float g() { return _vec4f_g(handle); }
    public float b() { return _vec4f_b(handle); }
    public float a() { return _vec4f_a(handle); }

    public uint as_rgba() {
        return _vec4f_as_rgba(handle);
    }

    public uint as_bgra() {
        return _vec4f_as_abgr(handle);
    }

    /** Returns true if all components have values that are not NaN. */
    public bool is_nan() {
        return _vec4f_is_nan(handle);
    }

    /** Returns true if at least one component has value NaN. */
    public bool valid() {
        return _vec4f_valid(handle);
    }
    
    /** Dot product. */
    public float dot(Vec4f vec) {
        return _vec4f_dot(handle, vec.handle);
    }

    /** Multiply by scalar. */
    public Vec4f mul(float scalar) {
        float x = this.x() * scalar,
              y = this.y() * scalar,
              z = this.z() * scalar,
              w = this.w() * scalar;

        return new Vec4f(x, y, z, w);
    }

    /** Divide by scalar. */
    public Vec4f div(float scalar) {
        if (scalar == 0.0f) {
            return new Vec4f();
        }

        scalar = 1.0f / scalar;

        float x = this.x() * scalar,
              y = this.y() * scalar,
              z = this.z() * scalar,
              w = this.w() * scalar;

        return new Vec4f(x, y, z, w);
    }

    /** Binary vector add. */
    public Vec4f add(Vec4f vec) {   
        float x = this.x() + vec.x(),
              y = this.y() + vec.y(),
              z = this.z() + vec.z(),
              w = this.w() + vec.w();

        return new Vec4f(x, y, z, w);
    }

    /** Binary vector subtract. */
    public Vec4f sub(Vec4f vec) {   
        float x = this.x() - vec.x(),
              y = this.y() - vec.y(),
              z = this.z() - vec.z(),
              w = this.w() - vec.w();

        return new Vec4f(x, y, z, w);
    }

    /** Negation operator. Returns the negative of the Vec4f. */
    public Vec4f neg() {
        return new Vec4f(-x(), -y(), -z(), -w());
    }
    
    /** Length of the vector = sqrt( vec . vec ) */
    public float length() {
        return _vec4f_length(handle);
    }
    
    /** Length squared of the vector = vec . vec */
    public float length2() {
        return _vec4f_length2(handle);
    }

    /** Normalize the vector so that it has length unity.
      * Returns the previous length of the vector.
    */
    public float normalize() {
        return _vec4f_normalize(handle);
    }

    /** Normalize the vector.
      * Returns new normalized vector.
    */
    public Vec4f normalize2() {
        Vec4f normal = this.cpy();
        normal.normalize();
        return normal;
    }
}
