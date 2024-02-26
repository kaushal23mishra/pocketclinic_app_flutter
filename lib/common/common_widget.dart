// import 'package:flutter/material.dart';
// import 'package:pocketclinic/common/responsive.dart';
//
// class TaskContainer extends StatefulWidget {
//   final String? title;
//   final String? count;
//   final Color? titleColor;
//   final Color? countColor;
//
//   const TaskContainer({
//     Key? key,
//     this.title,
//     this.count,
//     this.titleColor,
//     this.countColor,
//   }) : super(key: key);
//
//   @override
//   State<TaskContainer> createState() => _TaskContainerState();
// }
//
// class _TaskContainerState extends State<TaskContainer> {
//   @override
//   Widget build(BuildContext context) {
//
//     double fem = MediaQuery.of(context).size.width / (Responsive.isMobile(context) ? 700 : 1512);
//     double ffem = fem * 0.97;
//     return Container(
//       margin: EdgeInsets.fromLTRB(0, 0, 15 * fem, 9.5 * fem),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             margin: EdgeInsets.fromLTRB(0, 0, 6 * fem, 0),
//             child: Text(
//               widget.title.toString(),
//               style: TextStyle(
//                 fontFamily: 'Poppins', // Assuming 'Poppins' is your font
//                 fontSize: 20 * ffem,
//                 fontWeight: FontWeight.w400,
//                 height: 1.5 * ffem / fem,
//                 color: widget.titleColor,
//               ),
//             ),
//           ),
//           Container(
//             width: 29 * fem,
//             height: 29 * fem,
//             decoration: BoxDecoration(
//               color: widget.titleColor,
//               borderRadius: BorderRadius.circular(14.5 * fem),
//             ),
//             child: Center(
//               child: Text(
//                 widget.count.toString(),
//                 style: TextStyle(
//                   fontFamily: 'Poppins', // Assuming 'Poppins' is your font
//                   fontSize: 16 * ffem,
//                   fontWeight: FontWeight.w500,
//                   height: 1.5 * ffem / fem,
//                   color: widget.countColor,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
