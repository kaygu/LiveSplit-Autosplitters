// Made by Kaygu
// Currently this autoloader splits every puzzle room but start and last split are NOT working
// If you have any questions or requests leave an issue on github or contact me on twitter @kaaygu
// I'm not reverse engineering this game to improve the autoloader unless this category becomes more popular


state("RT_RW-Win64-Shipping")
{
  int levelCounter: 0x03029A38, 0x10, 0x58, 0x9C8;
  // todo:
  // - find values:
  // -- new game (auto reset)
  // -- start countdown (start)
  // -- fade to text (last split)
}

init
{
  vars.oldSplit = 0;
  vars.split = 0;
}

start
{
  // Should start timer once the couldown is finished in start room, or 30ish seconds after black text
}

update
{
  if (current.levelCounter == 101 || current.levelCounter == 38) { // todo: remove magic numbers to consts ? 
    // dont update vars.split in these rooms
    return false;
  }
  if (current.levelCounter > old.levelCounter && current.levelCounter > vars.split) {
    vars.split++;
    print("Split nbr: " + vars.split.ToString() + ", " + current.levelCounter.ToString());
  }
}

split
{
  if (vars.split > vars.oldSplit) {
    vars.oldSplit++;
    return true;
  }
}

reset
{
  // should reset when pressing "New Game" but idk how to find that trigger yet
}

onReset 
{
  print("Timer has been reset");
  // Reset split vars
  vars.oldSplit = 0;
  vars.split = 0;
}