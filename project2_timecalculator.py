#dictionary for the days of the week
days = {
    0 : 'Monday',
    1 : 'Tuesday',
    2 : 'Wednesday',
    3 : 'Thursday',
    4 : 'Friday',
    5 : 'Saturday',
    6 : 'Sunday',
    'M': 'Monday',
    'S': 'Tuesday',
    'W': 'Wednesday',
    'R': 'Thursday',
    'F': 'Friday',
    'A': 'Saturday',
    'U': 'Sunday'
}

clock_format = {
    '1': 'AM',
    '2': 'PM'
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
    if duration == '24:00' and starting_day == '':
        return start + ' (next day)'    

    sum_of_hours = int(start_hours) + int(duration_hours)
    sum_of_minutes = int(start_minutes) + int(duration_minutes)

    #if the sum_of_minutes is more tha 60, we will have to adjust it
    if int(sum_of_minutes) >= 60:
        sum_of_hours = sum_of_hours + 1
        sum_of_minutes = sum_of_minutes - 60
    
    #sometimes the sum_of_minutes will have a 1 digit number
    if len(str(sum_of_minutes)) == 1:
        sum_of_minutes = '0' + str(sum_of_minutes)

    extra_days = 0
    new_clock_format = ''

    if sum_of_hours < 12:
        new_time = str(sum_of_hours) + ':' + str(sum_of_minutes) + ' ' + start_clock_format
        if starting_day != '':
            new_time += ', ' + starting_day
    elif int(sum_of_hours) >= 12:
        hour = sum_of_hours % 24
        if hour == 0:
            hour = 12
            new_clock_format = start_clock_format
        elif hour < 12:
            new_clock_format = start_clock_format
        elif hour == 12:
            if start_clock_format == clock_format['1']:
                new_clock_format = clock_format['2']
            else:
                new_clock_format = clock_format['1']
        else:
            hour = hour - 12
            if start_clock_format == clock_format['1']:
                new_clock_format = clock_format['2']
            else:
                new_clock_format = clock_format['1']
        new_time = str(hour) + ':' + str(sum_of_minutes) + ' ' + new_clock_format

        if starting_day != '':
            finishing_day = ''
            if starting_day == 'Monday':
                starting_day = 0
            elif starting_day == 'Tuesday':
                starting_day = 1
            elif starting_day == 'Wednesday':
                starting_day = 2
            elif starting_day == 'Thursday':
                starting_day = 3
            elif starting_day == 'Friday':
                starting_day = 4
            elif starting_day == 'Saturday':
                starting_day = 5
            elif starting_day == 'Sunday':
                starting_day = 6
            if duration == '24:00':
                finishing_day = starting_day + 1
                new_time += ', ' + days[finishing_day] + ' (next day)'

            else:
                finishing_day = (int(starting_day + (int(sum_of_hours)/24)%7) + 1) % 7 
                new_time += ', ' + days[finishing_day]



    if (sum_of_hours >= 24 and start_clock_format == clock_format['1']) or (sum_of_hours >= 12 and start_clock_format == clock_format['2']):
        if sum_of_hours%24 >= 12:
            extra_days = int(sum_of_hours/24) + 1
            if extra_days > 1:
                new_time += ' (' + str(extra_days) + ' days later)'
            else:
                new_time += ' (next day)'

    
    return new_time

print(add_time('11:59 PM', '24:05', 'Wednesday'))
