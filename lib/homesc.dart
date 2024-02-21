import 'dart:js';

import 'package:flutter/material.dart';
import 'package:limu/task.dart';

class HomeScren extends StatefulWidget {
  const HomeScren({super.key, required String title});

  @override
  State<HomeScren> createState() => _HomeScrenState();
}

class _HomeScrenState extends State<HomeScren> {
  List<Taskmodel> tasks=[];
  TextEditingController titleCobtroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Arjeeah TODO"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(tasks[index].title),
              trailing: Checkbox(
                value:tasks[index].isCompleted,
                onChanged: (value) {
                  setState(() {
                    tasks [index].isCompleted=!tasks[index].isCompleted;
                  });
                },

              ),
            );
          },
        ),
      ),
floatingActionButton: FloatingActionButton(
  onPressed: (){
    showDialog(
      context:context,
      builder: (context){
        return Dialog(
          child: Padding(
            padding:const EdgeInsets.all(33.0),
            child: Column(

              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Add The New Task :)",
                  style: TextStyle(
                    fontSize: 30,fontWeight: FontWeight.bold
                  ),
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: "Add Task Title Here..."
                  ),
                  controller: titleCobtroller,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed:() {
                        titleCobtroller.clear();
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel"),
                      ),
                      ElevatedButton(
                        onPressed:(){
                          if (titleCobtroller.text.isNotEmpty){
                            tasks.add(
                              Taskmodel(title: titleCobtroller.text)
                            );
                            titleCobtroller.clear();
                            Navigator.pop(context);
                            setState(() {
                              
                            });
                          }

                        },
                        child: Text("Add")
                        ),
                  ],
                )
              ],
            ),
            ),
        );
      }
    );
  },
  tooltip: 'Press',
  child: const Icon (Icons.add),
),

    );
    
  }
}