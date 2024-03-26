import 'package:app/database/db_functions.dart';
import 'package:app/database/db_model.dart';
import 'package:get/get.dart';

class StudentController extends GetxController{
  RxList<StudentModel> studentLists = <StudentModel>[].obs;
  RxList<StudentModel> filteredStudentList = <StudentModel>[].obs;
  initialize() async{
    var s1 = await getstudentdata();
    studentLists.value = s1;
  }

  getSearchResults(String query) async{
    await initialize();
    if(query.isEmpty){
      filteredStudentList.value = studentLists;
    }
    else{
      List<StudentModel> s = studentLists.where((element) => element.name.toLowerCase().contains(query.toLowerCase())).toList();
      filteredStudentList.value = s;
    }
  }
}

var studentController = Get.find<StudentController>();