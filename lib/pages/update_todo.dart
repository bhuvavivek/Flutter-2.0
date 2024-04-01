import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UpdateTodoPage extends StatefulWidget {
  final String todoDocId;
  final String title;
  final String description;

  const UpdateTodoPage(
      {super.key,
      required this.todoDocId,
      required this.title,
      required this.description});

  @override
  State<UpdateTodoPage> createState() => _UpdateTodoPageState();
}

class _UpdateTodoPageState extends State<UpdateTodoPage> {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController descriptioncontroller = TextEditingController();

  User? currentuser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    titlecontroller.text = widget.title;
    descriptioncontroller.text = widget.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Todo'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(16),
                color: Colors.grey.shade200,
                child: Column(children: [
                  TextField(
                    controller: titlecontroller,
                    decoration:
                        const InputDecoration(hintText: "Enter ToDo Title"),
                  ),
                  const SizedBox(height: 15.0),
                  TextField(
                    controller: descriptioncontroller,
                    decoration: const InputDecoration(
                        hintText: "Enter ToDo Description"),
                  ),
                  const SizedBox(height: 15.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () async {
                          if (currentuser != null &&
                              titlecontroller.text.isNotEmpty &&
                              descriptioncontroller.text.isNotEmpty) {
                            FirebaseFirestore.instance
                                .collection("users")
                                .doc(currentuser!.uid)
                                .collection("todos")
                                .doc(widget.todoDocId)
                                .update({
                              "title": titlecontroller.text,
                              "description": descriptioncontroller.text,
                            });
                          }
                        },
                        child: const Text("Update")),
                  )
                ])),
            Expanded(
                child: Container(
                    width: double.infinity,
                    color: Colors.yellow,
                    child: const Text("Hello")))
          ],
        ),
      ),
    );
  }
}
