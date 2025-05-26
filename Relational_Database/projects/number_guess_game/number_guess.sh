#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN_PROGRAM(){
  SECRET_NUMBER=$((1 + $RANDOM % 1000))
  echo "Enter your username:"
  read USERNAME
  RESULT_USERNAME_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

  if [[ -z $RESULT_USERNAME_ID ]]
  then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
    RESULT_USERNAME_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
  else
    GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id = '$RESULT_USERNAME_ID'")
    BEST_GAME=$($PSQL "SELECT number_tries FROM games WHERE user_id = $RESULT_USERNAME_ID ORDER BY number_tries LIMIT 1")
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi

  echo "Guess the secret number between 1 and 1000:"
  FOUND=0
  GUESSES=0
  while [[ $FOUND -eq 0 ]]
  do
    #echo $SECRET_NUMBER
    read GUESS
    if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
    else
      (( GUESSES++ ))

      if   (( GUESS < SECRET_NUMBER )); then
        echo "It's higher than that, guess again:"
      elif (( GUESS > SECRET_NUMBER )); then
        echo "It's lower than that, guess again:"
      else
        FOUND=1
        echo You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!
        INSERT_INTO_DB=$($PSQL "INSERT INTO games(number_tries, secret_number, user_id) VALUES($GUESSES, $SECRET_NUMBER, $RESULT_USERNAME_ID)") 
      fi
    fi
  done


}

MAIN_PROGRAM