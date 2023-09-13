class Student{
  late int id;
  late String firstName;
  late String lastName;
  late int grade;
  late String status;

  Student(String firstName, String lastName, int grade){
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;

  }

  //named constructor
  Student.withId(int id, String firstName, String lastName, int grade){
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
}
String get getStatus{
    String message = "";
    if(this.grade>=50){
      message = "Geçti";
    }else if(this.grade>40){
      message = "Bütünlemeye Kaldı";
    }else{
      message = "Kaldı";
    }
    this.status = message;
    return this.status;
}
  }