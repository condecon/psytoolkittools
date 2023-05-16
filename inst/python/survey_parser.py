class Question:
    label:str = ""
    type:str = ""
    question:str = ""
    awnsers:list[str] = []



def parse(tempdir:str) -> list[Question]:
    document:list[Question] = []

    file = open(f"psy_data\\survey.txt")
    survey_string_list = file.readlines()


    #remove all empty lines
    survey_string_list = [x for x in survey_string_list if x != "\n"]
    
    question = Question()
    #loop document
    line_index = 0
    for line in survey_string_list:
        if line.startswith("l:"):
            question_label = line.replace("l: ", "")
            #question_label = line.replace("\n", "")
            question.label = question_label

        if line.startswith("t:"):
            question_type = line.replace("t: ", "")
            question.type = question_type

        if line.startswith("q:"):
            question.question = line.replace("q: ", "")

        if line.startswith("-"):
            question.awnsers.append(line.replace("- ", ""))
        
        #check for question end
        #question ended when the beginning of the next line is "l: "
        try:
            if survey_string_list[line_index + 1].startswith("l:"):
                #save question
                document.append(question)
                #create new question variable
                question = Question()
                question.awnsers = []
        except IndexError:
                document.append(question)
                

        line_index = line_index + 1
        


    #return
    return document
