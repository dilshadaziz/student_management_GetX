import 'package:app/database/db_functions.dart';
import 'package:app/database/db_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditStudentController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxString updatedImagePath = ''.obs;
  final editNameController = TextEditingController();
  final editAgeController = TextEditingController();
  final editFatherController = TextEditingController();
  final editPnumberController = TextEditingController();

  addImage(String image){
    updatedImagePath.value = image;
  }

  void initialValue({
    required String imagePath,
    required String name,
    required String age,
    required String father,
    required String pnumber,
  }){
    updatedImagePath.value = imagePath;
    editNameController.text = name;
    editAgeController.text = age;
    editFatherController.text = father;
    editPnumberController.text = pnumber;

  }
  // Function to handle image selection
  Future<void> geterimage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    editController.updatedImagePath.value = image.path.toString();
  }

  // Function to handle edit student button click
  Future<void> editStudentClicked(BuildContext ctx,StudentModel student) async {
    if (formKey.currentState!.validate()) {
      final name = editNameController.text.toUpperCase();
      final age = editAgeController.text.trim();
      final father = editFatherController.text;
      final phonenumber = editPnumberController.text.trim();

      final updatedStudent = StudentModel(
        id: student.id,
        name: name,
        age: age,
        father: father,
        pnumber: phonenumber,
        imagex: editController.updatedImagePath.value,
      );

      await editStudent(
        updatedStudent.id!,
        updatedStudent.name,
        updatedStudent.age,
        updatedStudent.father,
        updatedStudent.pnumber,
        updatedStudent.imagex,
      );

      getstudentdata();
      Get.back();
    }
  }

  // Function to show photo selection dialog
  void editPhoto() {
    Get.dialog(
      AlertDialog(
        title: const Text('Update Photo'),
        actions: [
          Column(
            children: [
              Row(
                children: [
                  const Text('Choose from camera'),
                  IconButton(
                    onPressed: () => geterimage(ImageSource.camera),
                    icon: const Icon(Icons.camera_alt_rounded),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Choose from gallery'),
                  IconButton(
                    onPressed: () => geterimage(ImageSource.gallery),
                    icon: const Icon(Icons.image),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}


final editController = Get.find<EditStudentController>();
