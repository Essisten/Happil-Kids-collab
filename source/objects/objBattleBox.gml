#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///https://fonts-online.ru/fonts/determination-rus-lyajka/download
image_xscale = 4;
image_yscale = 4;
size[0] = 0;
size[1] = 0;
scaleSpd = 16;
hideDarknessW = 100;
hideDarknessH = 30;
hideDarkness = false;
//box properties
box_width=0
box_height=0
box_angle=0
//box center x and y position
xx=x
yy=y
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Changing size of box

if (size[0] < box_width)
    box_width = max(size[0], box_width - scaleSpd);
else if (size[0] > box_width)
    box_width = min(size[0], box_width + scaleSpd);

if (size[1] < box_height)
    box_height = max(size[1], box_height - scaleSpd);
else if (size[1] > box_height)
    box_height = min(size[1], box_height + scaleSpd);

if (size[0] != box_width or size[1] != box_height)
    alarm[0] = 1;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///draw event
if (hideDarkness)
{
    var p1, p2;
    p1 = box_width / 2 + hideDarknessW;
    p2 = box_height / 2 + hideDarknessH;
    draw_set_color(c_black);
    draw_rectangle(x - p1, y - p2, x + p1, y - box_height / 2, false);  //top
    draw_rectangle(x - p1, y - box_height / 2, x - box_width / 2, y + box_height / 2, false);   //left
    draw_rectangle(x + box_width / 2, y - box_height / 2, x + p1, y + box_height / 2, false);   //right
    draw_rectangle(x - p1, y + box_height / 2, x + p1, y + p2 , false);  //bottom
}
draw_set_color(c_white)
var width;
width=5
d3d_transform_add_rotation_z(box_angle)
d3d_transform_add_translation(xx,yy,0)
i=0
repeat width*2{
    draw_rectangle(-box_width/2-i,-box_height/2-i,box_width/2+i,box_height/2+i,true)
    i+=0.5
}
d3d_transform_set_identity()
