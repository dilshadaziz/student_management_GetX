import 'package:app/controller/addStudentController.dart';
import 'package:app/controller/bottom_controller.dart';
import 'package:app/controller/editStudentController.dart';
import 'package:app/controller/student_controller.dart';
import 'package:get/get.dart';

class Initialization implements Bindings{

  @override
  void dependencies(){
    Get.put<AddStudentController>(AddStudentController());
    Get.put<EditStudentController>(EditStudentController());
    Get.put<StudentController>(StudentController());
    Get.put<BottomController>(BottomController());
  }

}