function truncateString(word, num) {
  if (word.length > num) {
    const truncated = word.slice(0, num);
    return truncated + "...";
  }
  return word;
}
