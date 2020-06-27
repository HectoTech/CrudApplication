//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
   theme: ThemeData(
     brightness: Brightness.light,
     primaryColor: Colors.blue[900],
     accentColor: Colors.cyan[500],
   ),
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String studentName,studentId,studentProgramId;
  double studentGPA;

  getStudentName(name){
     this.studentName = name;
  }

  getStudentId(id){
    this.studentId = id;
  }

  getStudentProgramId(ProgramId){
    this.studentProgramId = ProgramId;
  }

  getStudentGPA(GPA){
    this.studentGPA = double.parse(GPA);
  }

  createData(){
   // print("Create");

    DocumentReference documentReference = Firestore.instance.collection("MyStudent").document(studentName);
    Map<String, dynamic> students = {
      "studentName": studentName,
      "studentID": studentId,
      "studentProgramID": studentProgramId,
      "studentGPA": studentGPA
    };
    documentReference.setData(students).whenComplete(() {
       print("$studentName created") ;
    });
  }

  readData(){
    //print("Read");
    DocumentReference documentReference = Firestore.instance.collection("MyStudent").document(studentName);
    documentReference.get().then((datasnapshot) {
      print(datasnapshot.data["studentName"]);
      print(datasnapshot.data["studentID"]);
      print(datasnapshot.data["studentProgramID"]);
      print(datasnapshot.data["studentGPA"]);
    });
  }

  updateData(){
    //print("Update");
    DocumentReference documentReference = Firestore.instance.collection("MyStudent").document(studentName);
    Map<String, dynamic> students = {
      "studentName": studentName,
      "studentID": studentId,
      "studentProgramID": studentProgramId,
      "studentGPA": studentGPA
    };
    documentReference.setData(students).whenComplete(() {
      print("$studentName updated") ;
    });
  }

  deleteData(){
    //print("Delete ");
    DocumentReference documentReference = Firestore.instance.collection("MyStudent").document(studentName);
    documentReference.delete().whenComplete(() {
      print("$studentName deleted") ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Curd App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child:ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom:4.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Name",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                     color: Colors.blue,
                     width:2.0,
                    ),
                  ),
                ),
                onChanged: (String name){
                    getStudentName(name);
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom:4.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Student Id",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width:2.0,
                    ),
                  ),
                ),
                onChanged: (String id){
                  getStudentId(id);
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom:4.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Study Program Id",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width:2.0,
                    ),
                  ),
                ),
                onChanged: (String ProgramId){
                  getStudentProgramId(ProgramId);
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom:2.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "GPA",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width:2.0,
                    ),
                  ),
                ),
                onChanged: (String GPA){
                  getStudentGPA(GPA);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    color: Colors.blue[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Text("Create"),
                    textColor: Colors.white,
                    onPressed: (){
                      createData();
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.all(2.0),),
                Expanded(
                  child: RaisedButton(
                    color: Colors.green[900],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: Text("Read"),
                    textColor: Colors.white,
                    onPressed: (){
                      readData();
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.all(2.0),),

                Expanded(
                  child: RaisedButton(
                    color: Colors.red[900],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: Text("Update"),
                    textColor: Colors.white,
                    onPressed: (){
                      updateData();
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.all(2.0),),

                Expanded(
                  child: RaisedButton(
                    color: Colors.orange[900],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: Text("Delete"),
                    textColor: Colors.white,
                    onPressed: (){
                      deleteData();
                    },
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Expanded(child: Text("Name",style: TextStyle(color: Colors.blue[900],fontWeight: FontWeight.w900))),
                  Expanded(child: Text("Student ID",style: TextStyle(color: Colors.blue[900],fontWeight: FontWeight.w900))),
                  Expanded(child: Text("Program ID",style: TextStyle(color: Colors.blue[900],fontWeight: FontWeight.w900))),
                  Expanded(child: Text("GPA",style: TextStyle(color: Colors.blue[900],fontWeight: FontWeight.w900))),
                ],
              ),
            ),

            StreamBuilder(
              stream: Firestore.instance.collection("MyStudent").snapshots(),
              builder: (context, snapshot){
                // ignore: missing_return
                if(snapshot.hasData){
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index){
                        DocumentSnapshot documentSnapshot = snapshot.data.documents[index];
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: <Widget>[

                              Expanded(
                                child: Text(documentSnapshot["studentName"],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900)),
                              ),

                              Expanded(
                                child: Text(documentSnapshot["studentID"],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900)),
                              ),

                              Expanded(
                                child: Text(documentSnapshot["studentProgramID"],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900)),
                              ),

                              Expanded(
                                child: Text(documentSnapshot["studentGPA"].toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900)),
                              ),
                            ],
                          ),
                        );
                        }
                  );
                }
                else{
                  return Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
