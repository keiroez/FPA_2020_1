import 'package:evenluate_app/controller/project_controller.dart';
import 'package:evenluate_app/model/Project.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProjectScreen extends StatefulWidget {
  List<Project> projects = List<Project>();
  // var items = new List<Item>();
  //
  // ProjectScreen() {
  //   items = [];
  //   items.add(Item(title: 'Trabalho 1', done: true));
  //   items.add(Item(title: 'Trabalho 2', done: true));
  //   items.add(Item(title: 'Trabalho 3', done: true));
  //   items.add(Item(title: 'Trabalho 4', done: true));
  //   items.add(Item(title: 'Trabalho 5', done: true));
  //   items.add(Item(title: 'Trabalho 6', done: true));
  //   items.add(Item(title: 'Trabalho 7', done: true));
  // }

  @override
  _ProjectScreen createState() => _ProjectScreen();
}

class _ProjectScreen extends State<ProjectScreen> {
  ProjectController projectController = ProjectController();
  List<Project> projects = List<Project>();

  @override
  void initState() {
    this.buscarProjetos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return Card(
              child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    print('Card tapped.');
                  },
                  child: Container(
                      height: 80,
                      padding: EdgeInsets.only(bottom: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(projects[index].title),
                        ],
                      ))));
//            Text(widget.items[index].title);
        });
  }



  buscarProjetos() async {
    List<Project> list = await projectController.dioListarProjetos();
    print(list);
    setState(() {
      this.projects = list;
    });

  }
}

class Item {
  String title;
  bool done;

  Item({this.title, this.done});
}
