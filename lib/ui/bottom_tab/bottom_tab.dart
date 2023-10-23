import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:machinemaintainapp/components/widgets/my_regular_text.dart';
import 'package:machinemaintainapp/routes/routes.dart';
import 'package:machinemaintainapp/ui/customers/customer_list/controller/customer_controller.dart';

import '../../theme/color/colors.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({Key? key}) : super(key: key);

  static Route<String> route() {
    return MaterialPageRoute(builder: (_) => const BottomTab());
  }

  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  CustomerController controller = Get.put(CustomerController());
  Widget? _child;
  int selectedIndex = 0;

  int _page = 0;
  var uid;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      extendBody: true,
      body: Navigator(
        reportsRouteUpdateToEngine: true,
        key: Get.nestedKey(2),
        initialRoute: AppRoutes.customer,
        onGenerateRoute: controller.onGenerateRoute,
      ),
      bottomNavigationBar: SizedBox(
        height: 65,
        child: CustomNavigationBar(
          iconSize: 30.0,
          selectedColor: primaryButtonColor,
          strokeColor: const Color(0x30040307),
          unSelectedColor: const Color(0xffd9d9d9),
          backgroundColor: Colors.white,
          items: [
            CustomNavigationBarItem(
              // selectedIcon: Image.asset('assets/icons/line.png'),
              icon: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: SvgPicture.asset('assets/icons/frame.svg',color: _page == 0 ? primaryButtonColor : Colors.grey,)
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: MyRegularText(
                  fontSize: 12,
                  label: 'Customers',
                  fontWeight: FontWeight.w400,
                  color: _page == 0 ? primaryButtonColor : Colors.grey,
                ),
              ),
            ),
            CustomNavigationBarItem(
                icon: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child:  SvgPicture.asset('assets/icons/calendar_tick.svg',color: _page == 1 ? primaryButtonColor : Colors.grey,)
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: MyRegularText(
                    label: 'History',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: _page == 1 ? primaryButtonColor : Colors.grey,
                  ),
                )),
            CustomNavigationBarItem(

                icon:  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: SvgPicture.asset('assets/icons/calendar_edit.svg',color: _page == 2 ? primaryButtonColor : Colors.grey,)
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: MyRegularText(
                    label: 'Upcoming',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: _page == 2 ? primaryButtonColor : Colors.grey,
                  ),
                )),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
              _handleNavigationChange(_page);
            });
          },
        ),
      ),
    );
  }

  Future? _handleNavigationChange(int index) async {
    selectedIndex = index;
    switch (index) {
      case 0:
        return await Get.offAllNamed(AppRoutes.customer, id: 2);
      case 1:
        return await Get.offAllNamed(AppRoutes.history, id: 2);
      case 2:
        return await Get.offAllNamed(AppRoutes.upComing, id: 2);
    }
    _child = AnimatedSwitcher(
      switchInCurve: Curves.fastOutSlowIn,
      switchOutCurve: Curves.fastLinearToSlowEaseIn,
      duration: const Duration(milliseconds: 250),
      child: _child,
    );
  }
}
