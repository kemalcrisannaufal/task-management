import 'package:get/get.dart';

class CalendarController extends GetxController {
  Rx<DateTime> selectedDay = DateTime.now().obs;
  Rx<DateTime> focusedDay = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onDaySelected(DateTime selectDay, DateTime focusDay) {
    selectedDay.value = selectDay;
    focusedDay.value = focusDay;
  }
}
