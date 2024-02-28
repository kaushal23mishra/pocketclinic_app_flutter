import 'package:flutter/material.dart';
import 'package:pocketclinic/common/utils/responsive_utils.dart';
import 'package:pocketclinic/widget/input_widget.dart';
import 'package:pocketclinic/widget/text_widget.dart';
import 'common_color.dart';
import 'common_image.dart';
import 'common_text.dart';
import 'common_drawer.dart';

class CommonCard extends StatefulWidget {
  final String? status;
  final String? task;
  final String? visitId;
  final String? taskId;
  final TextEditingController? kController;

  final Function()? onTapFunction;

  const CommonCard({
    super.key,
    this.status,
    this.task,
    this.visitId,
    this.taskId,
    this.onTapFunction,
    this.kController,
  });

  @override
  State<CommonCard> createState() => _CommonCardState();
}

class _CommonCardState extends State<CommonCard> {
  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return Container(
      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 20 * fem, 0 * fem),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20 * fem),
        boxShadow: [
          BoxShadow(
            color: CommonColor.blackColor,
            offset: Offset(0 * fem, 4 * fem),
            blurRadius: 2 * fem,
          ),
        ],
      ),
      child: SizedBox(
        width: 378 * fem,
        height: 220 * fem,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20 * fem),
            color: CommonColor.whiteColor,
            boxShadow: [
              BoxShadow(
                color: CommonColor.blackColor,
                offset: Offset(0 * fem, 4 * fem),
                blurRadius: 4.4499998093 * fem,
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(
                width: 19 * fem,
                height: 220 * fem,
                child: Container(
                  decoration: BoxDecoration(
                    color: CommonColor.red600,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20 * fem),
                      bottomLeft: Radius.circular(20 * fem),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 14 * fem, vertical: 14 * fem),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 14 * fem,
                                height: 14 * fem,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(7 * fem),
                                    color: widget.status! == 'PENDING'
                                        ? CommonColor.red600
                                        : CommonColor.lightGreen,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10 * fem,
                              ),
                              SizedBox(
                                width: 56 * fem,
                                height: 18 * fem,
                                child: DisplayText(
                                  text: widget.status!,
                                  fontSize: 12 * fem,
                                  letterSpacing: 0.48 * fem,
                                  color: widget.status! == 'PENDING'
                                      ? CommonColor.red600
                                      : CommonColor.lightGreen,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 14 * fem,
                                height: 14 * fem,
                                child: Image.asset(
                                  CommonImage.clock,
                                  width: 14 * fem,
                                  height: 14 * fem,
                                ),
                              ),
                              SizedBox(
                                width: 10 * fem,
                              ),
                              SizedBox(
                                width: 73 * fem,
                                height: 18 * fem,
                                child: DisplayText(
                                  text: 'Jan 31, 2024',
                                  fontSize: 12 * fem,
                                  fontWeight: FontWeight.w500,
                                  color: CommonColor.grey600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 317 * fem,
                        height: 60 * fem,
                        child: DisplayText(
                          text: widget.task!,
                          fontSize: 16 * fem,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.32 * fem,
                          color: CommonColor.deepGreen,
                        ),
                      ),
                      CustomInput(
                        fontSize: Responsive.isMobile(context) == true
                            ? 15 * fem
                            : 25 * fem,
                        controller: widget.kController!,
                        validation: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter note';
                          }
                          return null;
                        },
                        topLabel: "Note",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CommonText(
                              imageHeight: 13 * fem,
                              fontSize: 10 * fem,
                              image: CommonImage.stethoscope,
                              name: 'Dr. Javier',
                              designation: 'UCSF Health',
                            ),
                          ),
                          GestureDetector(
                            onTap: widget.onTapFunction!,
                            child: Container(
                              width: 146 * fem,
                              height: 43 * fem,
                              decoration: BoxDecoration(
                                color: CommonColor.primary,
                                borderRadius: BorderRadius.circular(6 * fem),
                              ),
                              child: const Center(
                                child: DisplayText(
                                  text: 'Mark as done',
                                  fontWeight: FontWeight.w500,
                                  color: CommonColor.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCategoryCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final Color backgroundColor;
  final Color textColor;

  const CustomCategoryCard({
    required this.imagePath,
    required this.title,
    this.backgroundColor = CommonColor.red600,
    this.textColor = CommonColor.deepGreen,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);

    return Container(
      padding: EdgeInsets.fromLTRB(5 * fem, 0, 5 * fem, 0),
      width: 264 * fem,
      height: 81 * fem,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 10 * fem, 0),
            width: 56 * fem,
            height: 56 * fem,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(28 * fem),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          DisplayText(
            text: title,
            fontSize: 20 * fem,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ],
      ),
    );
  }
}

class StatusContainer extends StatelessWidget {
  final Color color;
  final String count;
  final String status;

  const StatusContainer({
    Key? key,
    required this.color,
    required this.count,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);

    return Container(

        // margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 24 * fem, 0 * fem),
        width: 142 * fem,
        height: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: CommonColor.blackColor),
          color: CommonColor.whiteColor,
          borderRadius: BorderRadius.circular(16 * fem),
          boxShadow: [
            BoxShadow(
              color: CommonColor.blackColor,
              offset: Offset(0 * fem, 4 * fem),
              blurRadius: 4.4 * fem,
            ),
          ],
        ),
        child: CardText(
          color: color,
          count: count,
          status: status,
        ));
  }
}

class TaskBox extends StatefulWidget {
  const TaskBox({super.key});

  @override
  State<TaskBox> createState() => _TaskBoxState();
}

class _TaskBoxState extends State<TaskBox> {
  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return Container(
      margin: EdgeInsets.fromLTRB(0 * fem, 26 * fem, 0 * fem, 20 * fem),
      padding: EdgeInsets.fromLTRB(0 * fem, 9 * fem, 12 * fem, 12 * fem),
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: CommonColor.blackColor),
        color: CommonColor.whiteColor,
        borderRadius: BorderRadius.circular(16 * fem),
        boxShadow: [
          BoxShadow(
            color: CommonColor.blackColor,
            offset: Offset(0 * fem, 4 * fem),
            blurRadius: 4.4 * fem,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 12 * fem,
          ),
          const CardText(
            color: CommonColor.blackColor,
            count: '4',
            status: 'Task',
          ),
          SizedBox(
            width: 8 * fem,
          ),
          const StatusContainer(
            color: CommonColor.red600,
            count: '3',
            status: 'Pending',
          ),
          const StatusContainer(
            color: CommonColor.lightGreen,
            count: '1',
            status: 'Completed',
          ),
        ],
      ),
    );
  }
}

