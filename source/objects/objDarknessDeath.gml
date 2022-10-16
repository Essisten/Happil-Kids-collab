#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spd = 0.05;
image_alpha = 0;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha = image_alpha + spd;
draw_set_alpha(image_alpha);
draw_set_color(c_black);
draw_rectangle(view_xview[0], view_yview[0], view_wview[0], view_hview[0], false);
draw_set_alpha(1);
if ((spd > 0 and image_alpha >= 1) or (spd < 0 and image_alpha <= 0))
    spd = 0;
