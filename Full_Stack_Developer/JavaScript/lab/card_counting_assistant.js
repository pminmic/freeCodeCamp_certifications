let count = 0;

function cc(card) {
  if (card >= 2 && card <= 10) {
    if (card >= 2 && card <= 6) {
      count += 1;
    }
    else if (card == 10) {
      count -= 1;
    }
  }
  else {
    count -= 1;
  }

  if (count > 0) {
    return count + " Bet";
  }
  else {
    return count + " Hold";
  }
}
