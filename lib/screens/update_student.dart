import 'package:StudentDB/models/student.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class UpdateStudent extends StatefulWidget {
  List<Student> students;
  var student = Student.withId(0, "", "", 0);

  UpdateStudent(this.students, this.student);

  @override
  _UpdateStudentState createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<UpdateStudent> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: buildBody(),
        bottomNavigationBar: buildBottomNavigationBar());
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Update Student"),
    );
  }

  Container buildBody() {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: buildBodyForm(),
    );
  }

  Form buildBodyForm() {
    return Form(
      key: formKey,
      child: buildBodyFormColumn(),
    );
  }

  Column buildBodyFormColumn() {
    return Column(
      children: [
        buildFirstNameTextFormField(),
        buildLastNameTextFormField(),
        buildGradeTextFormField()
      ],
    );
  }

  TextFormField buildFirstNameTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "${widget.student.firstName}",
        enabled: false,
      ),
    );
  }

  TextFormField buildLastNameTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "${widget.student.lastName}",
        enabled: false,
      ),
    );
  }

  TextFormField buildGradeTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Grade",
        hintText: "${widget.student.grade}",
      ),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      maxLength: 3,
      onSaved: (String value) {
        widget.student.grade = int.parse(value);
      },
    );
  }

  FlatButton buildBottomNavigationBar() {
    return FlatButton(
      child: Text('Update'),
      color: Colors.blueAccent,
      textColor: Colors.white,
      onPressed: () {
        formKey.currentState.save();

        var index =
            widget.students.indexWhere((item) => item.id == widget.student.id);

        widget.students.replaceRange(index, index + 1, [widget.student]);

        Navigator.pop(context);
      },
    );
  }
}
