import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_2/buttons/checkbox_button.dart';
import 'package:task_manager_2/buttons/sign_out_arrow.dart';
import 'package:task_manager_2/widgets/bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 60.5,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Row(
                children: const [
                  SignOutArrow(),
                  Spacer(),
                  Text(
                    'My tasks',
                    style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            const SizedBox(
              height: 47.52,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32),
              child: Row(
                children: const [
                  Text(
                    'All',
                    style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Future',
                    style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Today',
                    style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,

                    ),
                  ),
                  Spacer(),
                  Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('today').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        key: Key((snapshot.data?.docs[index].id).toString()),
                        margin: const EdgeInsets.only(
                            left: 24, right: 24, bottom: 16),
                        padding: const EdgeInsets.all(16),
                        width: double.infinity,
                        height: 124,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(172, 160, 236, 0.25),
                              blurRadius: 16,
                              spreadRadius: -5,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${snapshot.data?.docs[index].get('taskName')}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  "${snapshot.data?.docs[index].get('taskDescription')}",
                                  style: const TextStyle(
                                    color: Color.fromRGBO(191, 191, 201, 1),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CheckBoxButton(
                                  onPress: () {
                                    setState(() {
                                      FirebaseFirestore.instance
                                          .collection('dones')
                                          .doc(snapshot.data?.docs[index].id)
                                          .set({
                                        'taskName': snapshot.data?.docs[index]
                                            .get('taskName'),
                                        'taskDescription': snapshot
                                            .data?.docs[index]
                                            .get('taskDescription'),
                                      });
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            FloatingActionButton(
              backgroundColor: const Color.fromRGBO(172, 160, 236, 1),
              onPressed: () {
                String _taskName = '';
                String _taskDescription = '';
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      content: SizedBox(
                        height: 273,
                        width: 327,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Write the name",
                                hintStyle: TextStyle(
                                  color: Color.fromRGBO(191, 191, 201, 1),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              style: const TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                              onChanged: (String value) {
                                _taskName = value;
                              },
                            ),
                            TextFormField(
                              style: const TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(217, 217, 217, 1),
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                // suffix: Container(
                                //   height: 36,
                                //   width: 36,
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(8),
                                //     color: const Color.fromRGBO(239, 232, 255, 1),
                                //   ),
                                //   child: const Icon(Icons.add, color: Colors.black,),
                                // ),
                                hintText: "Add description",
                                hintStyle: const TextStyle(
                                  color: Color.fromRGBO(191, 191, 201, 1),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                              onChanged: (String value) {
                                _taskDescription = value;
                              },
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            FirebaseFirestore.instance.collection('today').add({
                              'taskName': _taskName,
                              'taskDescription': _taskDescription,
                            });
                            Navigator.of(context).pop();
                          },
                          child: const Text('Add'),
                        )
                      ],
                    );
                  },
                );
              },
              elevation: 2,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            BottomAppBar(
              shape: const CircularNotchedRectangle(),
              child: Container(
                height: 60,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
