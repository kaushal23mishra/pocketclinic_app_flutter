import 'package:flutter/cupertino.dart';
import 'package:pocketclinic/common/responsive.dart';

class TextFieldContainer extends StatefulWidget {
  final Widget? kChild;

  const TextFieldContainer({Key? key, this.kChild}) : super(key: key);

  @override
  State<TextFieldContainer> createState() => _TextFieldContainerState();
}

class _TextFieldContainerState extends State<TextFieldContainer> {
  @override
  Widget build(BuildContext context) {
    double fem =
        MediaQuery.of(context).size.width / (Responsive.isMobile(context) ? 700 : 1512);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffefeff1)),
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(12 * fem),
        boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            offset: Offset(0 * fem, 9 * fem),
            blurRadius: 5 * fem,
          ),
        ],
      ),
      child: widget.kChild,
    );
  }
}
