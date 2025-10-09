function confirmEnding(str1, str2) {
  const len = str2.length;
  const end = str1.slice(str1.length - len, str1.length);
  return end === str2;
}