class CardText extends StatefulWidget {
  final Color color;
  final String count;
  final String status;
  const CardText(
      {super.key,
      required this.color,
      required this.count,
      required this.status});

  @override
  State<CardText> createState() => _CardTextState();
}

class _CardTextState extends State<CardText> {
  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DisplayText(
          text: widget.count,
          fontSize: 64 * fem,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.28 * fem,
          color: widget.color,
        ),
        DisplayText(
          text: widget.status,
          align: TextAlign.center,
          fontSize: 20 * fem,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.4 * fem,
          color: widget.color,
        ),
      ],
    );
  }
}

class CommonCategoryCard extends StatefulWidget {
  const CommonCategoryCard({super.key});

  @override
  State<CommonCategoryCard> createState() => _CommonCategoryCardState();
}

class _CommonCategoryCardState extends State<CommonCategoryCard> {
  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return Container(
      margin: EdgeInsets.fromLTRB(10 * fem, 0 * fem, 10 * fem, 18 * fem),
      padding: EdgeInsets.fromLTRB(24 * fem, 2 * fem, 46 * fem, 4 * fem),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300, // Set your desired border color here
          width: 1.5, // Set the border width
        ),
        borderRadius: BorderRadius.circular(40 * fem),
      ),
      child: Container(
        margin: EdgeInsets.fromLTRB(0 * fem, 10 * fem, 0 * fem, 10 * fem),
        width: double.infinity,
        height: 30 * fem,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 3 * fem, 0 * fem),
              padding:
                  EdgeInsets.fromLTRB(0 * fem, 0 * fem, 6.12 * fem, 0 * fem),
              height: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 10.13 * fem, 0 * fem),
                    child: Text(
                      '2023',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20 * fem,
                        fontWeight: FontWeight.w600,
                        color: CommonColor.deepGreen,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0.88 * fem, 0 * fem, 0 * fem),
                    width: 8.75 * fem,
                    height: 4.38 * fem,
                    child: Image.asset(
                      CommonImage.down,
                      width: 8.75 * fem,
                      height: 4.38 * fem,
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: VisitsCategories())
          ],
        ),
      ),
    );
  }
}
