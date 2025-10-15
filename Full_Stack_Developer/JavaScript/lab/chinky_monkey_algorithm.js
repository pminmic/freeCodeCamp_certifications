function chunkArrayInGroups(arr, num) {
  let res = [];
  for (let i = 0; i < arr.length; i += num) {
    let chunck = arr.slice(i, i + num);
    res.push(chunck);
  }

  return res;
}
