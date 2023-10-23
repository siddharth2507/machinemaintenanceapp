// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../../theme/color/colors.dart';
// import '../common_size/common_hight_width.dart';
// import '../common_size/nk_font_size.dart';
// import '../common_size/nk_spacing.dart';
// import '../widgets/my_regular_text.dart';
// import '../widgets/my_theme_button.dart';
//
// class NkSidebarXSideBar extends StatefulWidget {
//   const NkSidebarXSideBar({
//     Key? key,
//     required List<SidebarXItem> itemList,
//     required SidebarXController controller,
//     this.onTopToggleSwitch,
//   })  : _controller = controller,
//         _itemList = itemList,
//         super(key: key);
//
//   final SidebarXController _controller;
//   final List<SidebarXItem> _itemList;
//   final Function(bool)? onTopToggleSwitch;
//
//   @override
//   State<NkSidebarXSideBar> createState() => _NkSidebarXSideBarState();
// }
//
// class _NkSidebarXSideBarState extends State<NkSidebarXSideBar> {
//   bool _onSwitchSelected = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return OrientationBuilder(builder: (context, orientation) {
//       return SidebarX(
//         controller: widget._controller,
//         theme: SidebarXTheme(
//           decoration: const BoxDecoration(
//             color: backgroundColor,
//             borderRadius: BorderRadius.zero,
//           ),
//           itemMargin: EdgeInsets.zero,
//           selectedItemMargin: EdgeInsets.zero,
//           itemTextPadding: const EdgeInsets.only(left: 16.0),
//           selectedItemTextPadding: const EdgeInsets.only(left: 16.0),
//           textStyle: const TextStyle(color: primaryTextColor),
//           selectedTextStyle: const TextStyle(color: primaryColor),
//           /* itemTextPadding: const EdgeInsets.only(left: 30),
//             selectedItemTextPadding: const EdgeInsets.only(left: 30), */
//           selectedItemDecoration: BoxDecoration(
//             color: primaryColor.withOpacity(0.05),
//             border: const Border(
//               left: BorderSide(
//                 //                  <--- left side
//                 color: primaryColor,
//                 width: 3.0,
//               ),
//             ),
//           ),
//           iconTheme: IconThemeData(
//             color: Colors.black.withOpacity(0.4),
//             size: 24,
//           ),
//           selectedIconTheme: const IconThemeData(
//             color: primaryColor,
//             size: 24,
//           ),
//         ),
//         showToggleButton: false,
//         headerBuilder: (context, extended) {
//           return Padding(
//             padding: nkMediumPadding(right: 0, left: 0, top: 0, context: context),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: extended
//                   ? MainAxisAlignment.spaceBetween
//                   : MainAxisAlignment.center,
//               children: [
//                 Center(
//                   child: InkResponse(
//                       onTap: () => {
//                             widget._controller.toggleExtended(),
//                           },
//                       child: const Icon(
//                         Icons.menu_outlined,
//                         size: 36,
//                       )),
//                 ),
//                 extended
//                     ? ClipOval(
//                         child: Image.network(
//                         fit: BoxFit.cover,
//                         "https://images.unsplash.com/photo-1685288945426-ef546d237b48?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
//                         height: 32,
//                         width: 32,
//                       ))
//                     : const SizedBox(),
//                 extended ? nkSmallSizeBox() : const SizedBox(),
//                 extended
//                     ? MyRegularText(
//                         label: "dashBoardHeadingName",
//                         fontSize: NkFontSize.largeFont(),
//                       )
//                     : const SizedBox(),
//                 extended ? nkSmallSizeBox() : const SizedBox(),
//                 extended
//                     ? SizedBox(
//                         height: AppDimensions.instance!.height * 0.035,
//                         child: FittedBox(
//                           fit: BoxFit.fill,
//                           child: CupertinoSwitch(
//                               value: _onSwitchSelected,
//                               onChanged: (value) {
//                                 setState(() {
//                                   _onSwitchSelected = value;
//                                   widget.onTopToggleSwitch?.call(value);
//                                 });
//                               }),
//                         ))
//                     : const SizedBox(),
//               ],
//             ),
//           );
//         },
//         extendedTheme: SidebarXTheme(
//           width: AppDimensions.instance!.width * 0.2,
//           margin: nkRegularPadding(bottom: 0, right: 0, top: 0),
//           decoration: const BoxDecoration(
//             color: backgroundColor,
//           ),
//         ),
//         footerDivider: const Divider(),
//         /* footerBuilder: (context, extended) {
//           return extended
//               ? Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     buttonWithIcon(
//                       setting,
//                       SIdeBarIcon.ic_setting,
//                     ),
//                     nkSmallSizeBox(),
//                     buttonWithIcon(
//                       logOut,
//                       SIdeBarIcon.ic_log_out,
//                       onPressed: () async {
//                         await SessionManager.clearData();
//                         Get.offAllNamed(AppRoutes.login);
//                       },
//                     ),
//                     nkMediumSizeBox(height: height * 0.08),
//                   ],
//                 )
//               : const SizedBox();
//         }, */
//         items: widget._itemList,
//       );
//     });
//   }
//
//   Widget buttonWithIcon(String name, IconData iconData,
//       {void Function()? onPressed}) {
//     return Padding(
//       padding: nkSymmetricPadding(
//           vertical: 0,
//           horizontal:
//              AppDimensions.instance!.orientation == Orientation.portrait
//                   ? AppDimensions.instance!.width * 0.05
//                   : AppDimensions.instance!.width * 0.02),
//       child: MyThemeButton(
//         //  width: Get.size.width * 0.12,
//         height: AppDimensions.instance!.width * 0.040,
//         buttonText: "setting",
//         onPressed: onPressed,
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Icon(
//               iconData,
//               color: secondaryIconColor,
//               size: 26,
//             ),
//             nkSmallSizeBox(height: 0),
//             MyRegularText(
//               color: buttonTextColor,
//               label: name,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
