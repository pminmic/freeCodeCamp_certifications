def arithmetic_arranger(problems, show_answers=False):
    operator = ''
    operand_1 = ''
    operand_2 = ''
    answer = ''
    list_operand_1 = []
    list_operand_2 = []
    list_of_minus = []
    list_answers = []
    for problem in problems:
        problem_split = problem.split(' ')
        operand_1 = problem_split[0]
        operator = problem_split[1]
        operand_2 = problem_split[2]
        if len(problems) > 5:
            return 'Error: Too many problems.'
        elif not(operator == '+' or operator == '-'):
            return "Error: Operator must be '+' or '-'."
        elif len(operand_1) >= 5 or len(operand_2) >= 5:
            return 'Error: Numbers cannot be more than four digits.'
        elif not(operand_1.isnumeric() & operand_2.isnumeric()):
            return 'Error: Numbers must only contain digits.'
        answer = eval(problem)
        
        diflength =  len(operand_1) - len(operand_2)
        abs_diflength =  abs(diflength)
        if diflength < 0:
            list_operand_1.append('  ' + (' '*abs_diflength) + operand_1)
            list_operand_2.append(operator + ' ' + operand_2)
               
        elif diflength > 0:
            list_operand_1.append('  ' + operand_1)
            list_operand_2.append(operator + ' '+ (' '*abs_diflength) + operand_2)
            
        elif diflength == 0:
            list_operand_1.append('  ' + operand_1)
            list_operand_2.append(operator + ' ' + operand_2)
        
        list_of_minus.append('--'+ ('-'*max(len(operand_1),len(operand_2))))
        
        
        if len(str(answer)) > max(len(operand_1),len(operand_2)):
            list_answers.append(' ' + str(answer))
        elif len(str(answer)) < max(len(operand_1),len(operand_2)):
            list_answers.append(' ' + (' '*abs(len(str(answer)) - max(len(operand_1),len(operand_2)))) + str(answer))
        elif len(str(answer)) == max(len(operand_1),len(operand_2)):
            list_answers.append('  ' + str(answer))
        
        
    delimeter = '    '
    str_list_op_1 = delimeter.join(list_operand_1)
    str_list_op_2 = delimeter.join(list_operand_2)
    str_list_minus = delimeter.join(list_of_minus)
    str_list_ans = delimeter.join(list_answers)
    result = str_list_op_1 + '\n' + str_list_op_2 + '\n' + str_list_minus

    if show_answers:
        result += '\n' + str_list_ans


    return result
