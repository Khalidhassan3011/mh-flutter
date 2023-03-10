import '../../../../common/utils/exports.dart';
import '../../../../common/widgets/custom_appbar_back_button.dart';
import '../../../../common/widgets/custom_bottombar.dart';
import '../controllers/employee_details_controller.dart';

class EmployeeDetailsView extends GetView<EmployeeDetailsController> {
  const EmployeeDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.context = context;

    return Scaffold(
      bottomNavigationBar: _bottomBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(21, 0, 21, 20),
          child: Column(
            children: [
              SizedBox(height: 60.h),

              _backButtonImageBookmark,

              SizedBox(height: 20.h),

              _basicInfo,

              // SizedBox(height: 12.h),

              // _location,

              SizedBox(height: 12.h),

              _education,

              SizedBox(height: 12.h),

              _certificate,

              SizedBox(height: 12.h),

              language,

              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _backButtonImageBookmark => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppbarBackButton(),
          const Spacer(),
          Container(
            width: 244.w,
            height: 218.h,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.1),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const Spacer(),
          Obx(
            () => controller.shortlistController.getIcon(
              controller.employee.id!,
              controller.shortlistController.isFetching.value,
            ),
          ),
        ],
      );

  Widget _base({
    required Widget child,
    required String title,
    String? age,
    String? rating,
  }) =>
      Container(
        padding: EdgeInsets.fromLTRB(35.w, 13.h, 35.w, 13.h),
        decoration: BoxDecoration(
          color: MyColors.lightCard(controller.context!),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            width: .5,
            color: MyColors.c_A6A6A6,
          ),
        ),
        child: Column(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: MyColors.l111111_dwhite(controller.context!).medium16,
            ),

            SizedBox(height: 10.h),

            Visibility(
              visible: age != null,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        age ?? "",
                        textAlign: TextAlign.center,
                        style: MyColors.l7B7B7B_dtext(controller.context!).medium12,
                      ),

                      SizedBox(width: 10.w),

                      const Icon(
                        Icons.star,
                        size: 16,
                        color: MyColors.c_FFA800,
                      ),

                      SizedBox(width: 3.w),

                      Text(
                        rating ?? "0",
                        style: MyColors.l111111_dwhite(controller.context!).medium12,
                      ),
                    ],
                  ),

                  SizedBox(height: 10.h),
                ],
              ),
            ),

            Divider(
              height: 1,
              thickness: .5,
              color: MyColors.lD9D9D9_dstock(controller.context!),
            ),

            SizedBox(height: 12.h),

            child,

            SizedBox(height: 5.h),
          ],
        ),
      );

  Widget _data(String icon, String? text) => text == null
      ? Text(
          "No Data Found",
          style: MyColors.l7B7B7B_dtext(controller.context!).regular12,
        )
      : Row(
          children: [
            Image.asset(
              icon,
              width: 14.w,
              height: 14.w,
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Text(
                text,
                style: MyColors.l7B7B7B_dtext(controller.context!).regular12,
              ),
            ),
          ],
        );

  Widget _detailsItem(String icon, String title, String value) => Row(
    children: [
      Image.asset(
        icon,
        width: 14.w,
        height: 14.w,
      ),
      SizedBox(width: 10.w),
      Text(
        title,
        style: MyColors.l7B7B7B_dtext(controller.context!).medium11,
      ),
      SizedBox(width: 3.w),
      Text(
        value,
        style: MyColors.l111111_dwhite(controller.context!).medium11,
      ),
    ],
  );

  Widget get _basicInfo => _base(
        title: controller.employee.name ?? "-",
        age: MyStrings.ageWithYears.trParams({"year" : Utils.calculateAge(controller.employee.dateOfBirth) }),
        child: Column(
          children: [

            SizedBox(height: 5.h),

            Row(
              children: [
                _detailsItem(MyAssets.rate, MyStrings.rating.tr, "\$${(controller.employee.rating ?? 0)}/hour"),
                const Spacer(),
                _detailsItem(MyAssets.exp, MyStrings.exp.tr, "${(controller.employee.employeeExperience ?? 0)} years"),
              ],
            ),

            SizedBox(height: 18.h),

            Row(
              children: [
                _detailsItem(MyAssets.totalHour, MyStrings.totalHour.tr, "${(controller.employee.rating ?? 0)} H"),
                const Spacer(),
                _detailsItem(MyAssets.review, MyStrings.review.tr, "1 time"),
              ],
            ),

            SizedBox(height: 18.h),

            _detailsItem(MyAssets.license, MyStrings.licenseNo.tr, controller.employee.licensesNo ?? "-"),

            SizedBox(height: 5.h),

          ],
        ),
      );

  Widget get _location => _base(
        title: MyStrings.location.tr,
        child: _data(
          MyAssets.location,
          controller.employee.presentAddress ?? "-",
        ),
      );

  Widget get _education => _base(
        title: MyStrings.education.tr,
        child: _data(
          MyAssets.education,
          controller.employee.higherEducation,
        ),
      );

  Widget get _certificate => _base(
        title: MyStrings.certificate.tr,
        child: _data(
          MyAssets.education,
          null,
        ),
      );

  Widget get language => _base(
        title: MyStrings.language.tr,
        child: Column(
          children: [
            ...(controller.employee.language ?? []).map((e) {
              return _data(
                MyAssets.language,
                e.capitalize ?? "",
              );
            }),
          ],
        ),
      );

  Widget _bottomBar(BuildContext context) {
    return CustomBottomBar(
      child: CustomButtons.button(
        onTap: controller.onBookNowClick,
        text: "Book Now",
        height: 52.h,
        customButtonStyle: CustomButtonStyle.radiusTopBottomCorner,
      ),
    );
  }
}
