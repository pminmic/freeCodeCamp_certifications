const num = 20;

function factorialCalculator(fact) {
  let result = 1;
  for (let i = 1; i <= fact; i++) {
    result *= i;
  }
  return result;
}

const factorial = factorialCalculator(num);
const resultMsg = `Factorial of ${num} is ${factorial}`;
console.log(resultMsg);
