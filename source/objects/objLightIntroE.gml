#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
d = 1;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sin(degtorad(d)) < 0)
    instance_destroy();
draw_set_alpha(sin(degtorad(d)));
draw_rectangle_color(view_xview[0], view_yview[0], view_wview[0], view_hview[0], c_white, c_white, c_white, c_white, false);
draw_set_alpha(1);
d += 16;
