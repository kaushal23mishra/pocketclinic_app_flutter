import 'package:flutter/material.dart';
import 'package:pocketclinic/widget/text_widget.dart';
import '../common_color.dart';
import '../common_image.dart';
import '../common_text.dart';
import '../utils/responsive_utils.dart';
import '../utils/date_utils.dart';

class SmallCard extends StatefulWidget {
  const SmallCard({super.key});

  @override
  State<SmallCard> createState() => _SmallCardState();
}

class _SmallCardState extends State<SmallCard> {
  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return Container(
      width: 179 * fem,
      height: 230 * fem,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16 * fem),
      ),
      child: Column(
        children: [
          Container(
            width: 166 * fem,
            height: 225 * fem,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16 * fem),
              border: Border.all(
                color: CommonColor.blackColor,
              ),
              color: CommonColor.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: CommonColor.blackColor,
                  offset: Offset(0 * fem, 4 * fem),
                  blurRadius: 4.4499998093 * fem,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  width: 166 * fem,
                  height: 14 * fem,
                  decoration: BoxDecoration(
                    color: CommonColor.lightGreen,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16 * fem),
                      topRight: Radius.circular(16 * fem),
                      bottomLeft: Radius.circular(16 * fem),
                      bottomRight: Radius.circular(16 * fem),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.0 * fem, vertical: 8 * fem),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 5 * fem, 0 * fem),
                              width: 14 * fem,
                              height: 14 * fem,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7 * fem),
                                color: CommonColor.lightGreen,
                              ),
                            ),
                            DisplayText(
                              text: 'COMPLETED',
                              fontSize: 12 * fem,
                              letterSpacing: 0.48 * fem,
                              color: CommonColor.lightGreen,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.0 * fem,
                        ),
                        SizedBox(
                          width: 128 * fem,
                          height: 13 * fem,
                          child: const DisplayText(
                            text: 'Complete E2P 2/2',
                            fontWeight: FontWeight.w400,
                            color: CommonColor.deepGreen,
                          ),
                        ),
                        SizedBox(
                          height: 12.0 * fem,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 2.73 * fem, 8.73 * fem, 0 * fem),
                              width: 10.54 * fem,
                              height: 10.55 * fem,
                              child: Image.asset(
                                'assets/images/carbon-attachment-cPZ.png',
                                width: 10.54 * fem,
                                height: 10.55 * fem,
                              ),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: 101 * fem,
                              ),
                              child: DisplayText(
                                text:
                                    'Inform MN about AFC at Baseline, CD3 E2, HCG ',
                                fontSize: 12 * fem,
                                fontWeight: FontWeight.w400,
                                color: CommonColor.grey600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0 * fem,
                    vertical: 8.0 * fem,
                  ),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    // width: 155*fem,
                    height: 43 * fem,
                    decoration: BoxDecoration(
                      color: CommonColor.primary,
                      borderRadius: BorderRadius.circular(6 * fem),
                    ),
                    child: const Center(
                      child: DisplayText(
                        text: 'Mark as pending',
                        fontWeight: FontWeight.w500,
                        color: CommonColor.whiteColor,
                      ),
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

class MiniCard extends StatefulWidget {
  final String? status;
  final String? bookingStatus;
  final String? date;
  final String? description;
  const MiniCard(
      {super.key,
      this.status,
      this.bookingStatus,
      this.date,
      this.description});

  @override
  State<MiniCard> createState() => _MiniCardState();
}

class _MiniCardState extends State<MiniCard> {
  @override
  Widget build(BuildContext context) {
//fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return Container(
        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem,
            Responsive.isMobile(context) == true ? 0 : 30 * fem, 20 * fem),
        width: 438 * fem,
        // height: 327*fem,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20 * fem),
          border: Border.all(color: CommonColor.whiteColor),
          color: CommonColor.whiteColor,
          boxShadow: [
            BoxShadow(
              color: CommonColor.blackColor,
              offset: Offset(0 * fem, 4 * fem),
              blurRadius: 4.4 * fem,
            ),
          ],
        ),
        child: CardDetails(
            status: widget.status,
            bookingStatus: widget.bookingStatus,
            date: widget.date,
            description: widget.description));
  }
}

