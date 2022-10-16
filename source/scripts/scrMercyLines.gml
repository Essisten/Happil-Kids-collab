///scrMercyLines
///Dialogue in case player doing mercy

switch (mercy)
{
    case 1:
        scrBubbleText(1, objEssisten.x + 50, objEssisten.y - 100, "...");
        break;
    case 2:
        scrBubbleText(1, objEssisten.x + 50, objEssisten.y - 100, "Hmm...?");
        break;
    default:
        nothing = true;
        break;
}
