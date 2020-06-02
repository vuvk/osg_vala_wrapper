
#include <osg/DisplaySettings>

extern "C" 
{

void _display_settings_set_minimum_num_stencil_bits(int num)
{
    osg::DisplaySettings::instance()->setMinimumNumStencilBits(num);
}

}
