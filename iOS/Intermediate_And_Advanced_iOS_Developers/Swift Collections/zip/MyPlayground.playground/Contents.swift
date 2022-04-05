import UIKit

let students = ["Alex", "Mary", "John", "Steven"]
let grades = [3.4, 2.8, 3.8, 4]

let pair = zip(students, grades)

for studentAndGrade in pair {
    print(studentAndGrade.0) //students
    print(studentAndGrade.1) //grades
}
