import 'package:badges/badges.dart' as badge;

import '../../../../common/utils/exports.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_filter.dart';
import '../../../../common/widgets/no_item_found.dart';
import '../../../../models/employees_by_id.dart';
import '../controllers/mh_employees_by_id_controller.dart';

class MhEmployeesByIdView extends GetView<MhEmployeesByIdController> {
  const MhEmployeesByIdView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.context = context;

    return Scaffold(
      appBar: CustomAppbar.appbar(
        title: controller.position.name ?? "Employees",
        context: context,
          centerTitle: true,
          actions: [
            Obx(
              () => Visibility(
                visible: controller.shortlistController.totalShortlisted.value > 0,
                child: Center(
                  child: badge.Badge(
                    position: badge.BadgePosition.topEnd(top: -9, end: -4),
                    onTap: controller.goToShortListedPage,
                    ignorePointer: false,
                    badgeContent: Text(
                      controller.shortlistController.totalShortlisted.value.toString(),
                      style: MyColors.white.semiBold12,
                    ),
                    badgeStyle: const badge.BadgeStyle(
                      badgeColor: MyColors.c_C6A34F,
                      elevation: 0,
                    ),
                    child: GestureDetector(
                      onTap: controller.goToShortListedPage,
                      child: const Icon(Icons.bookmark_outline_rounded),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.w),
          ]),
      body: Obx(
        () => (controller.employees.value.users ?? []).isEmpty
            ? controller.isLoading.value ? const SizedBox() : const NoItemFound()
            : Column(
                children: [
                  _resultCountWithFilter(),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      itemCount: controller.employees.value.users?.length ?? 0,
                      itemBuilder: (context, index) {
                        return _employeeItem(
                          controller.employees.value.users![index],
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _resultCountWithFilter() {
    return Visibility(
      visible: (controller.employees.value.users ?? []).isNotEmpty,
      child: Padding(
        padding: EdgeInsets.fromLTRB(23.w, 10.h, 23.w, 0),
        child: Row(
          children: [
            Text(
              (controller.employees.value.users?.length ?? 0).toString(),
              style: MyColors.c_C6A34F.semiBold16,
            ),
            Text(
              " ${controller.position.name ?? "Employees"} are showing",
              style: MyColors.l111111_dwhite(controller.context!).semiBold16,
            ),

            const Spacer(),

            GestureDetector(
              onTap: () => CustomFilter.customFilter(
                controller.context!,
                controller.onApplyClick,
              ),
              child: Container(
                width: 36.w,
                height: 36.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: MyColors.c_DDBD68,
                ),
                child: const Icon(Icons.filter_list_rounded, color: Colors.white,),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _employeeItem(Employee user) {
    return Container(
      height: 105.h,
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
      child: InkWell(
        onTap: () => controller.onEmployeeClick(user),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              bottom: 0,
              child: SizedBox(
                width: 122.w,
                child: CustomButtons.button(
                  height: 28.w,
                  text: "Book Now",
                  margin: EdgeInsets.zero,
                  fontSize: 12,
                  customButtonStyle: CustomButtonStyle.radiusTopBottomCorner,
                  onTap: () => controller.onBookNowClick(user),
                ),
              ),
            ),

            Positioned(
              right: 5,
              top: 3,
              child: Obx(
                () => controller.shortlistController.getIcon(
                  user.id!,
                  controller.shortlistController.isFetching.value,
                ),
              ),
            ),

            Row(
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
                                SizedBox(height: 16.h),
                                Row(
                                  children: [
                                    _name(user.name ?? "-"),
                                    _rating(user.rating ?? 0),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 8.h),

                      const Divider(
                        thickness: .5,
                        height: 1,
                        color: MyColors.c_D9D9D9,
                        endIndent: 13,
                      ),

                      SizedBox(height: 8.h),

                      Row(
                        children: [
                          _detailsItem(MyAssets.exp, MyStrings.exp.tr, (user.employeeExperience ?? 0).toString()),
                          _detailsItem(MyAssets.totalHour, MyStrings.totalHour.tr, (user.totalWorkingHour ?? 0).toString()),
                        ],
                      ),

                      SizedBox(height: 8.h),

                      Row(
                        children: [
                          _detailsItem(MyAssets.rate, MyStrings.rate.tr, "\$500/hour"),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _image() => Container(
        margin: const EdgeInsets.fromLTRB(16, 16, 13, 16),
        width: 74.w,
        height: 74.w,
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

  Widget _detailsItem(String icon, String title, String value) => Expanded(
        child: Row(
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
        ),
      );

}
