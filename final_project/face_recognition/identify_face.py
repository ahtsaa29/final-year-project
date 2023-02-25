# It helps in identifying the faces
import cv2, numpy, os
import datetime, json

haar_file = "haarcascade_frontalface_default.xml"
face_cap = cv2.CascadeClassifier(haar_file)
datasets = "DATASETS"
video_cap = cv2.VideoCapture(0)
timesheets = "TIMESHEETS"


class Attendance:
    def __init__(self):
        self.name = ""
        self.message = ""
        self.now = ""
        self.result = {}

    def face_identify(self, name):
        # name = input("Enter your name: ... ").capitalize()
        print("Recognizing Face Please Be in sufficient Lights...")

        # Create a list of images and a list of corresponding names
        (images, labels, names, id) = ([], [], {}, 0)
        for (subdirs, dirs, files) in os.walk(datasets):
            for subdir in dirs:
                names[id] = subdir
                subjectpath = os.path.join(datasets, subdir)
                for filename in os.listdir(subjectpath):
                    path = subjectpath + "/" + filename
                    label = id
                    images.append(cv2.imread(path, 0))
                    labels.append(int(label))
                id += 1
        (width, height) = (130, 100)

        # Create a Numpy array from the two lists above
        (images, labels) = [numpy.array(series) for series in [images, labels]]

        # Training model
        model = cv2.face.LBPHFaceRecognizer_create()
        model.train(images, labels)

        # Part 2: Use fisherRecognizer on camera stream
        while True:
            (_, cap_data) = video_cap.read()
            col = cv2.cvtColor(cap_data, cv2.COLOR_BGR2GRAY)
            faces = face_cap.detectMultiScale(col, 1.3, 5)
            for (x, y, w, h) in faces:
                cv2.rectangle(cap_data, (x, y), (x + w, y + h), (255, 0, 0), 2)
                face = col[y : y + h, x : x + w]
                face_resize = cv2.resize(face, (width, height))
                # Try to recognize the face
                prediction = model.predict(face_resize)
                cv2.rectangle(cap_data, (x, y), (x + w, y + h), (0, 255, 0), 3)

                if prediction[1] < 500:
                    cv2.putText(
                        cap_data,
                        "% s - %.0f" % (names[prediction[0]], prediction[1]),
                        (x - 10, y - 10),
                        cv2.FONT_HERSHEY_PLAIN,
                        2,
                        (255, 255, 255),
                    )
                else:
                    cv2.putText(
                        cap_data,
                        "not recognized",
                        (x - 10, y - 10),
                        cv2.FONT_HERSHEY_PLAIN,
                        1,
                        (255, 0, 0),
                    )

                if names[prediction[0]] == name and prediction[1] > 50.0:
                    # print("Match")
                    now = datetime.datetime.now()
                    date = now.strftime("%x")
                    time = now.strftime("%H:%M:%S")
                    message = "Your attendance has been recorded"
                    result = {
                        "name": name,
                        "message": "Your Attendance has been recorded",
                        "date": date,
                        "time": time,
                    }
                    self.result = result
                    return result

                else:
                    # print("Cant give access sorry")
                    message = "Your attendance can't be recorded"
                    date = None
                    time = None
                    result = {"name": None, "message": message}
                    print(result["message"])
                    self.result = result
                    return result

            cv2.imshow("Recognizing face", cap_data)
        

    def update_attendance(self, name, new_message, new_date, new_time):
        self.name = name
        self.message = new_message
        self.date = new_date
        self.time = new_time

    def record_attendance(self, person):
        check_sheet = timesheets + "/" + person + ".txt"
        if os.path.isfile(check_sheet) == True:
            with open(check_sheet, "r") as file:
                lines = file.readlines()
                if lines:
                    # print("lines exists")
                    last_line = lines[-1]
                    # print(last_line)
                    data = eval(last_line)
                    # print(data)
                    key = "date"
                    if key in data:
                        last_date = str(data[key])
                        # print(last_date)
                        new_date = str(self.result["date"])
                        # print(new_date)
                        if last_date != new_date:
                            print(last_date != new_date)
                            print(last_date == new_date)
                            login_data = json.dumps(self.result)
                            # print("else body")
                            time_sheet = check_sheet
                            with open(time_sheet, "a") as fo:
                                fo.write("\n" +login_data)
                                # print(fo.read)
                            # print("Data written successfully")
                            message = "Your attendance for today has been updated"

                        else:
                            # print(True)
                            # print("Your attendance for today has already been recorded")
                            message = "Your attendance for today has already been recorded"
                else:
                    # print("lines dont exist")
                    login_data = json.dumps(self.result)
                    # print("else body")
                    time_sheet = check_sheet
                    with open(time_sheet, "a") as fo:
                        fo.write("\n" +login_data)
                        print(fo.read)
                    # print("Data written successfully")
                    message = "Your attendance for today has been updated"

        return message

    
    def mark_attendance(self, name):
        self.face_identify(name)
        if self.result["name"] != None:
            person = self.result["name"]
            self.record_attendance(person)
            cv2.destroyAllWindows()



# attend = Attendance()
# attend.mark_attendance()