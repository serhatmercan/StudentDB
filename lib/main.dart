import 'package:StudentDB/screens/add_student.dart';
import 'package:StudentDB/screens/update_student.dart';
import 'package:flutter/material.dart';
import 'package:StudentDB/models/student.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Student> students = [Student.withId(1, "Serhat", "Mercan", 80)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  Widget buildAppBar() => AppBar(title: Text("Student DB"));

  Column buildBody() {
    return Column(
      children: <Widget>[
        buildExpandedList(),
      ],
    );
  }

  Expanded buildExpandedList() {
    return Expanded(
      child: buildListView(),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        final item = students[index].id.toString();
        return Dismissible(
          key: Key(item),
          onDismissed: (direction) {
            setState(() {
              students.removeAt(index);
            });
          },
          background: Container(color: Colors.red),
          child: buildListTile(index),
        );
      },
    );
  }

  ListTile buildListTile(int index) {
    return ListTile(
      title: buildTitle(index),
      subtitle: buildSubtitle(index),
      leading: buildLeading(),
      trailing: buildTrailing(index),
      onTap: () {
        Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        UpdateStudent(students, students[index])))
            .then((value) => setState(() => {}));
      },
    );
  }

  Text buildTitle(int index) {
    return Text(students[index].firstName + " " + students[index].lastName);
  }

  CircleAvatar buildLeading() {
    return CircleAvatar(
      backgroundImage: AssetImage("images/Serhat.jpg"),
    );
  }

  Text buildSubtitle(int index) {
    return Text("Grade: " +
        students[index].grade.toString() +
        " / " +
        students[index].getStatu);
  }

  Icon buildTrailing(int index) {
    if (students[index].grade < 50) {
      return Icon(Icons.clear);
    } else {
      return Icon(Icons.done);
    }
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddStudent(students)))
            .then((value) => setState(() => {}));
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.blue,
    );
  }
}
