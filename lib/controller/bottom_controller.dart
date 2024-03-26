import 'package:get/get.dart';

class BottomController extends GetxController{
  RxInt selectedIndex = 0.obs;
  RxInt viewMode = 0.obs;


  changeScreen(int value){
    selectedIndex.value = value;
    viewMode.value = value;
  }
}


final bottomController = Get.find<BottomController>();