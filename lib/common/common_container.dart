import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pocketclinic/common/utils/responsive_utils.dart';
import 'package:pocketclinic/controllers/visit_controller.dart';
import 'common_card.dart';
import 'common_color.dart';
import 'common_drawer.dart';

class TextFieldContainer extends StatefulWidget {
  final Widget? kChild;

  const TextFieldContainer({Key? key, this.kChild}) : super(key: key);

  @override
  State<TextFieldContainer> createState() => _TextFieldContainerState();
}

class _TextFieldContainerState extends State<TextFieldContainer> {
  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: CommonColor.grey600),
        color: CommonColor.whiteColor,
        borderRadius: BorderRadius.circular(12 * fem),
        boxShadow: [
          BoxShadow(
            color: CommonColor.blackColor,
            offset: Offset(0 * fem, 9 * fem),
            blurRadius: 5 * fem,
          ),
        ],
      ),
      child: widget.kChild,
    );
  }
}

class YourContainer extends StatefulWidget {
  const YourContainer({super.key});

  @override
  State<YourContainer> createState() => _YourContainerState();
}

class _YourContainerState extends State<YourContainer> {
  // Create an instance of the private controller to manage sub drawer state
  late final VisitControllers _visitControllers;
  late List<TextEditingController> _noteControllers;

  @override
  void initState() {
    // Initialize the controller when the screen initializes
    _visitControllers = Get.put(VisitControllers());

    _visitControllers.callVisitApi();
    _noteControllers.clear();
    super.initState();
  }

  @override
  void dispose() {
    // Dispose of the controller when the screen is disposed
    _visitControllers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: CommonColor.grey600),
        color: CommonColor.whiteColor,
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
                                _noteControllers = List.generate(
                                  _visitControllers.nonNullUserDataValue.length,
                                  (index) => TextEditingController(),
                                );
                                return CommonCard(
                                  status: data['status'].toUpperCase(),
                                  task: data['task'],
                                  visitId: visitId,
                                  taskId: taskId,
                                  kController: _noteControllers[index],
                                  onTapFunction: () {
                                    setState(() async {
                                      await _visitControllers
                                          .callUpdateVisitApi(
                                              visitId: visitId,
                                              taskId: taskId,
                                              note:
                                                  _noteControllers[index].text);
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
