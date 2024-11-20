#dictionary for the days of the week
days = {
    'M': 'Monday',
    'S': 'Tuesday',
    'W': 'Wednesday',
    'R': 'Thursday',
    'F': 'Friday',
    'A': 'Saturday',
    'U': 'Sunday'
}

def add_time(start, duration, starting_day = ''):
    new_time = ''

    #parameters from the start string variable
    start_time = start.split(' ')[0]
    start_clock_format = start.split(' ')[1]
    start_hours = start_time.split(':')[0]
    start_minutes = start_time.split(':')[1]
    
    #parameters from the duration stirng variable
    duration_hours = duration.split(':')[0]
    duration_minutes = duration.split(':')[1]

    #parameters for obtaining the starting day
    first_letter_actual_day = starting_day[0].upper()
    if first_letter_actual_day == 'S':
        first_letter_actual_day = starting_day[1].upper()
    elif first_letter_actual_day == 'T':
        first_letter_actual_day = starting_day[3].upper()
    starting_day = days[first_letter_actual_day]

    sum_of_hours = int(start_hours) + int(duration_hours)
    sum_of_minutes = int(start_minutes + duration_minutes)

    if sum_of_hours <= 12:
        if sum_of_minutes < 60:
            new_time = str(sum_of_hours) + ':' + str(sum_of_minutes) + ' ' + start_clock_format + ', ' + str(starting_day)


    
    print(new_time)
    return new_time

add_time('3:00 PM', '3:00', 'thurSday')