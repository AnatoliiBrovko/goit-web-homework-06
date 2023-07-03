from datetime import datetime, date, timedelta

from random import randint, choice
import sqlite3

from faker import Faker

disciplines = [
    "Astronomy",
    "Biology",
    "Chemistry",
    "Computer science",
    "Law",
    "Physics",
    "Science",
    "Maths"
]


groups = ['8.06.051.100.D.22.1', '6.03.075.010.19.2', '6.06.241.010.20.3']
NUMBER_LECTURERS = 5
NUMBER_STUDENTS = 50
fake = Faker()
connect = sqlite3.connect('hw6.db')
cur = connect.cursor()


def seed_lecturers():
    lecturers = [fake.name() for _ in range(NUMBER_LECTURERS)]
    sql = "INSERT INTO lecturers(fullname) VALUES(?);"
    cur.executemany(sql, zip(lecturers,))


def seed_disciplines():
    sql = "INSERT INTO disciplines(name, lecturers_id) VALUES(?, ?);"
    cur.executemany(sql, zip(disciplines, iter(randint(1, NUMBER_LECTURERS) for _ in range(len(disciplines)))))


def seed_groups():
    sql = "INSERT INTO groups(name) VALUES(?);"
    cur.executemany(sql, zip(groups,))


def seed_students():
    students = [fake.name() for _ in range(NUMBER_STUDENTS)]
    sql = "INSERT INTO students(fullname, group_id) VALUES(?, ?);"
    cur.executemany(sql, zip(students, iter(randint(1, len(groups)) for _ in range(len(students)))))


def seed_grades_book():
    start_date = datetime.strptime("2022-09-01", "%Y-%m-%d")
    end_date = datetime.strptime("2023-06-15", "%Y-%m-%d")
    sql = "INSERT INTO grades_book(discipline_id, student_id, grade, date_of) VALUES(?, ?, ?, ?);"

    def get_list_date(start: date, end: date) -> list[date]:
        result = []
        current_date = start
        while current_date <= end:
            if current_date.isoweekday() < 6:
                result.append(current_date)
            current_date += timedelta(1)
        return result

    list_dates = get_list_date(start_date, end_date)

    grades = []
    for day in list_dates:
        random_discipline = randint(1, len(disciplines))
        random_students = [randint(1, NUMBER_STUDENTS) for _ in range(6)]
        for student in random_students:
            grades.append((random_discipline, student, randint(1, 200), day.date()))
    cur.executemany(sql, grades)


if __name__ == '__main__':
    try:
        seed_lecturers()
        seed_disciplines()
        seed_groups()
        seed_students()
        seed_grades_book()
        connect.commit()
    except sqlite3.Error as error:
        print(error)
    finally:
        connect.close()
