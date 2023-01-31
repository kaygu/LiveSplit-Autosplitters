state("RT_RW-Win64-Shipping")
{
  int levelCounter: 0x03029A38, 0x10, 0x58, 0x9C8;
  // todo:
  // - find values:
  // -- new game
  // -- start countdown
  // -- fade to text (end)
}

init
{
  vars.oldSplit = 0;
  vars.split = 0;
}

start
{
  // Should start timer once the couldown is finished in start room, or 30ish seconds avfter black text
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