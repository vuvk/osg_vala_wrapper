
extern void _display_settings_set_minimum_num_stencil_bits(int num);
public class DisplaySettings : Object {
    private DisplaySettings() {}

    public static void set_minimum_num_stencil_bits(int num) {
        _display_settings_set_minimum_num_stencil_bits(num);
    }
} 