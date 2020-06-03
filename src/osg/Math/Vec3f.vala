

extern void* _vec3f_new_from_float(float x, float y, float z);
extern void  _vec3f_dispose(void* vec);
extern bool  _vec3f_equals(void* vec1, void* vec2);
extern bool  _vec3f_less(void* vec1, void* vec2);
extern void  _vec3f_set(void* vec, float x, float y, float z);
extern float _vec3f_x(void* vec);
extern float _vec3f_y(void* vec);
extern float _vec3f_z(void* vec);
extern bool  _vec3f_is_nan(void* vec);
extern bool  _vec3f_valid(void* vec);
extern float _vec3f_dot(void* vec1, void* vec2);
extern float _vec3f_length(void* vec);
extern float _vec3f_length2(void* vec);
extern float _vec3f_normalize(void* vec);


public class Vec3f : OSGObject {

    internal Vec3f.from_handle(void* handle) {
        base.from_handle(handle);
    }

    public Vec3f.from_vec3f(Vec3f vec) {
        this(vec.x(), vec.y(), vec.z());
    }

    public Vec3f.from_vec2f(Vec2f vec, float z) {
        this(vec.x(), vec.y(), z);
    }

    public Vec3f(float x = 0, float y = 0, float z = 0) {
        this.from_handle(_vec3f_new_from_float(x, y, z));
    }

    protected override void dispose_handle () {
        _vec3f_dispose(handle);
    }

    ~Vec3f() {
        base.dispose();
    }

    public Vec3f cpy() {
        return new Vec3f.from_vec3f(this);
    }

    public bool equals(Vec3f vec) {
        return _vec3f_equals(handle, vec.handle);
    }

    public bool less(Vec3f vec) {
        return _vec3f_less(handle, vec.handle);
    }

    public void set_xyz(float x, float y, float z) {
        _vec3f_set(handle, x, y, z);
    }

    public float x() { return _vec3f_x(handle); }
    public float y() { return _vec3f_y(handle); }
    public float z() { return _vec3f_z(handle); }

    /** Returns true if all components have values that are not NaN. */
    public bool is_nan() {
        return _vec3f_is_nan(handle);
    }

    /** Returns true if at least one component has value NaN. */
    public bool valid() {
        return _vec3f_valid(handle);
    }
    
    /** Dot product. */
    public float dot(Vec3f vec) {
        return _vec3f_dot(handle, vec.handle);
    }

    /** Multiply by scalar. */
    public Vec3f mul(float scalar) {
        float x = this.x() * scalar,
              y = this.y() * scalar,
              z = this.z() * scalar;

        return new Vec3f(x, y, z);
    }

    /** Divide by scalar. */
    public Vec3f div(float scalar) {
        if (scalar == 0.0f) {
            return new Vec3f();
        }

        scalar = 1.0f / scalar;

        float x = this.x() * scalar,
              y = this.y() * scalar,
              z = this.z() * scalar;

        return new Vec3f(x, y, z);
    }

    /** Binary vector add. */
    public Vec3f add(Vec3f vec) {   
        float x = this.x() + vec.x(),
              y = this.y() + vec.y(),
              z = this.z() + vec.z();

        return new Vec3f(x, y, z);
    }

    /** Binary vector subtract. */
    public Vec3f sub(Vec3f vec) {   
        float x = this.x() - vec.x(),
              y = this.y() - vec.y(),
              z = this.z() - vec.z();

        return new Vec3f(x, y, z);
    }

    /** Negation operator. Returns the negative of the Vec3f. */
    public Vec3f neg() {
        return new Vec3f(-x(), -y(), -z());
    }
    
    /** Length of the vector = sqrt( vec . vec ) */
    public float length() {
        return _vec3f_length(handle);
    }
    
    /** Length squared of the vector = vec . vec */
    public float length2() {
        return _vec3f_length2(handle);
    }

    /** Normalize the vector so that it has length unity.
      * Returns the previous length of the vector.
    */
    public float normalize() {
        return _vec3f_normalize(handle);
    }

    /** Normalize the vector.
      * Returns new normalized vector.
    */
    public Vec3f normalize2() {
        Vec3f normal = this.cpy();
        normal.normalize();
        return normal;
    }
}
