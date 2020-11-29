import 'package:StudentDB/models/student.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class AddStudent extends StatefulWidget {
  List<Student> students;

  AddStudent(this.students);

  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  var formKey = GlobalKey<FormState>();
  var student = Student("", "", 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("New Student"),
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
        buildBodyFormColumnTextFormFieldFirstName(),
        buildBodyFormColumnTextFormFieldLastName(),
        buildBodyFormColumnTextFormFieldGrade(),
        buildBodyFormColumnRaisedButtonSave()
      ],
    );
  }

  TextFormField buildBodyFormColumnTextFormFieldFirstName() {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter First Name",
      ),
      onSaved: (value) {
        student.firstName = value;
      },
    );
  }

  TextFormField buildBodyFormColumnTextFormFieldLastName() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter Last Name",
      ),
      onSaved: (value) {
        student.lastName = value;
      },
    );
  }

  TextFormField buildBodyFormColumnTextFormFieldGrade() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Grade",
        hintText: "Grade",
      ),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      maxLength: 3,
      onSaved: (value) {
        student.grade = int.parse(value);
      },
    );
  }

  RaisedButton buildBodyFormColumnRaisedButtonSave() {
    return RaisedButton(
      child: Text("Save"),
      onPressed: () {
        formKey.currentState.save();
        widget.students.add(student);
        Navigator.pop(context);
      },
    );
  }
}
