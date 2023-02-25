import PySimpleGUI as sg
import store_face
import identify_face
from identify_face import Attendance

layout = [[sg.Button('Store face'), sg.Button('Take attendance')]]

record_layout = [[sg.Text('Enter name:'), sg.Input(key='-NAME-')],
                [sg.Button('Record Now'), sg.Button('Cancel')]]

attendance_layout = [[sg.Text('Enter your name:'), sg.Input(key='-NAME-')],
                [sg.Button('Take Attendance'), sg.Button('Cancel')]]

window = sg.Window('Face Attendance System', layout)

while True:
    event, values = window.read()
    if event == sg.WIN_CLOSED:
        break
    elif event == 'Store face':
        new_window = sg.Window('Recording Face', record_layout)
        while True:
            event, values = new_window.read()

            if event == sg.WIN_CLOSED or event == 'Cancel':
                break

            if event == 'Record Now':
                name = values['-NAME-']
                print(name)
                new_window.close()
                print(f'hello {name}')
                store_face.face_store(name)
                popup = sg.popup('Face stored successfully!')
                if popup == 'OK':
                    break

            if event == sg.WIN_CLOSED:
                break
    elif event == 'Take attendance':
        new_window = sg.Window('Recognizing face', attendance_layout)
        while True:
            event, values = new_window.read()

            if event == sg.WIN_CLOSED or event == 'Cancel':
                break

            if event == 'Take Attendance':
                name = values['-NAME-']
                print(name)
                new_window.close()
                print(f'hello {name}')
                attend = Attendance()
                attend.mark_attendance(name)
                msg = attend.result['message']
                popup = sg.popup(f'{msg}')
                if popup == 'OK':
                    break


window.close()