class CardDetails extends StatefulWidget {
  final String? status;
  final String? bookingStatus;
  final String? date;
  final String? description;
  const CardDetails(
      {super.key,
      this.status,
      this.bookingStatus,
      this.date,
      this.description});

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: widget.status == 'ACTIVE'
                ? CommonColor.lightGreen
                : CommonColor.grey600,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20 * fem),
              bottomLeft: Radius.circular(20 * fem),
            ),
            boxShadow: [
              BoxShadow(
                color: CommonColor.blackColor,
                offset: Offset(0 * fem, 4 * fem),
                blurRadius: 2 * fem,
              ),
            ],
          ),
        ),
        Expanded(
            child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 20 * fem, vertical: 20 * fem),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 1 * fem, 7 * fem, 0 * fem),
                        width: 16 * fem,
                        height: 16 * fem,
                        child: Image.asset(
                          'assets/images/frame-1000002909.png',
                          width: 16 * fem,
                          height: 16 * fem,
                          color: widget.status == 'ACTIVE'
                              ? CommonColor.lightGreen
                              : CommonColor.grey600,
                        ),
                      ),
                      DisplayText(
                        text: widget.status!,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.56 * fem,
                        color: widget.status == 'ACTIVE'
                            ? CommonColor.lightGreen
                            : CommonColor.grey600,
                      ),
                    ],
                  ),
                  Container(
                    padding:
                        EdgeInsets.fromLTRB(5 * fem, 4 * fem, 0 * fem, 2 * fem),
                    width: 110 * fem,
                    height: 24 * fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 8 * fem, 2 * fem),
                          width: 14 * fem,
                          height: 14 * fem,
                          child: Image.asset(
                            CommonImage.clock,
                            width: 14 * fem,
                            height: 14 * fem,
                          ),
                        ),
                        DisplayText(
                          text: 'Jan 31, 2024',
                          fontSize: 12 * fem,
                          fontWeight: FontWeight.w500,
                          color: CommonColor.grey600,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20 * fem,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 10 * fem, 11.93 * fem),
                    width: 45.57 * fem,
                    height: 34.83 * fem,
                    child: Image.asset(
                      'assets/images/auto-group-g9p9.png',
                      width: 45.57 * fem,
                      height: 34.83 * fem,
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 275 * fem,
                    ),
                    child: DisplayText(
                      text: widget.description!,
                      fontSize: 16 * fem,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.32 * fem,
                      color: CommonColor.deepGreen,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20 * fem,
              ),
              RichText(
                text: TextSpan(
                  style: commonTextStyle(
                    context: context,
                    fontWeight: FontWeight.w500,
                    color: CommonColor.deepGreen,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Condition period - ',
                    ),
                    TextSpan(
                      text: formatDate(widget.date!),
                      style: commonTextStyle(
                        context: context,
                        fontWeight: FontWeight.w400,
                        color: CommonColor.deepGreen,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10 * fem,
              ),
              RichText(
                text: TextSpan(
                  style: commonTextStyle(
                    context: context,
                    fontWeight: FontWeight.w400,
                    color: CommonColor.deepGreen,
                  ),
                  children: [
                    TextSpan(
                      text: 'Verification status - ',
                      style: commonTextStyle(
                        context: context,
                        fontWeight: FontWeight.w500,
                        color: CommonColor.deepGreen,
                      ),
                    ),
                    TextSpan(
                      text: widget.bookingStatus!,
                      style: commonTextStyle(
                        context: context,
                        fontWeight: FontWeight.w400,
                        color: widget.bookingStatus == 'Confirmed'
                            ? CommonColor.lightGreen
                            : CommonColor.red600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10 * fem,
              ),
              CommonText(
                imageHeight: 18 * fem,
                fontSize: 14 * fem,
                image: CommonImage.hospital,
                name: 'Dr. Javier',
                designation: 'UCSF Health',
              ),
              Container(
                decoration: BoxDecoration(
                  color: CommonColor.primary,
                  borderRadius: BorderRadius.circular(6 * fem),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8 * fem),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0.23 * fem, 0 * fem, 0 * fem, 1.07 * fem),
                        width: 20.55 * fem,
                        height: 14.58 * fem,
                        child: Image.asset(
                          CommonImage.vector,
                        ),
                      ),
                      SizedBox(
                        width: 10 * fem,
                      ),
                      DisplayText(
                        text: 'AI Insights',
                        letterSpacing: 0.14 * fem,
                        color: CommonColor.whiteColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ))
      ],
    );
  }
}
