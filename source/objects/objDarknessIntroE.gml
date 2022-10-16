#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
a = 0;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Drawing darkness
a += 2;
draw_set_alpha(abs(sin(degtorad(a))) * 0.4);
draw_set_color(c_black);
draw_rectangle(view_xview[0], view_yview[0], view_wview[0], view_hview[0], false);
draw_set_alpha(1);
