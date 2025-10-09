function maskEmail(email) {
  const pos = email.indexOf("@");
  const domain = email.slice(pos, email.length);
  const name = email.slice(0, pos);
  const firstLetter = name[0];
  const lastLetter = name[name.length - 1];
  const mask = firstLetter + "*".repeat(name.length-2) + lastLetter + domain;
  return mask;

  
}

const email = "myEmail@email.com";

console.log(maskEmail(email));
