import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketclinic/controllers/drawer_controller.dart';
import 'package:pocketclinic/widget/text_widget.dart';
import 'common_color.dart';
import 'utils/responsive_utils.dart';
import 'common_string.dart';

///=====================CustomNavigationDrawer========================
class CustomNavigationDrawer extends StatelessWidget {
  CustomNavigationDrawer({Key? key}) : super(key: key);

  final mainScreenController = Get.put(MainDrawerController());

  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return Container(
      decoration: BoxDecoration(
        color: CommonColor.whiteColor,
        boxShadow: [
          BoxShadow(
            color: CommonColor.blackColor,
            offset: Offset(6 * fem, 0),
            blurRadius: 5 * fem,
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: StringConstant.customNavigationDrawerIconsList.length,
              itemBuilder: (context, index) {
                return Obx(
                  () => AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    child: GestureDetector(
                      onTap: () {
                        mainScreenController.currentIndex.value = index;
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                              StringConstant
                                  .customNavigationDrawerIconsList[index],
                              width: 40 * fem,
                              height: 40 * fem,
                              color: mainScreenController.currentIndex.value ==
                                      index
                                  ? CommonColor.green300
                                  : CommonColor.dimGray,
                            ),
                          ),
                          mainScreenController.hideDrawer.value
                              ? Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: 5, left: 8),
                                  child: DisplayText(
                                    text: StringConstant
                                        .customNavigationDrawerIconLabel[index],
                                    color: mainScreenController
                                                .currentIndex.value ==
                                            index
                                        ? CommonColor.primary
                                        : CommonColor.dimGray,
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

///=====================CustomSubNavigationDrawer========================
class CustomSubNavigationDrawer extends StatefulWidget {
  const CustomSubNavigationDrawer({super.key});

  @override
  State<CustomSubNavigationDrawer> createState() =>
      _CustomSubNavigationDrawerState();
}

class _CustomSubNavigationDrawerState extends State<CustomSubNavigationDrawer> {
  final mainScreenController = Get.put(SubDrawerController());

  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return Container(
      decoration: BoxDecoration(
        color: CommonColor.primary,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20 * fem),
          bottomRight: Radius.circular(20 * fem),
        ),
      ),
      padding: EdgeInsets.fromLTRB(21 * fem, 40 * fem, 0 * fem, 55 * fem),
      width: 300 * fem,
      height: 901 * fem,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(0, 10 * fem, 0 * fem, 0),
              itemCount: StringConstant.subNavigationDrawerIconsList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Obx(() => AnimatedContainer(
                          decoration: BoxDecoration(
                            color: (mainScreenController.currentIndex.value ==
                                    index)
                                ? CommonColor.whiteColor
                                : CommonColor.primary,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20 * fem),
                              bottomLeft: Radius.circular(20 * fem),
                            ),
                          ),
                          duration: const Duration(milliseconds: 500),
                          child: Padding(
                            padding: EdgeInsets.only(top: 6 * fem),
                            child: ListTile(
                              onTap: () {
                                mainScreenController.currentIndex.value = index;
                              },
                              horizontalTitleGap: 0.0,
                              leading: Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 10 * fem, 0),
                                width: 56 * fem,
                                height: 56 * fem,
                                decoration: BoxDecoration(
                                  color: CommonColor
                                          .customSubNavigationDrawerBackgroundColor[
                                      index],
                                  borderRadius: BorderRadius.circular(28 * fem),
                                ),
                                child: Image.asset(
                                  StringConstant
                                      .subNavigationDrawerIconsList[index]
                                      .toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: mainScreenController.hideDrawer.value
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, bottom: 5),
                                      child: DisplayText(
                                        text: StringConstant
                                                .customSubNavigationDrawerIconLabel[
                                            index],
                                        fontSize: 20 * fem,
                                        fontWeight: FontWeight.w600,
                                        color: (mainScreenController
                                                    .currentIndex.value ==
                                                index)
                                            ? CommonColor.blackColor
                                            : CommonColor.whiteColor,
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          ),
                        )),
                    // Add a Divider if it's not the last item
                    if (index !=
                        StringConstant.subNavigationDrawerIconsList.length)
                      const Padding(
                        padding: EdgeInsets.only(left: 14.0, right: 34),
                        child: Divider(
                          color: CommonColor.grey600,
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

///=====================VisitsCategories========================
class VisitsCategories extends StatefulWidget {
  const VisitsCategories({super.key});

  @override
  State<VisitsCategories> createState() => _VisitsCategoriesState();
}

class _VisitsCategoriesState extends State<VisitsCategories> {
  final visitCategoryController = Get.put(VisitCategoryController());

  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: StringConstant.visitsNavigationDrawerIconLabel.length,
      itemBuilder: (context, index) {
        return Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            child: GestureDetector(
                onTap: () {
                  visitCategoryController.currentIndex.value = index;
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12 * fem,
                  ),
                  child: DisplayText(
                    text: StringConstant.visitsNavigationDrawerIconLabel[index],
                    fontSize: 20 * fem,
                    fontWeight: FontWeight.w400,
                    color: visitCategoryController.currentIndex.value == index
                        ? CommonColor.primary
                        : CommonColor.grey600,
                  ),
                )),
          ),
        );
      },
    );
  }
}

///=====================YourTaskCategories========================
class YourTaskCategories extends StatefulWidget {
  final List<String>? taskCount;
  const YourTaskCategories({Key? key, this.taskCount}) : super(key: key);

  @override
  State<YourTaskCategories> createState() => _YourTaskCategoriesState();
}

class _YourTaskCategoriesState extends State<YourTaskCategories> {
  final yourTaskCategoryController = Get.put(YourTaskCategoryController());

  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: StringConstant.yourTaskNavigationDrawerIconLabel.length,
      itemBuilder: (context, index) {
        return Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            child: GestureDetector(
              onTap: () {
                yourTaskCategoryController.currentIndex.value = index;
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 15 * fem, 9.5 * fem),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 12 * fem, 0),
                      child: DisplayText(
                        text: StringConstant
                            .yourTaskNavigationDrawerIconLabel[index],
                        fontSize: 20 * fem,
                        fontWeight: FontWeight.w400,
                        color: yourTaskCategoryController.currentIndex.value ==
                                index
                            ? CommonColor.primary
                            : CommonColor.grey600,
                      ),
                    ),
                    Container(
                      width: 29 * fem,
                      height: 29 * fem,
                      decoration: BoxDecoration(
                        color: yourTaskCategoryController.currentIndex.value ==
                                index
                            ? CommonColor.primary
                            : CommonColor.grey600,
                        borderRadius: BorderRadius.circular(14.5 * fem),
                      ),
                      child: Center(
                        child: DisplayText(
                          text: widget.taskCount![
                              index], // Display the count corresponding to the category
                          fontSize: 16 * fem,
                          fontWeight: FontWeight.w500,
                          color: CommonColor.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

///=====================ConditionCategories========================

class ConditionCategories extends StatefulWidget {
  const ConditionCategories({Key? key}) : super(key: key);

  @override
  State<ConditionCategories> createState() => _ConditionCategoriesState();
}

class _ConditionCategoriesState extends State<ConditionCategories> {
  final subDrawerController = Get.put(SubDrawerController());

  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: StringConstant.customSubNavigationDrawerIconLabel.length,
      itemBuilder: (context, index) {
        return Obx(() => AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              child: GestureDetector(
                onTap: () {
                  subDrawerController.currentIndex.value = index;
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(
                      20 * fem, 0 * fem, 10 * fem, 20 * fem),
                  padding: EdgeInsets.all(2 * fem),
                  width: 168 * fem,
                  height: 174 * fem,
                  decoration: BoxDecoration(
                    color: (subDrawerController.currentIndex.value == index)
                        ? CommonColor.primary
                        : CommonColor.whiteColor,
                    borderRadius: BorderRadius.circular(23 * fem),
                    boxShadow: [
                      BoxShadow(
                        color: CommonColor.blackColor,
                        offset: Offset(0 * fem, 4 * fem),
                        blurRadius: 2 * fem,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // margin: EdgeInsets.fromLTRB(0, 0, 10 * fem, 0),
                        width: 80 * fem,
                        height: 80 * fem,
                        decoration: BoxDecoration(
                          color: CommonColor
                              .customSubNavigationDrawerBackgroundColor[index],
                          borderRadius: BorderRadius.circular(40 * fem),
                        ),
                        child: Image.asset(
                          StringConstant.subNavigationDrawerIconsList[index]
                              .toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 15 * fem,
                      ),
                      DisplayText(
                          text: StringConstant
                              .customSubNavigationDrawerIconLabel[index],
                          fontSize: 18 * fem,
                          fontWeight: FontWeight.w500,
                          color:
                              (subDrawerController.currentIndex.value == index)
                                  ? CommonColor.whiteColor
                                  : CommonColor.blackColor),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}

class PersistenceBottomBar extends StatelessWidget {
  PersistenceBottomBar({Key? key}) : super(key: key);

  final mainScreenController = Get.put(MainDrawerController());

  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: CommonColor.blackColor,
            offset: Offset(6 * fem, 0),
            blurRadius: 5 * fem,
          ),
        ],
      ),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                StringConstant.customNavigationDrawerIconsList.length,
          ),
          itemCount: StringConstant.customNavigationDrawerIconsList.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Obx(
              () => AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                child: GestureDetector(
                  onTap: () {
                    mainScreenController.currentIndex.value = index;
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 40 * fem),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          StringConstant.customNavigationDrawerIconsList[index],
                          width: 80 * fem,
                          height: 80 * fem,
                          color:
                              mainScreenController.currentIndex.value == index
                                  ? CommonColor.green300
                                  : CommonColor.dimGray,
                        ),
                        mainScreenController.hideDrawer.value
                            ? Padding(
                                padding: EdgeInsets.only(
                                    top: 15 * fem,
                                    bottom: 5 * fem,
                                    left: 8 * fem),
                                child: DisplayText(
                                  text: StringConstant
                                      .customNavigationDrawerIconLabel[index],
                                  fontSize: 34 * fem,
                                  color:
                                      mainScreenController.currentIndex.value ==
                                              index
                                          ? CommonColor.primary
                                          : CommonColor.dimGray,
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
