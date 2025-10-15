function mutation(arr) {
  const first = arr[0].toLowerCase();
  const second = arr[1].toLowerCase();
  let count = 0;
  
  for (const char of second) {
    if (first.includes(char)) {
      count++;
      console.log(char);
    }
  }
  return count >= second.length;
}
