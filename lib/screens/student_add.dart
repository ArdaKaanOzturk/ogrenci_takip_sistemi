import 'package:flutter/material.dart';
import 'package:ogrenci_takip_sistemi/models/student.dart';

class StudentAdd extends StatefulWidget{

  late List<Student> students;
  //StudentAdd(List<Student> students){
   //this.students = students;
  //}

  StudentAdd(this.students);

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }

}

class _StudentAddState extends State<StudentAdd> {
  var formKey = GlobalKey<FormState>();
  Student student = Student("","",0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yeni Öğrenci"),),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton()
            ],
          ),
        ),
      ),
    );
  }

 Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Adı", hintText: "Arda"),
      onSaved: (String? value){
        student.firstName = value!;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Soyadı", hintText: "Öztürk"),
      onSaved: (String? value){
        student.lastName = value!;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldığı Not", hintText: "65"),
      onSaved: (String? value){
        student.grade = int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton(){
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: (){
        formKey.currentState?.save();
        widget.students.add(student);
        Navigator.pop(context);
      },
    );
  }

}