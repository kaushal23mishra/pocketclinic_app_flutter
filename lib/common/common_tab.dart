import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pocketclinic/common/utils/responsive_utils.dart';
import 'package:pocketclinic/common/timeline_detail/small_card.dart';
import 'package:pocketclinic/controllers/condition_controller.dart';
import 'package:pocketclinic/widget/text_widget.dart';

class ConditionTab extends StatefulWidget {
  const ConditionTab({Key? key}) : super(key: key); // Added Key parameter

  @override
  State<ConditionTab> createState() => _ConditionTabState();
}

class _ConditionTabState extends State<ConditionTab> {
  // Create an instance of the private controller to manage sub drawer state
  late final ConditionControllers _conditionControllers;

  @override
  void initState() {
    // Initialize the controller when the screen initializes
    _conditionControllers = Get.put(ConditionControllers());
    super.initState();
  }

  @override
  void dispose() {
    // Dispose of the controller when the screen is disposed
    _conditionControllers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);

    // Widget displaying condition data using a ListView
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
              // Displayed when no data is found
              : const SizedBox(
                  height: 100,
                  width: 200,
                  child: Center(child: DisplayText(text: 'No Data Found')),
                );
        },
      ),
    );
  }
}
