function findLongestWordLength(sentence) {
  const words = sentence.split(" ");
  let largest = words[0];
  for (let i = 1; i < words.length; i++) {
    if (largest.length < words[i].length) {
      largest = words[i];
    }
  }
  return largest.length;
}

