#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
curInd = 0;
l = 1;
for (i = 0; i < 10; i += 1)
{
    px[i] = x;
    py[i] = y;
    ps[i] = 1;
    pt[i] = 0;
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (speed > 0)
{
    if (point_distance(x, y, px[curInd], py[curInd]) < ps[curInd])
    {
        speed = 0;
        x = px[curInd];
        y = py[curInd];
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for (i = 0; i < l; i+=1)
{
    tr = pt[i];
    if (global.trigger[tr])
    {
        pt[i] = 0;
        move_towards_point(px[i], py[i], ps[i]);
        curInd = i;
        exit;
    }
}
