import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketclinic/common/responsive.dart';

import '../controllers/drawer_controller.dart';
import '../controllers/visit_controller.dart';
import 'card_constant.dart';
import 'drawer_constant.dart';

class YourContainer extends StatefulWidget {
  const YourContainer({super.key});

  @override
  State<YourContainer> createState() => _YourContainerState();
}

class _YourContainerState extends State<YourContainer> {
  List<Widget> screens = [
    const CommonCard(
      status: 'Pending',
    ),
    const CommonCard(
      status: 'Pending',
    ),
    const CommonCard(
      status: 'Pending',
    ),
  ];
  final _visitControllers = Get.put(VisitControllers());
  late List<TextEditingController> noteControllers;
  @override
  void initState() {
    _visitControllers.callVisitApi();

    super.initState();
  }

  final yourTaskCategoryController = Get.put(YourTaskCategoryController());
  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width /
        (Responsive.isMobile(context) ? 700 : 1512);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffefeff1)),
        color: const Color(0xffefeff1),
        borderRadius: BorderRadius.circular(20 * fem),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(
            () => Container(
              padding:
                  EdgeInsets.fromLTRB(24 * fem, 12 * fem, 78 * fem, 2.5 * fem),
              width: double.infinity,
              height: 54 * fem,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/rectangle-1016.png',
                  ),
                ),
              ),
              child: YourTaskCategories(
                taskCount: [
                  _visitControllers.nonNullUserDataValue.length.toString(),
                  _visitControllers.pendingCount.toString(),
                  _visitControllers.completeCount.toString()
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(19 * fem, 24 * fem, 0 * fem, 5 * fem),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      EdgeInsets.fromLTRB(5 * fem, 0 * fem, 0 * fem, 20 * fem),
                  height: 215 * fem,
                  child: Obx(
                    () => _visitControllers.nonNullUserDataValue.isNotEmpty
                        ? AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  _visitControllers.nonNullUserDataValue.length,
                              itemBuilder: (BuildContext context, int index) {
                                final Map<String, dynamic> data =
                                    _visitControllers
                                        .nonNullUserDataValue[index];

                                // Assuming 'id' is the field name for task ID and 'visitId' is the field name for visit ID
                                final visitId =
                                    _visitControllers.taskIds[index];
                                final taskId = data['id'];

                                // Schedule the task to update pendingCount and completeCount after the current build is complete
                                Future.delayed(Duration.zero, () {
                                  int pendingCount = 0;
                                  int completeCount = 0;

                                  for (var visitData in _visitControllers
                                      .nonNullUserDataValue) {
                                    if (visitData['status'].toLowerCase() ==
                                        "pending") {
                                      pendingCount++;
                                    } else if (visitData['status']
                                            .toLowerCase() ==
                                        "completed") {
                                      completeCount++;
                                    }
                                  }

                                  // Update the counts in the VisitControllers
                                  _visitControllers.pendingCount.value =
                                      pendingCount;
                                  _visitControllers.completeCount.value =
                                      completeCount;
                                });
                                noteControllers = List.generate(
                                  _visitControllers.nonNullUserDataValue.length,
                                      (index) => TextEditingController(),
                                );
                                return CommonCard(
                                  status: data['status'].toUpperCase(),
                                  task: data['task'],
                                  visitId: visitId,
                                  taskId: taskId,
                                  kController: noteControllers[index],
                                  onTapFunction: () {
                                    setState(() async {
                                      await _visitControllers
                                          .callUpdateVisitApi(
                                              visitId: visitId,
                                              taskId: taskId,
                                              note:
                                                  noteControllers[index].text);
                                      _visitControllers.callVisitApi();
                                    });
                                  },
                                );
                              },
                            ),
                          )
                        : const Center(
                            child: Text('No Data Found'),
                          ),
                  ),

                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Obx(
                  //           () => AnimatedSwitcher(
                  //         duration: const Duration(milliseconds: 500),
                  //         child: screens[yourTaskCategoryController.currentIndex.value],
                  //       ),
                  //     ),
                  //
                  //     SizedBox(
                  //       width: 24*fem,
                  //     ),
                  //
                  //   ],
                  // ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
