import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:core_flutter_exam/utils/globals.dart';

ImagePicker imagePicker = ImagePicker();

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back,color: Colors.white,),
        ),
        centerTitle: true,
        title: const Text(
          "Detail Page",
          style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ...List.generate(
                studentDataList.length,
                (index) => Center(
                      child: Container(
                        padding: const EdgeInsets.all(25),
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 430,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepPurple.shade50,
                        ),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  (studentDataList[index].image != null) ? FileImage(studentDataList[index].image!) : null,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                    onTap: () async {
                                      XFile? xFileImage = await imagePicker.pickImage(source: ImageSource.gallery);
                                      setState(() {
                                        studentDataList[index].image = File(xFileImage!.path);
                                      });
                                    },
                                    child: const Icon(Icons.photo)),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: studentDataList[index].student_grid!,
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1),),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 3),),
                                  hintText: ("Enter Your Grid")),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: studentDataList[index].student_name!,
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1),),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 3),),
                                hintText: ("Enter Your Name "),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: studentDataList[index].student_std!,
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1),),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 3),),
                                hintText: ("Enter Your Std "),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/');
                              },
                              child: const Text('Submit',
                                style: TextStyle(color: Colors.deepPurple),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
