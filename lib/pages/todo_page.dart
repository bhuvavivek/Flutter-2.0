import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:journey_ii/pages/update_todo.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPage();
}

class _TodoPage extends State<TodoPage> {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController descriptioncontroller = TextEditingController();

  User? currentuser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("simple Todo"),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(16),
                  height: 300,
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
                                  .add({
                                "title": titlecontroller.text,
                                "description": descriptioncontroller.text
                              });
                            }
                          },
                          child: const Text("Save")),
                    )
                  ])),
              Expanded(
                child: SizedBox(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("users")
                          .doc(currentuser!.uid)
                          .collection("todos")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(child: Text("Loading"));
                        } else {
                          final docs = snapshot.data!.docs;
                          return ListView.builder(
                            itemCount: docs.length,
                            itemBuilder: (context, index) {
                              return Dismissible(
                                key: ValueKey(docs[index].id),
                                onDismissed: (direction) {
                                  FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(currentuser!.uid)
                                      .collection("todos")
                                      .doc(docs[index].id)
                                      .delete();
                                },
                                background: Container(
                                  color: Colors.red,
                                  child: const Icon(Icons.cancel),
                                ),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UpdateTodoPage(
                                                  todoDocId: docs[index].id,
                                                  title: docs[index]['title'],
                                                  description: docs[index]
                                                      ['description'],
                                                )));
                                  },
                                  title: Text(docs[index]['title']),
                                  subtitle: Text((docs[index].data()
                                              as Map<String, dynamic>)
                                          .containsKey('description')
                                      ? docs[index]['description']
                                      : docs[index]['desciption']),
                                ),
                              );
                            },
                          );
                        }
                      }),
                ),
              )
            ],
          )),
    );
  }
}
