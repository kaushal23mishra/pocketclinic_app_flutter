import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../common/common_text.dart';
import '../../../common/drawer_constant.dart';
import '../../../common/responsive.dart';
import '../../../common/search_field.dart';
import '../../../common/timeline_detail/small_card.dart';
import '../../../controllers/condition_controller.dart';
import '../../../controllers/drawer_controller.dart';
import '../../../widget/text_widget.dart';

class ConditionSubPageFirst extends StatefulWidget {
  const ConditionSubPageFirst({super.key});

  @override
  State<ConditionSubPageFirst> createState() => _ConditionSubPageFirstState();
}

class _ConditionSubPageFirstState extends State<ConditionSubPageFirst> {
  final subDrawerController = Get.put(SubDrawerController());
  List<Widget> screens = [
    const ConditionTab(),
    const ConditionTab(),
    const ConditionTab(),
    const ConditionTab(),
    const ConditionTab(),
  ];
  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width /
        (Responsive.isMobile(context) ? 700 : 1512);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Responsive.isMobile(context) ? 30 * fem : 43 * fem),
        if (Responsive.isMobile(context) == true)
          const SizedBox(
              height: 120,
              // width: 400,
              child: ConditionCategories()),
        const SearchFeald(),
        SizedBox(
          height: 23 * fem,
        ),
        const SmallHeadingText(),
        SizedBox(
          height: 23 * fem,
        ),
        Obx(
              () => AnimatedSwitcher(
            duration: const Duration(
                milliseconds: 500),
            child: screens[
            subDrawerController
                .currentIndex
                .value],
          ),
        ),

      ],
    );
  }
}
class ConditionTab extends StatefulWidget {
  const ConditionTab({super.key});

  @override
  State<ConditionTab> createState() => _ConditionTabState();
}

class _ConditionTabState extends State<ConditionTab> {
  final _conditionControllers = Get.put(ConditionControllers());
  @override
  void initState() {
    _conditionControllers.callConditionApi();
    super.initState();
  }

  @override
  void dispose() {
    // Get.delete<VisitControllers>();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width /
        (Responsive.isMobile(context) ? 700 : 1512);
    return Container(
      margin: EdgeInsets.fromLTRB(5 * fem, 0, 0, 30 * fem),
      height: Responsive.isMobile(context) ? 800 : 357 * fem,
      child: Obx(
            () {
          var conditionFinalData = _conditionControllers.conditionFinalData;
          return conditionFinalData.isNotEmpty
              ? AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: ListView.builder(
              scrollDirection: Responsive.isMobile(context)
                  ? Axis.vertical
                  : Axis.horizontal,
              itemCount: conditionFinalData.length,
              itemBuilder: (context, index) {
                var status = conditionFinalData[index]
                    .clinicalStatus
                    .toString()
                    .toUpperCase();
                var bookingStatus = conditionFinalData[index]
                    .verificationStatus
                    .toString();
                bookingStatus = bookingStatus[0].toUpperCase() +
                    bookingStatus.substring(1);
                return MiniCard(
                  status: status,
                  bookingStatus: bookingStatus,
                  date: _conditionControllers
                      .conditionFinalData[index].recordedDate
                      .toString(),
                  description:
                  conditionFinalData[index].display.toString(),
                );
              },
            ),
          )
              : const SizedBox(
            height: 100,
            width: 200,
            child: DisplayText(text: 'No Data Found'),
          );
        },
      ),
    );
  }
}

