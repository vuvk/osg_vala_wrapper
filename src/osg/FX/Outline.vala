
extern void* _outline_new();
extern void  _outline_set_width(void* outline, float w);
extern void  _outline_set_color(void* outline, void* vec4f);
extern void  _outline_add_child(void* outline, void* node);

public class Outline : Effect {

    internal Outline.from_handle(void* handle) {
        base.from_handle(handle);
    }

    public Outline () {
        handle = _outline_new();
    }

    public void set_width(float width) {
        _outline_set_width(handle, width);
    }

    public void set_color(Vec4f color) {
        _outline_set_color(handle, color.handle);
    }

    public override void add_child(Node child) {
        _outline_add_child(handle, child.handle);
    }
}