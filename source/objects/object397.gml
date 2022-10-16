#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale = 4;
image_yscale = 4;
size[0] = 4;
size[1] = 4;
scaleSpd = 1;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Changing size of box

if (size[0] < image_xscale)
    image_xscale = max(size[0], image_xscale - scaleSpd);
else if (size[0] > image_xscale)
    image_xscale = min(size[0], image_xscale + scaleSpd);

if (size[1] < image_yscale)
    image_yscale = max(size[1], image_yscale - scaleSpd);
else if (size[1] > image_yscale)
    image_yscale = min(size[1], image_yscale + scaleSpd);

if (size[0] != image_xscale or size[1] != image_yscale)
    alarm[0] = 1;
