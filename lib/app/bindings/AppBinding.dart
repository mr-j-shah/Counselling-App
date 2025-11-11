import 'package:get/get.dart';
import 'package:project_counselling/app/data/provider/db/DatabaseHelper.dart';
import 'package:project_counselling/app/data/repos/BreathingRepository.dart';
import 'package:project_counselling/app/data/services/local/AppPref.dart';
import 'package:project_counselling/app/data/services/local/NotificationService.dart';
import 'package:project_counselling/app/data/services/network/ApiService.dart';
import 'package:project_counselling/app/data/services/network/dio_client.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DioClient>(DioClient());
    Get.put<ApiService>(ApiService(Get.find<DioClient>()));
    Get.put<AppPref>(AppPref());

    Get.putAsync<DatabaseHelper>(() async {
      final dbHelper = DatabaseHelper();
      await dbHelper.database;
      return dbHelper;
    }, permanent: true);

    Get.putAsync<NotificationService>(() async {
      final service = NotificationService();
      await service.init();
      return service;
    }, permanent: true);

    Get.lazyPut<BreathingRepository>(() => BreathingRepository(), fenix: true);
  }
}
