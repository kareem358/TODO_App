import 'package:flutter/material.dart';
import 'package:untitled/models/todo_model.dart';
import 'package:untitled/widgets/todo.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ToDoModel> todos=[];
  TextEditingController title= TextEditingController();
  TextEditingController desc= TextEditingController();
  bool _showContent = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
            child: Container(height: 20,
                child:  Text("TODO_List", style: TextStyle(fontSize: 16, fontWeight:FontWeight.bold),))),
      ),
      // if single body element body: const Todo(),// importing the todo width in the body
      body: Column(
        children: [
          Expanded(
            //height: 450,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: todos.length, itemBuilder: (context, index){
               return InkWell(
                 onTap: (){
                   todos[index].check= ! todos[index].check;
                   setState(() {});
                 },
                 child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Expanded(
                       child: Todo(
                         title: todos[index].title,
                         desc: todos[index].desc,
                         done: todos[index].check,
                       ),
                     ),
                   IconButton(onPressed:(){
                     todos.removeAt(index);
                     setState(() {});

                   }, icon:  const Icon(Icons.delete))
                   ],
                 ),
               );

            }),
          ),
         // Expanded(child: Container()),
          if(_showContent)
          Container(
           // color: Colors.grey,//just to show the container
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(

                    decoration: BoxDecoration(border: Border.all(),
                    borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: title,
                          decoration: const InputDecoration(labelText:   "Title",), // or we can use hintText
                        ),

                      )),
                  const SizedBox(height: 10,),
                  Container(
                      decoration: BoxDecoration(border: Border.all(),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: desc,
                          decoration: const InputDecoration(hintText: "desc"),
                        ),
                      )),
                  const SizedBox(height:15),// giving a constant size padding

                ],
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: (){
                  if (!_showContent) {
                    // If form is hidden, show it instead of adding a task
                    setState(() {
                      _showContent = true;
                    });
                  } else {
                    // If form is visible, check validation and add task
                    if (title.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Title cannot be empty!"),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else {
                      todos.add(ToDoModel(title.text, desc.text, false));
                      setState(() {});
                    }
                  }
                },
                  child: Text(_showContent ? "Add Todo" : "New ToDo", style: TextStyle(fontWeight: FontWeight.bold),),),
                Container(child: ElevatedButton(onPressed: (){
                  setState(() {
                    title.clear();  // Clear title field
                    desc.clear();   // Clear description field
                  });
                }, child: Text('Clear', style: TextStyle(color: Colors.red),))),
                ElevatedButton(onPressed: (){
                  setState(() {
                    _showContent = false; // Hide the container
                  });
                }, child: Text("X")),

              ]
            ),
          )
        ],
      ),

    );
  }
}
