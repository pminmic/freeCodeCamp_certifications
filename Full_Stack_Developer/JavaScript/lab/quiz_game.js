const questions = [];

const question1 = {
  category: "General Culture",
  question: "How many days have a leap year?",
  choices: ["364", "365", "366"],
  answer: "366"
}

const question2 = {
  category: "Science",
  question: "How many legs has a spider?",
  choices: ["6", "8", "4"],
  answer: "8"
}

const question3 = {
  category: "History",
  question: "Who discovered America?",
  choices: ["Napoleon", "Freddy Mercury", "Colón"],
  answer: "Colón"
}

const question4 = {
  category: "Computer Science",
  question: "How many bits have a byte?",
  choices: ["2 bits", "4 bits", "8 bits"],
  answer: "4 bits"
}

const question5 = {
  category: "Art",
  question: "Which of these is a primary color?",
  choices: ["yellow", "white", "brown"],
  answer: "yellow"
}

questions.push(question1, question2, question3, question4, question5);

function getRandomQuestion(questions) {
  return questions[Math.floor(Math.random() * questions.length)];
}

function getRandomComputerChoice(choices) {
  return choices[Math.floor(Math.random() * choices.length)];
}

function getResults(question, choice) {
  if (question.answer === choice) {
    return "The computer's choice is correct!";
  }
  return `The computer's choice is wrong. The correct answer is: ${question.answer}`;
}
