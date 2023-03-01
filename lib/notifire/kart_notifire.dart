import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class NotificationNotifer extends  GetxController  {
  List<String> lst = <String>[].obs;

  add(String notificationCounter) {
    lst.add(notificationCounter);
    update();
  }

  del() {
    if(lst.isNotEmpty){
      lst.removeAt(lst.length-1);
      update();
    }

  }
  clearList(){
    if(lst.isNotEmpty){
      lst.clear();
      update();
    }
  }
}