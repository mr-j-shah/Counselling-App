import 'package:get/get.dart';
import 'package:project_counselling/app/views/Presentation/StatisticsScreen/controller/StatisticsController.dart';

class StatisticsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatisticsController>(() => StatisticsController());
  }
}
