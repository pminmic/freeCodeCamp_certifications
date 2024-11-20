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
    first_letter_actual_day = ''
    if starting_day != '':
        first_letter_actual_day = starting_day[0].upper()
        if first_letter_actual_day == 'S':
            first_letter_actual_day = starting_day[1].upper()
        elif first_letter_actual_day == 'T':
            first_letter_actual_day = starting_day[3].upper()
        starting_day = days[first_letter_actual_day]

    #when no duration is added
    if duration == '0:00':
        if starting_day != '':
            return start + ', ' + starting_day
        else:
            return start

    sum_of_hours = int(start_hours) + int(duration_hours)
    sum_of_minutes = int(start_minutes) + int(duration_minutes)

    #this ifs transform de sum variables to contains always 2 digits
    if len(str(sum_of_minutes)) == 1:
        sum_of_minutes = '0' + str(sum_of_minutes)
    
    #if the sum_of_minutes is more tha 60, we will have to adjust it
    if int(sum_of_minutes) >= 60:
        sum_of_hours = sum_of_hours + 1
        sum_of_minutes = sum_of_minutes - 60
    
    #sometimes the sum_of_minutes will have a 1 digit number
    if len(str(sum_of_minutes)) == 1:
        sum_of_minutes = '0' + str(sum_of_minutes)

    extra_days = 0
    if sum_of_hours < 12:
        new_time = str(sum_of_hours) + ':' + sum_of_minutes + ' ' + start_clock_format
        
    
    elif int(sum_of_hours) >= 12:
        hour = sum_of_hours % 12
        if hour == 0:
            hour = '12'
        
    
    
    
    if starting_day != '':
        new_time += ', ' + starting_day
    
    return new_time

print(add_time('7:55 AM', '3:12', 'monday'))
