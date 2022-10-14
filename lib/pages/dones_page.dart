import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_2/buttons/sign_out_arrow.dart';
import 'package:task_manager_2/buttons/text_button.dart';
import 'package:task_manager_2/buttons/underline_text_button.dart';
import 'package:task_manager_2/pages/future_page.dart';
import 'package:task_manager_2/pages/home_page.dart';

class DonesPage extends StatefulWidget {
  const DonesPage({Key? key}) : super(key: key);

  @override
  State<DonesPage> createState() => _DonesPageState();
}

class _DonesPageState extends State<DonesPage> {
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
                children: [
                  CustomTextButton(onPress: () {}, text: 'All'),
                  const Spacer(),
                  CustomTextButton(
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FuturePage(),
                          ),
                        );
                      },
                      text: 'Future'),
                  const Spacer(),
                  CustomTextButton(
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    text: 'Today',
                  ),
                  const Spacer(),
                  UnderlineTextButton(onPress: () {}, text: 'Done'),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('dones').snapshots(),
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
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
