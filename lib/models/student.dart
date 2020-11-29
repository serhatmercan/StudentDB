class Student {
  int id;
  String firstName;
  String lastName;
  int grade;

  Student(String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  Student.withId(int id, String firstName, String lastName, int grade) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  String get getStatu {
    if (this.grade < 50) {
      return "Failed";
    } else {
      return "Passed";
    }
  }
}
