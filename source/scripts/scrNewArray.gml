///scrNewArray(array, item1, item2, ..., item16)
///Creating new array and returns it
//THIS SHITTY FUNCTION DOESN'T WORK IN GM8 FUCK YOU

if (argument_count == 0)
    return -1;
for (i = 0; i < argument_count - 1; i+=1)
{
    argument0[i] = argument[i + 1];
}
