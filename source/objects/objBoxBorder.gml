#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_exists(objBattleControllerE))
{
    if (image_angle == 0)
    {
        if (x < 400)
            image_xscale = objBattleControllerE.boxPoint[1] - x;
    }
}
