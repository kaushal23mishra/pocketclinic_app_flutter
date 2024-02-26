import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketclinic/common/responsive.dart';
import 'package:pocketclinic/common/utils/utils.dart';

import '../controllers/visit_controller.dart';
import '../widget/input_widget.dart';
import '../widget/text_field/simple_text_field.dart';
import 'common_text.dart';
import 'drawer_constant.dart';

class CommonCard extends StatefulWidget {
  final String? status;
  final String? task;
  final String? visitId;
  final String? taskId;
final  TextEditingController? kController;

 final Function()? onTapFunction;

  const CommonCard({
    super.key,
    this.status,
    this.task,
    this.visitId,
    this.taskId,this.onTapFunction, this.kController,
  });

  @override
  State<CommonCard> createState() => _CommonCardState();
}

class _CommonCardState extends State<CommonCard> {
  final _visitControllers = Get.put(VisitControllers());
  @override
  void initState() {
    // TODO: implement initState
    // _visitControllers.noteControllers = List.generate(widget.index!, (index) => TextEditingController());
    super.initState();
  }
  @override
  void dispose() {
    // Dispose all the text editing controllers
    // _visitControllers.noteControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width /
        (Responsive.isMobile(context) ? 700 : 1512);
    double ffem = fem * 0.97;
    return Container(
      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 20 * fem, 0 * fem),
      // width: 384*fem,
      // height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20 * fem),
        boxShadow: [
          BoxShadow(
            color: const Color(0x3f000000),
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
            color: const Color(0xffffffff),
            boxShadow: [
              BoxShadow(
                color: const Color(0x26000000),
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
                    color: const Color(0xffff5151),
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
                                        ? Color(0xffff5151)
                                        : Colors.green,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10 * fem,
                              ),
                              SizedBox(
                                width: 56 * fem,
                                height: 18 * fem,
                                child: Text(
                                  widget.status!,
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5 * ffem / fem,
                                    letterSpacing: 0.48 * fem,
                                    color: widget.status! == 'PENDING'
                                        ? Color(0xffff5151)
                                        : Colors.green,
                                  ),
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
                                  'assets/images/octicon-clock-16-xyM.png',
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
                                child: Text(
                                  'Jan 31, 2024',
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5 * ffem / fem,
                                    color: const Color(0xff585858),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 317 * fem,
                        height: 60 * fem,
                        child: Text(
                          widget.task!,
                          // 'Schedule a follow-up appointment for a COVID-19 vaccine booster shot at Walgreen Co.',
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.25 * ffem / fem,
                            letterSpacing: 0.32 * fem,
                            color: const Color(0xff012622),
                          ),
                        ),
                      ),
                      SimpleInput(
                        fontSize: Responsive.isMobile(context)==true?15 * fem :25 * fem,
                        controller: widget.kController!,
                        // keyboardType: TextInputType.emailAddress,
                        // onSaved: (String? value) {},
                        // onChanged: (String? value) {},
                        validation: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter note';
                          }
                          // Add any additional password validation logic here if needed
                          return null;
                        },
                        topLabel: "Note", label: '',
                        // hintText: "Enter E-mail", label: '',
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CommonText(
                              imageHeight: 13 * fem,
                              fontSize: 10 * fem,
                              image: 'assets/images/maki-doctor-MJX.png',
                              name: 'Dr. Javier',
                              designation: 'UCSF Health',
                            ),
                          ),
                          GestureDetector(
                            onTap: widget.onTapFunction!,
                              // Validate the form
                              // setState(() {
                              //   _visitControllers.callUpdateVisitApi(
                              //     visitId: widget.visitId!,
                              //     taskId: widget.taskId!,
                              //     note: _visitControllers.noteControllers.isNotEmpty && widget.index! < _visitControllers.noteControllers.length
                              //         ? _visitControllers.noteControllers[widget.index!].text.toString()
                              //         : "",
                              //   );
                              //   _visitControllers.callVisitApi();
                              // });
                            // },

                            child: Container(
                              width: 146 * fem,
                              height: 43 * fem,
                              decoration: BoxDecoration(
                                color: const Color(0xff1a8d8d),
                                borderRadius: BorderRadius.circular(6 * fem),
                              ),
                              child: Center(
                                child: Text(
                                  'Mark as done',
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5 * ffem / fem,
                                    color: const Color(0xffffffff),
                                  ),
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
    this.backgroundColor = Colors.red,
    this.textColor = const Color(0xff012622),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / 1512;
    double ffem = fem * 0.97;

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
          Text(
            title,
            style: SafeGoogleFont(
              'Poppins',
              fontSize: 20 * ffem,
              fontWeight: FontWeight.w500,
              height: 1.5 * ffem / fem,
              color: textColor,
            ),
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
    double fem = MediaQuery.of(context).size.width /
        (Responsive.isMobile(context) ? 700 : 1512);

    return Container(

        // margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 24 * fem, 0 * fem),
        width: 142 * fem,
        height: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0x16000000)),
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(16 * fem),
          boxShadow: [
            BoxShadow(
              color: const Color(0x26000000),
              offset: Offset(0 * fem, 4 * fem),
              blurRadius: 4.4499998093 * fem,
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
    double fem = MediaQuery.of(context).size.width /
        (Responsive.isMobile(context) ? 700 : 1512);
    return Container(
      // width: 202 * fem,
      margin: EdgeInsets.fromLTRB(0 * fem, 26 * fem, 0 * fem, 20 * fem),
      padding: EdgeInsets.fromLTRB(0 * fem, 9 * fem, 12 * fem, 12 * fem),
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0x16000000)),
        color: const Color(0xffefeff1),
        borderRadius: BorderRadius.circular(16 * fem),
        boxShadow: [
          BoxShadow(
            color: const Color(0x26000000),
            offset: Offset(0 * fem, 4 * fem),
            blurRadius: 4.4499998093 * fem,
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
            color: Colors.black,
            count: '4',
            status: 'Task',
          ),
          SizedBox(
            width: 8 * fem,
          ),
          const StatusContainer(
            color: Color(0xffff5151),
            count: '3',
            status: 'Pending',
          ),
          const StatusContainer(
            color: Color(0xff3fb422),
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
    double fem = MediaQuery.of(context).size.width /
        (Responsive.isMobile(context) ? 700 : 1512);
    double ffem = fem * 0.97;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.count,
          style: SafeGoogleFont(
            'Poppins',
            fontSize: 64 * ffem,
            fontWeight: FontWeight.w400,
            height: 1.25 * ffem / fem,
            letterSpacing: 1.28 * fem,
            color: widget.color,
          ),
        ),
        Text(
          widget.status,
          textAlign: TextAlign.center,
          style: SafeGoogleFont(
            'Poppins',
            fontSize: 20 * ffem,
            fontWeight: FontWeight.w500,
            height: 1.25 * ffem / fem,
            letterSpacing: 0.4 * fem,
            color: widget.color,
          ),
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
    double fem = MediaQuery.of(context).size.width /
        (Responsive.isMobile(context) ? 700 : 1512);
    double ffem = fem * 0.97;
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
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.5 * ffem / fem,
                        color: const Color(0xff012622),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0.88 * fem, 0 * fem, 0 * fem),
                    width: 8.75 * fem,
                    height: 4.38 * fem,
                    child: Image.asset(
                      'assets/images/iconamoon-arrow-up-2-light.png',
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
