#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
mcount = instance_number(objMovingE);
mbcount = instance_number(objMovingBlockE);
for (i = 0; i < mcount; i+=1)
{
    mblock[i] = instance_find(objMovingE, i);
}
for (i = mcount; i < mcount + mbcount; i+=1)
{
    mblock[i] = instance_find(objMovingBlockE, i - mcount);
}
for (i = 0; i < 100; i += 1)
{
    global.trigger[i] = false;
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for (i = 0; i < mcount + mbcount; i+=1)
{
    with (mblock[i])
    {
        event_user(0);
    }
}
