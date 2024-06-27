import 'package:flutter/material.dart';
import 'package:to_do_app/constants/colors.dart';
import 'package:to_do_app/models/to_do.dart';
import 'package:to_do_app/widgets/BuildAppBar.dart';
import 'package:to_do_app/widgets/NavigationDrawer.dart';
import 'package:to_do_app/widgets/ToDoItem.dart';

class Home extends StatefulWidget {
  Home({ Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.toDoList();
  List<ToDo> _foundToDo = [];
  final _toDoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary 
    );

    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: 
              Column(
                children: [
                  SearchBox(),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.only(bottom: 50),
                      shrinkWrap: true,
                      children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 50,
                                bottom: 20
                               ),
                            child: const Text(
                              'All To dos',
                               style: TextStyle(
                                fontSize: 30,
                                 fontWeight: FontWeight.w500),
                                 )
                          ),
                          for ( ToDo toDo in _foundToDo.reversed) 
                            ToDoItem(
                              todo: toDo,
                              onToDoChanged: _handleToDoChange,
                              onDeleteItem: _deleteToDoItem,  
                            ),
                      ],
                    ),
                  )
                ],
              )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      boxShadow: const [BoxShadow(
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0
                      ),],
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextField(
                      controller: _toDoController,
                      decoration: InputDecoration(
                        hintText: 'Add a new to do item',
                        border: InputBorder.none
                      ),
                    ),
                  )
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20
                  ),
                  child: IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                      minimumSize: Size(60, 60),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                    ),
                    onPressed: () {
                      _addToDoItem(_toDoController.text);
                    },
                    icon: Icon(Icons.add, color: Colors.white,)
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String todo) {
    setState(() {
      todosList.add(ToDo(id: DateTime.now().millisecond.toString(), toDoText: todo));
    });
    _toDoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList.where((item) => item.toDoText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  Widget SearchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search, size: 20),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
          border: InputBorder.none,
          hintText: 'Search',
        ),
      ),
    );
  }
}