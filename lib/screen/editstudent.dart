import 'dart:io';
import 'package:app/controller/editStudentController.dart';
import 'package:app/database/db_functions.dart';
import 'package:app/database/db_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class EditStudent extends StatelessWidget {
  final StudentModel student;

  EditStudent({super.key, required this.student});

  final editController = Get.find<EditStudentController>();

  @override
  Widget build(BuildContext context) {
    editController.initialValue(imagePath: student.imagex, name: student.name, age: student.age, father: student.father, pnumber: student.pnumber);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 186, 246, 240),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 197, 169, 248),
        title: const Text('Edit Student'),
        actions: [
          TextButton.icon(
            label: const Text('Update'),
            onPressed: () {
              editController.editStudentClicked(
                context,
                student,
              );
            },
            icon: const Icon(Icons.cloud_upload),
          )
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: editController.formKey, // Assign the form key
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      InkWell(
                        
                        onTap: () => editController.editPhoto(),
                        child: Obx(
                          ()=> CircleAvatar(
                            backgroundImage: FileImage(File(editController.updatedImagePath.value)),
                            radius: 80,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),

                  // Name input field with validation
                  Row(
                    children: [
                      const Icon(Icons.abc_outlined),
                      const SizedBox(
                          width: 10), // Add spacing between icon and text field
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          controller: editController.editNameController,
                          decoration: InputDecoration(
                            labelText: "Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a Name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Age input field with validation
                  Row(
                    children: [
                      const Icon(Icons.perm_contact_cal),
                      const SizedBox(
                          width: 10), // Add spacing between icon and text field
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: editController.editAgeController,
                          decoration: InputDecoration(
                            labelText: "Class",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Age';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Guardian input field with validation
                  Row(
                    children: [
                      const Icon(Icons.person),
                      const SizedBox(
                          width: 10), // Add spacing between icon and text field
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          controller: editController.editFatherController,
                          decoration: InputDecoration(
                            labelText: "Parent",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Parent Name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Mobile input field with validation
                  Row(
                    children: [
                      const Icon(Icons.phone_sharp),
                      const SizedBox(
                          width: 10), // Add spacing between icon and text field
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: editController.editPnumberController,
                          decoration: InputDecoration(
                            labelText: "Mobile number",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a mobile number';
                            } else if (value.length != 10) {
                              return 'Mobile number should be 10 digits';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}