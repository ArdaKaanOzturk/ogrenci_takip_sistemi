import 'package:flutter/material.dart';
import 'package:ogrenci_takip_sistemi/models/student.dart';
import 'package:ogrenci_takip_sistemi/screens/student_add.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //cupertiono
    return MaterialApp(home: HomeScreen());
  }
}
class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  List<Student> students = [
    Student.withId(1, "Engin", "Demiroğ", 95),
    Student.withId(2, "Berkay", "Bilgin", 45),
    Student.withId(3, "Kerem", "Varış", 25),
  ];

  Student selectedStudent = Student.withId(0, "Hiç Kimse", "", 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Öğrenci Takip Sistemi"),
        ),
        body: buildBody());
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  title: Text(students[index].firstName + " " + students[index].lastName),
                  subtitle: Text("Sınavdan Aldığı Not : " + students[index].grade.toString()+"["+students[index].getStatus+"]"),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2018/06/27/07/45/student/-3500990_960_720.jpg"),
                  ),
                  trailing: buildStatusIcon(students[index].grade),
                  onTap: (){
                    setState(() {
                      this.selectedStudent = students[index];
                    });

                    print(selectedStudent.firstName);
                  },
                  onLongPress: (){
                    print("Uzun Basıldı");
                  },
                );
              }),
        ),
        Text("Seçili Öğrenci " + selectedStudent.firstName),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.greenAccent,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(width: 5.0,),
                    Text("Yeni Öğrenci")
                  ],
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.black12,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(width: 5.0,),
                    Text("Güncelle")
                  ],
                ),
                onPressed: (){
                  print("Güncelle");
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.amberAccent,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(width: 5.0,),
                    Text("Sil")
                  ],
                ),
                onPressed: (){
                  print("Sil");
                },
              ),
            )
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
      if(grade>=50){
        return Icon(Icons.done);
      }else if(grade>=40){
        return Icon(Icons.album);
      }else{
        return Icon(Icons.clear);
      }
  }
}
