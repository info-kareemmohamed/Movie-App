// import 'package:flutter/material.dart';
//
// import 'flutter_switch_button.dart';
//
// class ModeAndNotificationView extends StatelessWidget {
//    ModeAndNotificationView({super.key,required this.modeOnToggle,required this.NotificationOnToggle});
//
//   ValueChanged<bool> modeOnToggle,NotificationOnToggle;
//
//   @override
//   Widget build(BuildContext context) {
//     return   Column(
//       children: [
//         FlutterSwitchButton(
//           type: 'Mode',
//           options: 'Light & Dark Mode',
//           activeIcon: Icons.dark_mode_sharp,
//           inActiveIcon: Icons.sunny,
//           onToggle: ((value) {
//             context.read<AppLayoutCubit>().changeMode();
//           }),
//           value: context.read<AppLayoutCubit>().isDark,
//         ),
//         FlutterSwitchButton(
//           type: 'Notification',
//           options: 'Allow Notification',
//           onToggle: ((value) {
//             context.read<AppLayoutCubit>().allowNotification();
//           }),
//           value: context.read<AppLayoutCubit>().isAllow,
//         ),
//       ],
//     );
//   }
// }
