import 'package:flutter/material.dart';
import 'package:pocketclinic/common/timeline_detail/small_card.dart';

import '../common_button.dart';
import '../common_color.dart';
import '../common_image.dart';
import '../common_text.dart';
import '../utils/responsive_utils.dart';

class MainCard extends StatefulWidget {
  const MainCard({super.key});

  @override
  State<MainCard> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return Container(
      margin: EdgeInsets.fromLTRB(0 * fem, 10 * fem, 0 * fem, 33 * fem),
      padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 17 * fem),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: CommonColor.blackColor),
        color: CommonColor.primary,
        borderRadius: BorderRadius.circular(20 * fem),
        boxShadow: [
          BoxShadow(
            color: CommonColor.blackColor,
            offset: Offset(0 * fem, 11 * fem),
            blurRadius: 16.1000003815 * fem,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding:
                  EdgeInsets.fromLTRB(32 * fem, 32 * fem, 32 * fem, 32 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: CommonColor.whiteColor,
                borderRadius: BorderRadius.circular(20 * fem),
              ),
              child: Responsive.isMobile(context)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SimpleHeadingText(
                          content: 'Outpatient',
                        ),
                        const CommonText(
                          image: CommonImage.clock,
                          name: 'Dec 31, 2023',
                        ),
                        const CommonText(
                          image: CommonImage.stethoscope,
                          name: 'Dr. Javier Villanueva-Meyer',
                          designation: 'UCSF Health',
                        ),
                        CommonTextState(
                          textSize: 24 * fem,
                          textFont: FontWeight.w600,
                          textColor: CommonColor.blackColor,
                          title: 'Visit Summary',
                          content:
                              'You recently had an outpatient encounter with Alexandra Hobson and underwent a brain MRI for your menstrual migraine headache. The results showed a normal brain, and the report was signed by Javier Villanueva-Meyer, MD.',
                        ),
                        const CommonTextState(
                          title: 'Diagnosis and Condition Overview',
                          content:
                              'Your recent outpatient encounter focused on investigating your menstrual migraine headache. The brain MRI report indicated a normal brain without any concerning findings.',
                        ),
                        const CommonTextState(
                          title: 'Treatment and Prescriptions',
                          content:
                              'No new treatments or medications were prescribed. The brain MRI results showed no abnormalities.',
                        ),
                        const CommonTextState(
                          title: 'Advice and Recommendations',
                          content:
                              'It\'s reassuring that the brain MRI showed no concerning abnormalities. Continue to monitor and manage your menstrual migraine headache as previously advised. Consider discussing the results with your healthcare provider if any further action is necessary.',
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 46 * fem,
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomContainer(
                                imagePath: CommonImage.notes,
                                text: 'Dr. Martha’s Notes',
                              ),
                              CustomContainer(
                                imagePath: CommonImage.clip,
                                text: 'Dr. Martha’s Notes',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 28 * fem,
                        ),
                        const SmallHeading(
                          text: 'Your Tasks',
                          image: CommonImage.vector,
                        ),
                        SizedBox(
                          height: 28 * fem,
                        ),
                        const Wrap(
                          children: [
                            SmallCard(),
                            SmallCard(),
                            SmallCard(),
                            SmallCard(),
                            SmallCard(),
                          ],
                        ),
                        SizedBox(
                          height: 28 * fem,
                        ),
                        const SmallHeading(
                          text: 'Instructions',
                          image: CommonImage.star,
                        ),
                        SizedBox(
                          height: 28 * fem,
                        ),
                        const SimpleText(
                          content:
                              'Complete the Egg Cryo labs as per the doctor\'s recommendation\n\nAttend appointments for Egg Cryo modules as scheduled\n\nFollow the prescribed protocol for E2P 2/2\n\nInform MN about AFC at Baseline, CD3 E2, and the option for HCG + Lupron',
                        ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SimpleHeadingText(
                                content: 'Outpatient',
                              ),
                              const CommonText(
                                image: CommonImage.clock,
                                name: 'Dec 31, 2023',
                              ),
                              const CommonText(
                                image: CommonImage.stethoscope,
                                name: 'Dr. Javier Villanueva-Meyer',
                                designation: 'UCSF Health',
                              ),
                              CommonTextState(
                                textSize: 24 * fem,
                                textFont: FontWeight.w600,
                                textColor: CommonColor.blackColor,
                                title: 'Visit Summary',
                                content:
                                    'You recently had an outpatient encounter with Alexandra Hobson and underwent a brain MRI for your menstrual migraine headache. The results showed a normal brain, and the report was signed by Javier Villanueva-Meyer, MD.',
                              ),
                              const CommonTextState(
                                title: 'Diagnosis and Condition Overview',
                                content:
                                    'Your recent outpatient encounter focused on investigating your menstrual migraine headache. The brain MRI report indicated a normal brain without any concerning findings.',
                              ),
                              const CommonTextState(
                                title: 'Treatment and Prescriptions',
                                content:
                                    'No new treatments or medications were prescribed. The brain MRI results showed no abnormalities.',
                              ),
                              const CommonTextState(
                                title: 'Advice and Recommendations',
                                content:
                                    'It\'s reassuring that the brain MRI showed no concerning abnormalities. Continue to monitor and manage your menstrual migraine headache as previously advised. Consider discussing the results with your healthcare provider if any further action is necessary.',
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 46 * fem,
                                child: const Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomContainer(
                                      imagePath: CommonImage.notes,
                                      text: 'Dr. Martha’s Notes',
                                    ),
                                    CustomContainer(
                                      imagePath: CommonImage.notes,
                                      text: 'Dr. Martha’s Notes',
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 28 * fem,
                              ),
                              SizedBox(
                                width: 509 * fem,
                                height: 308 * fem,
                                child: Image.asset(
                                  'assets/images/image-70.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 50 * fem,
                              ),
                              const SmallHeading(
                                text: 'Your Tasks',
                                image: CommonImage.vector,
                              ),
                              SizedBox(
                                height: 30 * fem,
                              ),
                              const Wrap(
                                children: [
                                  SmallCard(),
                                  SmallCard(),
                                  SmallCard(),
                                  SmallCard(),
                                  SmallCard(),
                                ],
                              ),
                              SizedBox(
                                height: 30 * fem,
                              ),
                              const SmallHeading(
                                text: 'Instructions',
                                image: CommonImage.star,
                              ),
                              SizedBox(
                                height: 30 * fem,
                              ),
                              const SimpleText(
                                content:
                                    'Complete the Egg Cryo labs as per the doctor\'s recommendation\n\nAttend appointments for Egg Cryo modules as scheduled\n\nFollow the prescribed protocol for E2P 2/2\n\nInform MN about AFC at Baseline, CD3 E2, and the option for HCG + Lupron',
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
          SizedBox(
            height: 24 * fem,
          ),
          const ListTileText(
            text: 'COMPRESS',
          ),
        ],
      ),
    );
  }
}
