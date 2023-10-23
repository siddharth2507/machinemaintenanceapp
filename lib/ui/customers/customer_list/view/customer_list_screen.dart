import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:machinemaintainapp/common_components/component/common_list_view.dart';
import 'package:machinemaintainapp/common_components/component/costomerlist_container.dart';
import 'package:machinemaintainapp/common_components/component/my_button.dart';
import 'package:machinemaintainapp/components/widgets/my_regular_text.dart';
import 'package:machinemaintainapp/routes/routes.dart';
import 'package:machinemaintainapp/session/session_helper.dart';
import 'package:machinemaintainapp/theme/color/colors.dart';
import 'package:machinemaintainapp/ui/customers/customer_list/controller/customer_controller.dart';
import 'package:machinemaintainapp/utills/sizer_utils.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  CustomerController customerController = Get.put(CustomerController());

  @override
  void initState() {
    super.initState();
    SessionHelper().setIntro(1);
    Future.delayed(const Duration(seconds: 0), () {
      setState(() {
        customerController.customerApi(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: appBarColor,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const MyRegularText(
                    label: 'Customer List',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.logOut);
                      },
                      child: SvgPicture.asset('assets/icons/user_add.svg')),
                ],
              ),
            ],
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => customerController
                            .customerResponse.value.data?.customers?.length !=
                        0
                    ? CommonList(
                        length: customerController.customerResponse.value.data
                                ?.customers?.length ??
                            0,
                        physics: const NeverScrollableScrollPhysics(),
                        child: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.customerDetail, arguments: [
                                customerController.customerResponse.value.data!
                                    .customers![index].companyName,
                                customerController.customerResponse.value.data!
                                    .customers![index].name,
                                customerController.customerResponse.value.data!
                                    .customers![index].number,
                                customerController.customerResponse.value.data!
                                    .customers![index].email,
                                customerController.customerResponse.value.data!
                                    .customers![index].id,
                              ])?.then((value) {
                                customerController.customerApi(context);
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: AppSizes.height_2,
                                  right: AppSizes.width_4,
                                  left: AppSizes.width_4),
                              child: CustomerContainer(
                                machineName: customerController.customerResponse
                                    .value.data?.customers?[index].companyName,
                                number: customerController.customerResponse
                                    .value.data?.customers?[index].number,
                                name: customerController.customerResponse.value
                                    .data?.customers?[index].name,
                                email: customerController.customerResponse.value
                                    .data?.customers?[index].email,
                                child: SvgPicture.asset(
                                    'assets/icons/arrow_right.svg'),
                              ),
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: AppSizes.height_40),
                          child: const MyRegularText(
                              label: 'No Customer Available'),
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: AppSizes.height_9),
        child: MyButton(
          text: 'Add',
          child: 'assets/icons/user_add.svg',
          onPressed: () {
            Get.toNamed(AppRoutes.addCustomer)?.then((value) {
              customerController.customerApi(context);
            });
          },
        ),
      ),
    );
  }
}
