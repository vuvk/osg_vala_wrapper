

extern void* _vec2f_new_from_float(float x, float y);
extern void  _vec2f_dispose(void* vec);
extern bool  _vec2f_equals(void* vec1, void* vec2);
extern bool  _vec2f_less(void* vec1, void* vec2);
extern void  _vec2f_set(void* vec, float x, float y);
extern float _vec2f_x(void* vec);
extern float _vec2f_y(void* vec);
extern bool  _vec2f_is_nan(void* vec);
extern bool  _vec2f_valid(void* vec);
extern float _vec2f_dot(void* vec1, void* vec2);
extern float _vec2f_length(void* vec);
extern float _vec2f_length2(void* vec);
extern float _vec2f_normalize(void* vec);


public class Vec2f : OSGObject {

    internal Vec2f.from_handle(void* handle) {
        base.from_handle(handle);
    }

    public Vec2f.from_vec2f(Vec2f vec) {
        this(vec.x(), vec.y());
    }

    public Vec2f(float x = 0, float y = 0) {
        this.from_handle(_vec2f_new_from_float(x, y));
    }

    protected override void dispose_handle () {
        _vec2f_dispose(handle);
    }

    ~Vec2f() {
        base.dispose();
    }

    public Vec2f cpy() {
        return new Vec2f.from_vec2f(this);
    }

    public bool equals(Vec2f vec) {
        return _vec2f_equals(handle, vec.handle);
    }

    public bool less(Vec2f vec) {
        return _vec2f_less(handle, vec.handle);
    }

    public void set_xy(float x, float y) {
        _vec2f_set(handle, x, y);
    }

    public float x() { return _vec2f_x(handle); }
    public float y() { return _vec2f_y(handle); }

    /** Returns true if all components have values that are not NaN. */
    public bool is_nan() {
        return _vec2f_is_nan(handle);
    }

    /** Returns true if at least one component has value NaN. */
    public bool valid() {
        return _vec2f_valid(handle);
    }
    
    /** Dot product. */
    public float dot(Vec2f vec) {
        return _vec2f_dot(handle, vec.handle);
    }

    /** Multiply by scalar. */
    public Vec2f mul(float scalar) {
        float x = this.x() * scalar,
              y = this.y() * scalar;

        return new Vec2f(x, y);
    }

    /** Divide by scalar. */
    public Vec2f div(float scalar) {
        if (scalar == 0.0f) {
            return new Vec2f();
        }

        scalar = 1.0f / scalar;

        float x = this.x() * scalar,
              y = this.y() * scalar;

        return new Vec2f(x, y);
    }

    /** Binary vector add. */
    public Vec2f add(Vec2f vec) {   
        float x = this.x() + vec.x(),
              y = this.y() + vec.y();

        return new Vec2f(x, y);
    }

    /** Binary vector subtract. */
    public Vec2f sub(Vec2f vec) {   
        float x = this.x() - vec.x(),
              y = this.y() - vec.y();

        return new Vec2f(x, y);
    }

    /** Negation operator. Returns the negative of the Vec2f. */
    public Vec2f neg() {
        return new Vec2f(-x(), -y());
    }
    
    /** Length of the vector = sqrt( vec . vec ) */
    public float length() {
        return _vec2f_length(handle);
    }
    
    /** Length squared of the vector = vec . vec */
    public float length2() {
        return _vec2f_length2(handle);
    }

    /** Normalize the vector so that it has length unity.
      * Returns the previous length of the vector.
    */
    public float normalize() {
        return _vec2f_normalize(handle);
    }

    /** Normalize the vector.
      * Returns new normalized vector.
    */
    public Vec2f normalize2() {
        Vec2f normal = this.cpy();
        normal.normalize();
        return normal;
    }
}
