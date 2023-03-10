import '../../../../common/controller/app_controller.dart';
import '../../../../common/utils/exports.dart';
import '../../../../common/widgets/custom_loader.dart';
import '../../../../models/custom_error.dart';
import '../../../../models/employees_by_id.dart';
import '../../../../models/position.dart';
import '../../../../repository/api_helper.dart';
import '../../../../routes/app_pages.dart';
import '../../common/shortlist_controller.dart';

class MhEmployeesByIdController extends GetxController {
  BuildContext? context;

  final AppController _appController = Get.find();
  final ApiHelper _apiHelper = Get.find();
  final ShortlistController shortlistController = Get.find();

  late Position position;

  Rx<Employees> employees = Employees().obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    position = Get.arguments[MyStrings.arg.data];
    super.onInit();
  }

  @override
  void onReady() {
    _getEmployees();
    super.onReady();
  }

  Future<void> onBookNowClick(Employee employee) async {
    if(!_appController.hasPermission()) return;

    await shortlistController.onBookNowClick(employee.id!);
    goToShortListedPage();
  }

  void goToShortListedPage() {
    Get.toNamed(Routes.clientShortlisted);
  }

  void onEmployeeClick(Employee employee) {
    Get.toNamed(Routes.employeeDetails, arguments: {
      MyStrings.arg.data : employee,
    });
  }

  Future<void> _getEmployees({
    String? rating,
    String? experience,
    String? minTotalHour,
    String? maxTotalHour,
  }) async {
    if (isLoading.value) return;

    isLoading.value = true;

    CustomLoader.show(context!);

    await _apiHelper.getEmployees(
      positionId: position.id,
      rating: rating,
      employeeExperience: experience,
      minTotalHour: minTotalHour,
      maxTotalHour: maxTotalHour,
    ).then((response) {

      isLoading.value = false;
      CustomLoader.hide(context!);

      response.fold((CustomError customError) {

        Utils.errorDialog(context!, customError..onRetry = _getEmployees);

      }, (Employees employees) {

        this.employees.value = employees;
        this.employees.refresh();

      });
    });
  }

  void onApplyClick(String selectedRating, String selectedExp, String minTotalHour, String maxTotalHour) {
    _getEmployees(
      rating: selectedRating,
      experience: selectedExp,
      minTotalHour: minTotalHour,
      maxTotalHour: maxTotalHour,
    );
  }
}
