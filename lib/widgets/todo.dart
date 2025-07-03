import 'package:flutter/material.dart';
class Todo extends StatefulWidget {// to refresh the state use statefull widget instead of...
  final String title;// all the declare variable and function
  final String desc; // will be passed to constructor as todo here
  //final Function onTap;// and will mentioned these with require this.
  final bool done;
  const Todo({super.key,
    required this.title,
    required this.desc,
    required this.done,
    //required this.onTap
  });

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  // Color color= Colors.red;
  //  void initState()
  //  {
  //     color= widget.done==true? Colors.green: Colors.red;
  //    super.initState();
  //
  //  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
      //  width: MediaQuery.of(context).size.width,//to fix container width with display
        decoration: BoxDecoration(
            color: widget.done ? Colors.green: Colors.red,
            borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              Text(widget.desc),
            ],
          ),
        )
      ),
    );
  }
}
