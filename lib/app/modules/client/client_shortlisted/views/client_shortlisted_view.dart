import '../../../../common/utils/exports.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_bottombar.dart';
import '../controllers/client_shortlisted_controller.dart';
import '../models/shortlisted_employees.dart';

class ClientShortlistedView extends GetView<ClientShortlistedController> {
  const ClientShortlistedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.context = context;

    return Scaffold(
      appBar: CustomAppbar.appbar(
        title: "Shortlist",
        context: context,
      ),
      bottomNavigationBar: _bottomBar(context),
      body: Obx(
        () => Column(
          children: [
            SizedBox(height: 22.h),

            ...controller.shortlistController.getUniquePositions().map((e) {
              return _employeeInSamePosition(e);
            }),
          ],
        ),
      ),
    );
  }

  Widget _employeeInSamePosition(String positionId) {
    final List<ShortList> employees = controller.shortlistController.getEmployeesBasedOnPosition(positionId);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 12.h),
          child: Text(
            "${Utils.getPositionName(positionId)} (${employees.length})",
            style: MyColors.l111111_dwhite(controller.context!).semiBold16,
          ),
        ),

        ...employees.map((e) {
          return _employeeItem(e);
        }),
      ],
    );
  }

  Widget _employeeItem(ShortList employee) {
    return Container(
      height: 92.h,
      margin: EdgeInsets.symmetric(horizontal: 24.w).copyWith(
        bottom: 20.h,
      ),
      decoration: BoxDecoration(
        color: MyColors.lightCard(controller.context!),
        borderRadius: BorderRadius.circular(10.0).copyWith(
          bottomRight: const Radius.circular(11),
        ),
        border: Border.all(
          width: .5,
          color: MyColors.c_A6A6A6,
        ),
      ),
      child: Row(
        children: [
          _image(),

          Expanded(
            child: Column(
              children: [

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _name(employee.employees?.name ?? "-"),
                              _rating(employee.employees?.rating ?? 0),
                              const Spacer(),
                              Obx(
                                () => controller.shortlistController.getIcon(
                                  employee.employeeId!,
                                  controller.shortlistController.isFetching.value,
                                ),
                              ),
                              // Obx(
                              //   () => controller.loadingRemoveFromShortcut.value && employee.id == controller.removeShortlistId
                              //       ? const Center(
                              //           child: CircularProgressIndicator(),
                              //         )
                              //       : GestureDetector(
                              //           onTap: () => controller.onBookmarkClick(employee),
                              //           child: const Icon(
                              //             Icons.bookmark,
                              //             color: MyColors.c_C6A34F,
                              //           ),
                              //         ),
                              // ),
                              SizedBox(width: 9.w),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 3.h),

                Divider(
                  thickness: .5,
                  height: 1,
                  color: MyColors.c_D9D9D9,
                  endIndent: 13.w,
                ),

                SizedBox(height: 10.h),

                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () =>  controller.onDataSelect(employee.sId!),
                        child: Container(
                          height: 25.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: MyColors.c_F5F5F5,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Image.asset(MyAssets.calender),
                              SizedBox(width: 10.w),

                              Text(
                                employee.fromDate != null && employee.toDate != null ?
                                "${employee.fromDate!.dMMMy} - ${employee.toDate!.dMMMy} (${employee.fromDate!.differenceInDays(employee.toDate!)})"
                                : "--/--/--   -   --/--/--",
                                style: MyColors.c_111111.medium12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 17.w),

                    Obx(
                      ()=> GestureDetector(
                        onTap: () => controller.onSelectClick(employee),
                        child: Container(
                          width: 25.h,
                          height: 25.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: controller.shortlistController.selectedForHire.contains(employee)
                                ? Colors.green.shade400
                                : MyColors.c_F5F5F5,
                            border: Border.all(
                              color: controller.shortlistController.selectedForHire.contains(employee)
                                  ? Colors.green
                                  : Colors.grey.shade300,
                            ),
                          ),
                          child: Icon(
                            Icons.check,
                            size: 14,
                            color: controller.shortlistController.selectedForHire.contains(employee)
                                ? Colors.white
                                : Colors.grey.shade300,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 10.w),
                  ],
                )

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _image() => Container(
        margin: const EdgeInsets.fromLTRB(8, 8, 13, 8),
        width: 74.w,
        height: 74.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey.withOpacity(.1),
        ),
      );

  Widget _name(String name) => Text(
        name,
        style: MyColors.l111111_dwhite(controller.context!).medium14,
      );

  Widget _rating(int rating) => Visibility(
        visible: rating > 0,
        child: Row(
          children: [
            SizedBox(width: 10.w),
            Container(
              height: 2.h,
              width: 2.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.l111111_dwhite(controller.context!),
              ),
            ),
            SizedBox(width: 10.w),
            const Icon(
              Icons.star,
              color: MyColors.c_FFA800,
              size: 16,
            ),
            SizedBox(width: 2.w),
            Text(
              rating.toString(),
              style: MyColors.l111111_dwhite(controller.context!).medium14,
            ),
          ],
        ),
      );

  Widget _bottomBar(BuildContext context) {
    return Obx(
      () => CustomBottomBar(
        child: CustomButtons.button(
          onTap: controller.onBookAllClick,
          text: controller.shortlistController.selectedForHire.isEmpty
              || controller.shortlistController.selectedForHire.length == controller.shortlistController.totalShortlisted.value
              ? "Book All"
              : "Book (${controller.shortlistController.selectedForHire.length}) Employee",
          customButtonStyle: CustomButtonStyle.radiusTopBottomCorner,
        ),
      ),
    );
  }
}
