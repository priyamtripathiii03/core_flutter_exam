import 'dart:io';
import 'package:core_flutter_exam/utils/modal.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/globals.dart';

ImagePicker imagePicker = ImagePicker();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "Student Detail",
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            ...List.generate(
                studentDataList.length,
                    (index) => Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(8),
                    height: 200,
                    width: 360,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          studentDataList[index].student_grid!.text,
                          style: const TextStyle(color: Colors.black),
                        ),
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: (studentDataList[index].image != null) ? FileImage(studentDataList[index].image!) : null,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              studentDataList[index].student_name!.text,
                              style: const TextStyle(color: Colors.black,),),
                            Text(
                              studentDataList[index].student_std!.text,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Center(
                                        child: Text("Edit Data"),),
                                    content: Container(
                                      height: 550,
                                      width: 360,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            CircleAvatar(
                                              radius: 50,
                                              backgroundImage:
                                              (studentDataList[index].image != null) ? FileImage(studentDataList[index].image!) : null,
                                              child: Align(
                                                alignment: Alignment
                                                    .bottomRight,
                                                child: InkWell(
                                                    onTap: () async {
                                                      XFile?
                                                      xFileImage =
                                                      await imagePicker.pickImage(
                                                          source: ImageSource.gallery);
                                                      setState(() {
                                                        studentDataList[index].image = File(xFileImage!.path);
                                                      });
                                                    },
                                                    child: const Icon(Icons.photo),),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            TextFormField(
                                              controller:
                                              studentDataList[index].student_grid!,
                                              decoration: const InputDecoration(
                                                  enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.black,
                                                          width: 1),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.black,
                                                          width: 3)),
                                                  hintText: ("Enter Your Grid"),),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            TextFormField(
                                              controller:
                                              studentDataList[index].student_name!,
                                              decoration:
                                              const InputDecoration(
                                                enabledBorder:
                                                OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black,
                                                        width: 1)),
                                                focusedBorder:
                                                OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black,
                                                        width: 3),),
                                                hintText: ("Enter Your Name "),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            TextFormField(
                                              controller:
                                              studentDataList[index].student_std!,
                                              decoration:
                                              const InputDecoration(
                                                enabledBorder:
                                                OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black,
                                                        width: 1),),
                                                focusedBorder:
                                                OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black,
                                                        width: 3),),
                                                hintText: ("Enter Your Std "),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pushNamed('/');
                                                },
                                                child: const Text("Update"),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),);
                            },
                            child: const Icon(Icons.edit)),
                        InkWell(
                            onTap: () {
                              setState(() {
                                studentDataList.removeAt(index);
                              });
                            },
                            child: const Icon(Icons.delete)),
                      ],
                    ),
                  ),
                ),),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          TextEditingController studentName = TextEditingController();
          TextEditingController studentGrid = TextEditingController();
          TextEditingController studentStandard = TextEditingController();
          setState(() {
            studentDataList.add(StudentModal(
                student_name: studentName, student_grid: studentGrid, student_std: studentStandard),);
          });
          Navigator.of(context).pushNamed('/add');
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

