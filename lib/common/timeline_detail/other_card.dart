import 'package:flutter/cupertino.dart';

import '../common_card.dart';
import '../common_color.dart';
import '../common_image.dart';
import '../common_text.dart';
import '../utils/responsive_utils.dart';

class OtherCard extends StatefulWidget {
  const OtherCard({super.key});

  @override
  State<OtherCard> createState() => _OtherCardState();
}

class _OtherCardState extends State<OtherCard> {
  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return Container(
      padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 16 * fem),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: CommonColor.blackColor,
        ),
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
            height: (Responsive.isMobile(context) ? 500 * fem : 301 * fem),
            decoration: BoxDecoration(
              color: CommonColor.whiteColor,
              borderRadius: BorderRadius.circular(20 * fem),
            ),
            child: Responsive.isMobile(context)
                ? const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SimpleHeadingText(
                        content: 'Outpatient',
                      ),
                      CommonText(
                        image: CommonImage.clock,
                        name: 'Dec 31, 2023',
                      ),
                      CommonText(
                        image: CommonImage.stethoscope,
                        name: 'Dr. Javier Villanueva-Meyer',
                        designation: 'UCSF Health',
                      ),
                      SimpleText(
                          content:
                              'You recently had an outpatient encounter with Alexandra Hobson and underwent a brain MRI for your menstrual migraine headache. The results showed a normal brain, and the report was signed by Javier Villanueva-Meyer, MD.'),
                      Expanded(child: TaskBox())
                    ],
                  )
                : const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SimpleHeadingText(
                              content: 'Outpatient',
                            ),
                            CommonText(
                              image: CommonImage.clock,
                              name: 'Dec 31, 2023',
                            ),
                            CommonText(
                              image: CommonImage.stethoscope,
                              name: 'Dr. Javier Villanueva-Meyer',
                              designation: 'UCSF Health',
                            ),
                            SimpleText(
                                content:
                                    'You recently had an outpatient encounter with Alexandra Hobson and underwent a brain MRI for your menstrual migraine headache. The results showed a normal brain, and the report was signed by Javier Villanueva-Meyer, MD.'),
                          ],
                        ),
                      ),
                      Expanded(child: TaskBox())
                    ],
                  ),
          ),
          SizedBox(
            height: 24 * fem,
          ),
          const ListTileText(
            text: 'EXPAND',
          ),
        ],
      ),
    );
  }
}
