import 'package:get/get.dart';
import 'package:project_counselling/app/data/services/network/ApiService.dart';
import 'package:project_counselling/app/data/services/network/dio_client.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DioClient>(DioClient());
    Get.put<ApiService>(ApiService(Get.find<DioClient>()));
  }
}