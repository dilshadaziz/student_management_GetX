import 'package:app/database/db_functions.dart';
import 'package:app/database/db_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddStudentController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxString imagepath = ''.obs;

  addImage(String image){
    imagepath.value = image;
  }


  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final fatherController = TextEditingController();
  final pnumberController = TextEditingController();

  clearForm(){
    imagepath.value = "";
    nameController.clear();
    ageController.clear();
    fatherController.clear();
    pnumberController.clear();
  }

  Future<void>  addStudentClicked(context)async{
    if(formKey.currentState!.validate() && addController.imagepath.isNotEmpty){
      final name = addController.nameController.text.toUpperCase();
      final age = addController.ageController.text.toUpperCase();
      final father = addController.fatherController.text.toUpperCase();
      final pnumber = addController.pnumberController.text.trim();


      final stdData = StudentModel(name: name, age: age, father: father, pnumber: pnumber, imagex: addController.imagepath.value);
      await addstudent(stdData);
      
    Get.back();
    Get.snackbar('Successfully Added', 'Stuent Added Successfully',snackStyle: SnackStyle.FLOATING,margin: const EdgeInsets.all(10),
    backgroundColor: Colors.white,duration: const Duration(seconds: 2),snackPosition: SnackPosition.BOTTOM,);
    }
  else{
    Get.snackbar('Warning', 'Please check that whether everything is added or not...',snackStyle: SnackStyle.FLOATING,backgroundColor: Colors.redAccent,margin: const EdgeInsets.all(10),duration: const Duration(seconds: 2));
  }
  }

   Future<void> getimage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) {
      return;
    }
    addController.addImage(image.path);
  }

    void addphoto(ctxr) {
    showDialog(
      context: ctxr,
      builder: (ctxr) {
        return AlertDialog(
          content: const Text('Choose Image From.......'),
          actions: [
            IconButton(
              onPressed: () {
                getimage(ImageSource.camera);
                Get.back();
              },
              icon: const Icon(
                Icons.camera_alt_rounded,
                color: Colors.red,
              ),
            ),
            IconButton(
              onPressed: () {
                getimage(ImageSource.gallery);
                Get.back();
              },
              icon: const Icon(
                Icons.image,
                color: Colors.red,
              ),
            ),
          ],
        );
      },
    );
  }
  }


  final addController = Get.find<AddStudentController>();