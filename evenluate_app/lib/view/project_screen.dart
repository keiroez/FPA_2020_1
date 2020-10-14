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
  bool buscandoProjetos = true;

  @override
  void initState() {
    this.buscarProjetos(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Scaffold(
        appBar: AppBar(
          title: Text("Projetos avaliados"),
          backgroundColor: Color(0xFF295183),
        ),
        body: buscandoProjetos
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : ListView.builder(
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return Card(
                      color: Color(0xFF4175B6),
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          print('Card tapped.');
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 10.0, left: 6.0, right: 6.0, bottom: 6.0),
                          child: Theme(
                              data: theme,
                              child: ExpansionTile(
                                leading: Icon(
                                  Icons.assignment,
                                  color: Colors.white,
                                ),
                                title: Text(
                                  projects[index].title,
                                  style: TextStyle(color: Colors.white),
                                ),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(projects[index].resume,
                                        style: TextStyle(color: Colors.white)),
                                  )
                                ],
                              )),
                        ),
                      ));
//            Text(widget.items[index].title);
                }));
  }

  buscarProjetos(BuildContext context) async {
    List<Project> list = await projectController.dioListarProjetos(context);
    print(list);
    setState(() {
      this.projects = list;
      this.buscandoProjetos = false;
    });
  }
}

class Item {
  String title;
  bool done;

  Item({this.title, this.done});
}
