import 'package:get/get.dart';
import 'package:project_counselling/app/services/network/api_service.dart';
import 'package:project_counselling/app/services/network/dio_client.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DioClient>(DioClient());
    Get.put<ApiService>(ApiService(Get.find<DioClient>()));
  }
}