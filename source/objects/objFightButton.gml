#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
stage = 1;
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(objBattleBox.x, objBattleBox.y, objFightAim);
selected = false;
with (objHeart)
{
    heartFrozen = true;
}
objBattleControllerE.selectedEnemy = line - 1;
