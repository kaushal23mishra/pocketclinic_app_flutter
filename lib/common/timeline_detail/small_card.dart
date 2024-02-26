import 'package:flutter/material.dart';

import '../common_text.dart';
import '../responsive.dart';
import '../utils/date.dart';
import '../utils/utils.dart';

class SmallCard extends StatefulWidget {
  const SmallCard({super.key});

  @override
  State<SmallCard> createState() => _SmallCardState();
}

class _SmallCardState extends State<SmallCard> {
  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / (Responsive.isMobile(context) ? 700 : 1512);
    double ffem = fem * 0.97;
    return Container(
      width: 179*fem,
      height: 230*fem,
      decoration: BoxDecoration (
        borderRadius: BorderRadius.circular(16*fem),
      ),
      child: Column(
        children: [
          Container(
            width: 166*fem,
            height: 225*fem,
            decoration: BoxDecoration (
              borderRadius: BorderRadius.circular(16*fem),
              border: Border.all(color: const Color(0x16000000)),
              color: const Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x26000000),
                  offset: Offset(0*fem, 4*fem),
                  blurRadius: 4.4499998093*fem,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  width: 166*fem,
                  height: 14*fem,
                  decoration: BoxDecoration (
                    color: const Color(0xff3fb422),
                    borderRadius: BorderRadius.only (
                      topLeft: Radius.circular(16*fem),
                      topRight: Radius.circular(16*fem),
                      bottomLeft: Radius.circular(16*fem),
                      bottomRight: Radius.circular(16*fem),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding:  EdgeInsets.symmetric(horizontal: 8.0*fem,vertical: 8*fem),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 0*fem),
                              width: 14*fem,
                              height: 14*fem,
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.circular(7*fem),
                                color: const Color(0xff3fb422),
                              ),
                            ),
                            Text(
                              'COMPLETED',
                              style: SafeGoogleFont (
                                'Poppins',
                                fontSize: 12*ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.5*ffem/fem,
                                letterSpacing: 0.48*fem,
                                color: const Color(0xff3fb422),
                              ),
                            ),
                          ],
                        ),
                        SizedBox( height: 12.0*fem,),

                        SizedBox(
                          width: 128*fem,
                          height: 13*fem,
                          child: Text(
                            'Complete E2P 2/2',
                            style: SafeGoogleFont (
                              'Poppins',
                              fontSize: 14*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.25*ffem/fem,
                              letterSpacing: 0.28*fem,
                              color: const Color(0xff012622),
                            ),
                          ),
                        ),
                        SizedBox( height: 12.0*fem,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0*fem, 2.73*fem, 8.73*fem, 0*fem),
                              width: 10.54*fem,
                              height: 10.55*fem,
                              child: Image.asset(
                                'assets/images/carbon-attachment-cPZ.png',
                                width: 10.54*fem,
                                height: 10.55*fem,
                              ),
                            ),
                            Container(
                              constraints: BoxConstraints (
                                maxWidth: 101*fem,
                              ),
                              child: Text(
                                'Inform MN about AFC at Baseline, CD3 E2, HCG ',
                                style: SafeGoogleFont (
                                  'Poppins',
                                  fontSize: 12*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5*ffem/fem,
                                  color: const Color(0xffa2a2a2),
                                ),
                              ),
                            ),
                          ],
                        ),


                      ],
                    ),
                  ),
                ),

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.0*fem,vertical: 8.0*fem,),
                  child: Container( alignment: Alignment.bottomCenter,
                    // width: 155*fem,
                    height: 43*fem,
                    decoration: BoxDecoration (
                      color: const Color(0xff1a8d8d),
                      borderRadius: BorderRadius.circular(6*fem),
                    ),
                    child: Center(
                      child: Text(
                        'Mark as pending',
                        style: SafeGoogleFont (
                          'Poppins',
                          fontSize: 14*ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.5*ffem/fem,
                          color: const Color(0xffffffff),
                        ),
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
  const MiniCard({super.key, this.status, this.bookingStatus, this.date, this.description});

  @override
  State<MiniCard> createState() => _MiniCardState();
}

class _MiniCardState extends State<MiniCard> {
  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width /  (Responsive.isMobile(context) ? 700 : 1512);
    return Container(
      margin: EdgeInsets.fromLTRB(0*fem, 0*fem,Responsive.isMobile(context)==true? 0: 30*fem, 20*fem),
      width: 438*fem,
      // height: 327*fem,
      decoration: BoxDecoration (
        borderRadius: BorderRadius.circular(20*fem),
        border: Border.all(color: const Color(0xffefeff1)),
        color: const Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            color: const Color(0x26000000),
            offset: Offset(0*fem, 4*fem),
            blurRadius: 4.4499998093*fem,
          ),
        ],
      ),
      child:CardDetails(status:widget.status,bookingStatus:widget.bookingStatus,date: widget.date,description:widget.description)
    );
  }
}
class CardDetails extends StatefulWidget {
  final String? status;
  final String? bookingStatus;
  final String? date;
  final String? description;
  const CardDetails({super.key, this.status, this.bookingStatus, this.date, this.description});

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width /  (Responsive.isMobile(context) ? 700 : 1512);
    double ffem = fem * 0.97;
    return Row(
      children: [
        Container(
          decoration: BoxDecoration (
            color:widget.status == 'ACTIVE'?const Color(0xff3fb422):const Color(0xff585858),
            borderRadius: BorderRadius.only (
              topLeft: Radius.circular(20*fem),
              bottomLeft: Radius.circular(20*fem),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0x3f000000),
                offset: Offset(0*fem, 4*fem),
                blurRadius: 2*fem,
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20*fem,vertical: 20*fem),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 7*fem, 0*fem),
                          width: 16*fem,
                          height: 16*fem,
                          child: Image.asset(
                            'assets/images/frame-1000002909.png',
                            width: 16*fem,
                            height: 16*fem,
                            color: widget.status == 'ACTIVE'?const Color(0xff3fb422):const Color(0xff585858),
                          ),
                        ),
                        Text(
                          widget.status!,
                          // 'ACTIVE',
                          style: SafeGoogleFont (
                            'Poppins',
                            fontSize: 14*ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.5*ffem/fem,
                            letterSpacing: 0.56*fem,
                            color: widget.status == 'ACTIVE'?const Color(0xff3fb422):const Color(0xff585858),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5*fem, 4*fem, 0*fem, 2*fem),
                      width: 110*fem,
                      height: 24*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 8*fem, 2*fem),
                            width: 14*fem,
                            height: 14*fem,
                            child: Image.asset(
                              'assets/images/octicon-clock-16.png',
                              width: 14*fem,
                              height: 14*fem,
                            ),
                          ),
                          Text(
                            'Jan 31, 2024',
                            style: SafeGoogleFont (
                              'Poppins',
                              fontSize: 12*ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.5*ffem/fem,
                              color: const Color(0xff585858),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20*fem,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 11.93*fem),
                      width: 45.57*fem,
                      height: 34.83*fem,
                      child: Image.asset(
                        'assets/images/auto-group-g9p9.png',
                        width: 45.57*fem,
                        height: 34.83*fem,
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints (
                        maxWidth: 275*fem,
                      ),
                      child: Text(
                        widget.description!,
                        style: SafeGoogleFont (
                          'Poppins',
                          fontSize: 16*ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.25*ffem/fem,
                          letterSpacing: 0.32*fem,
                          color: const Color(0xff012622),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20*fem,),
                RichText(
                  text: TextSpan(
                    style: SafeGoogleFont (
                      'Poppins',
                      fontSize: 14*ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.5*ffem/fem,
                      color: const Color(0xff012622),
                    ),
                    children: [
                      const TextSpan(
                        text: 'Condition period - ',
                      ),
                      TextSpan(
                        text: formatDate(widget.date!),
                        style: SafeGoogleFont (
                          'Poppins',
                          fontSize: 14*ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.5*ffem/fem,
                          color: const Color(0xff012622),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10*fem,),
                RichText(
                  text: TextSpan(
                    style: SafeGoogleFont (
                      'Poppins',
                      fontSize: 14*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.5*ffem/fem,
                      color: const Color(0xff012622),
                    ),
                    children: [
                      TextSpan(
                        text: 'Verification status - ',
                        style: SafeGoogleFont (
                          'Poppins',
                          fontSize: 14*ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.5*ffem/fem,
                          color: const Color(0xff012622),
                        ),
                      ),
                      TextSpan(
                        text: widget.bookingStatus!,
                        style: SafeGoogleFont (
                          'Poppins',
                          fontSize: 14*ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.5*ffem/fem,
                          color: widget.bookingStatus == 'Confirmed'?const Color(0xff3fb422): Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10*fem,),
                CommonText(
                  imageHeight:18*fem,
                  fontSize: 14*fem,
                  image: 'assets/images/maki-doctor-2LF.png',
                  name: 'Dr. Javier',
                  designation: 'UCSF Health',
                ),

                Container(
                  decoration: BoxDecoration (
                    color: const Color(0xff1a8d8d),
                    borderRadius: BorderRadius.circular(6*fem),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 8*fem),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0.23*fem, 0*fem, 0*fem, 1.07*fem),
                          width: 20.55*fem,
                          height: 14.58*fem,
                          child: Image.asset(
                            'assets/images/vector.png',

                          ),
                        ),SizedBox(width: 10*fem,),
                        Text(
                          'AI Insights',
                          style: SafeGoogleFont (
                            'Poppins',
                            fontSize: 14*ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.5*ffem/fem,
                            letterSpacing: 0.14*fem,
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
