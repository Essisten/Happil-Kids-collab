#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0;
image_index = choose(0, 2);
if (y <= 32 or place_meeting(x, y - 1, objBlockIntroE))
    image_index += 1;
