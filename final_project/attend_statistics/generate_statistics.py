import os
from rest_framework import status
from rest_framework.response import Response


class AttendanceData:
    def __init__(self):
        self.data = []
    def get_data(self):
        directory = "./face_recognition/TIMESHEETS"
        file_names = []
        attendance_list = []
        for filename in os.listdir(directory):
            if filename.endswith(".txt"):
                file_names.append(filename)
        for file in file_names:
            # print(file)
            file_path = os.path.join(directory, file)
            with open(file_path, "r") as fo:
                contents = fo.read()
                # print(contents)
                attendance = contents.split("\n")
                # print(attendance_list)
            attendance_list.append(attendance)

        return attendance_list

    
    def gen_dataset(self):
        result = {}
        data = self.get_data()
        for sub_lst in data:
            for string in sub_lst:
                if string:
                    dct = eval(string)
                    name = dct['name']
                    date = dct['date']
                    time = dct['time']
                    if name not in result:
                        result[name] = {'dates': [date], 'times': [time]}
                    else:
                        result[name]['dates'].append(dct['date'])
                        result[name]['times'].append(dct['time'])
        # print(result)
        return result
        

statis = AttendanceData()
x = statis.gen_dataset()
print(x)
