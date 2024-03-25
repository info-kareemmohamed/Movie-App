// import 'package:flutter/material.dart';
// import 'package:flutter_project/core/utils/app_text_style.dart';
//
// import '../../../core/utils/app_colors.dart';
//
// class OrDivider extends StatelessWidget {
//   const OrDivider({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       padding: const EdgeInsets.all(13.0),
//       margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
//       width: size.width * 0.9,
//       child: Row(
//         children: <Widget>[
//           buildDivider(),
//           Center(
//             child: Text(
//               " Or sign in using ",
//               style: AppTextStyle.regular(
//                 fontSize: 14.12,
//                 color: AppColors.lightRed,
//               ),
//             ),
//           ),
//           buildDivider(),
//         ],
//       ),
//     );
//   }
//
//   Expanded buildDivider() {
//     return const Expanded(
//       child: Divider(
//         color: AppColors.lightRed,
//         height: 1.5,
//       ),
//     );
//   }
// }
