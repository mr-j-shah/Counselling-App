import 'package:get/get.dart';
import 'package:project_counselling/app/data/provider/db/DatabaseHelper.dart';
import 'package:project_counselling/app/data/repos/BreathingRepository.dart';
import 'package:project_counselling/app/data/services/local/AppPref.dart';
import 'package:project_counselling/app/data/services/network/ApiService.dart';
import 'package:project_counselling/app/data/services/network/dio_client.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // Register AppPref for local storage

    Get.put<DioClient>(DioClient());
    Get.put<ApiService>(ApiService(Get.find<DioClient>()));
    Get.put<AppPref>(AppPref());


    // Register DatabaseHelper as a singleton
    Get.putAsync<DatabaseHelper>(() async {
      final dbHelper = DatabaseHelper();
      // Await database initialization to ensure it's ready before use.
      await dbHelper.database;
      return dbHelper;
    }, permanent: true);

    // Register BreathingRepository as a singleton
    Get.lazyPut<BreathingRepository>(() => BreathingRepository(), fenix: true);
  }
}
