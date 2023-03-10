import '../../../../common/utils/exports.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_feature_box.dart';
import '../../../../common/widgets/custom_help_support.dart';
import '../../../../common/widgets/custom_menu.dart';
import '../controllers/client_home_controller.dart';

class ClientHomeView extends GetView<ClientHomeController> {
  const ClientHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.context = context;

    return WillPopScope(
      onWillPop: () => Utils.appExitConfirmation(context),
      child: Scaffold(
        appBar: CustomAppbar.appbar(
          context: context,
          title: 'Feature',
          centerTitle: false,
          visibleBack: false,
          actions: [
            IconButton(
              onPressed: controller.onNotificationClick,
              icon: const Icon(
                Icons.notifications_outlined,
              ),
            ),
            IconButton(
              onPressed: () {
                CustomMenu.accountMenu(context);
              },
              icon: const Icon(
                Icons.person_outline_rounded,
              ),
            ),
          ],
        ),
        body: SizedBox(
          height: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        SizedBox(height: 29.h),
                        _restaurantName(MyStrings.hiRestaurant.trParams({
                          "restaurantName": controller.appController.user.value.client?.restaurantName ?? "owner of the",
                        })),
                        SizedBox(height: 20.h),

                        _promotionText,

                        // SizedBox(height: 30.h),

                        // _dueInvoice,

                        Obx(
                          () => Visibility(
                            visible: controller.shortlistController.totalShortlisted.value > 0,
                            child: SizedBox(
                              height: 20.h,
                            ),
                          ),
                        ),

                        _employeeShortlisted,

                        SizedBox(height: 40.h),

                        Row(
                          children: [
                            Expanded(
                              child: CustomFeatureBox(
                                title: MyStrings.employees.tr,
                                icon: MyAssets.mhEmployees,
                                visibleMH: true,
                                onTap: controller.onMhEmployeeClick,
                              ),
                            ),

                            SizedBox(width: 24.w),

                            Expanded(
                              child: CustomFeatureBox(
                                title: MyStrings.dashboard.tr,
                                icon: MyAssets.dashboard,
                                onTap: controller.onDashboardClick,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 30.h),

                        Row(
                          children: [
                            Expanded(
                              child: CustomFeatureBox(
                                title: MyStrings.myEmployees.tr,
                                icon: MyAssets.myEmployees,
                                onTap: controller.onMyEmployeeClick,
                              ),
                            ),

                            SizedBox(width: 24.w),

                            Expanded(
                              child: CustomFeatureBox(
                                title: MyStrings.invoicePayment.tr,
                                icon: MyAssets.invoicePayment,
                                onTap: controller.onInvoiceAndPaymentClick,
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),

                SizedBox(height: 30.h),

                CustomHelpSupport(
                  onTap: controller.onHelpAndSupportClick,
                ),

                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _restaurantName(String name) => Text(
        name,
        style: MyColors.l111111_dwhite(controller.context!).semiBold20,
      );

  Widget get _promotionText => Text(
        MyStrings.exploreTheFeaturesOfMhAppBelow.tr,
        style: MyColors.l777777_dtext(controller.context!).medium15,
      );

  Widget get _dueInvoice => Visibility(
        visible: controller.shortlistController.totalShortlisted.value > 0,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.red.withOpacity(.6),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "5 Invoice are pending",
                      style: MyColors.white.semiBold16,
                    ),
                    SizedBox(height: 7.h),
                    Text(
                      "Please clear due ASAP",
                      style: MyColors.white.regular12,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.withOpacity(.45),
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: MyColors.white,
                ),
              ),
            ],
          ),
        ),
      );

  Widget get _employeeShortlisted => Obx(
    () => Visibility(
          visible: controller.shortlistController.totalShortlisted.value > 0,
          child: InkWell(
            borderRadius: BorderRadius.circular(10.0),
            onTap: controller.onShortlistClick,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: MyColors.c_C6A34F.withOpacity(.6),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${controller.shortlistController.totalShortlisted.value} employees are shortlisted",
                          style: MyColors.white.semiBold16,
                        ),
                        SizedBox(height: 7.h),
                        Text(
                          "Hire them before other client hire",
                          style: MyColors.white.regular12,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: MyColors.c_C6A34F,
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: MyColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
  );
}
