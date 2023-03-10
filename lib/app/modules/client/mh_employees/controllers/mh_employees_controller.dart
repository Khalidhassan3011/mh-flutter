import '../../../../common/controller/app_controller.dart';
import '../../../../common/utils/exports.dart';
import '../../../../models/position.dart';
import '../../../../routes/app_pages.dart';

class MhEmployeesController extends GetxController {
  BuildContext? context;

  final AppController appController = Get.find();

  void onPositionClick(Position position) {
    Get.toNamed(Routes.mhEmployeesById, arguments: {
      MyStrings.arg.data: position,
    });
  }
}
