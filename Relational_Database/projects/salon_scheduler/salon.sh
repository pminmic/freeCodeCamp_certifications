#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n ~~~~~ Salon Appointment Scheduler ~~~~~\n"

RENT_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  # services
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

  # display services
  echo -e "\nHere are the services available:"
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  # selection of the service
  read SERVICE_ID_SELECTED
  
  # if the selection is not valid
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    RENT_MENU "This is not a valid service number"
  else
    # see if the service is available
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nHey! You are new! What is your name?"
      read CUSTOMER_NAME
      INSERT_NEW_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
      
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      echo -e "\nNow you are registered! Let's continue!"
      
    fi
    SERVICE_NAME_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    echo -e "\nAt what time would you like to have your $SERVICE_NAME_SELECTED?"
    read SERVICE_TIME
    RESULT_INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    echo -e "\nI have put you down for a $SERVICE_NAME_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."

  fi
}

RESERVATIONS_MENU() {
  echo funciona
}

EXIT() {
  echo -e "\nThank you for stopping in.\n"
}

RENT_MENU