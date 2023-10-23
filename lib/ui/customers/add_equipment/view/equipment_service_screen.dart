import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:idkit_inputformatters/idkit_inputformatters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:machinemaintainapp/common_components/component/equipment_service_container.dart';
import 'package:machinemaintainapp/common_components/component/my_common_formfield.dart';
import 'package:machinemaintainapp/components/widgets/common_snackbar.dart';
import 'package:machinemaintainapp/components/widgets/my_common_container.dart';
import 'package:machinemaintainapp/components/widgets/my_regular_text.dart';
import 'package:machinemaintainapp/components/widgets/my_theme_button.dart';
import 'package:machinemaintainapp/theme/color/colors.dart';
import 'package:machinemaintainapp/ui/customers/add_equipment/controller/add_equipment_controller.dart';
import 'package:machinemaintainapp/ui/customers/customer_detail/model/equipment_response.dart';
import 'package:machinemaintainapp/utills/sizer_utils.dart';

class EquipmentServiceScreen extends StatefulWidget {
  const EquipmentServiceScreen({super.key});

  @override
  State<EquipmentServiceScreen> createState() => _EquipmentServiceScreenState();
}

class _EquipmentServiceScreenState extends State<EquipmentServiceScreen> {
  AddEquipmentController addEquipmentController = Get.find();

  final picker = ImagePicker();
  bool isVisible = true;
  String? companyName = '';
  int customer_id = 0;
  int equipment_id = 0;
  String? manufacture = '';
  String? commission = '';
  String? tenYearMajor = '';
  String? yearMajor = '';
  String? serialNumber = '';
  String? model = '';
  String? machineName = '';
  String? make = '';
  String? serviceDate = '';
  String? name = '';
  int? serviceId = 0;
  EquipmentResponse? equipmentResponse;
  @override
  void initState() {
    // TODO: implement initState
    var data = Get.arguments;
    super.initState();
    customer_id = data[0];
    equipment_id = data[1];
    make = data[3];
    machineName = data[2];
    serialNumber = data[5];
    model = data[4];
    manufacture = data[6];
    commission = data[7];
    tenYearMajor = data[8];
    yearMajor = data[9];
    companyName = data[10];
    serviceId = data[11];
  //  equipmentResponse=data[12];
   // name = data[12];
    print('serviceId>>>>>${serviceId}');
    print('customer_id>>>>>${customer_id}');
    print('equipment_id>>>>>${equipment_id}');

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
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const MyRegularText(
                    label: 'Equipment Service',
                    color: Colors.white,
                    fontSize: 20,
                    isSecondaryText: true,
                    fontWeight: FontWeight.bold,
                  ),
                  SvgPicture.asset('assets/icons/document.svg'),
                ],
              ),
            ],
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              EquipmentServiceContainer(
                companyName: companyName?.toUpperCase() ?? '',
                machineName: machineName?.toUpperCase() ?? '',
                make: make ?? '',
                model: model ?? '',
                serial: serialNumber ?? '',
                manufactureDate: manufacture ?? '',
                commissionDate: commission ?? '',
                majorDate: tenYearMajor ?? '',
                majorDatee: yearMajor ?? '',
            //    majorDatee: yearMajor ?? '',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0, left: 18, right: 18),
                child: MyCommnonContainer(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 18.0, left: 18, right: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyRegularText(
                          label: 'Last Service Details',
                          color: textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: AppFontSize.size_8,
                        ),
                        SizedBox(
                          height: AppSizes.height_1_4,
                        ),
                        MyCommonFormField(
                          isReadOnly: true,
                          controller:
                              addEquipmentController.lastServiceDateController,
                          prefixIcon: Image.asset(
                            'assets/icons/calendar_cl.png',
                          ),
                          hintText: 'Last Service Date',
                          onTap: () async {
                            DateTime? datePicked = await showDatePicker(
                                context: context,
                                firstDate: DateTime(2002),
                                lastDate: DateTime.now(),
                                initialDate: DateTime.now());
                            if (datePicked != null) {
                              setState(() {
                                addEquipmentController
                                        .lastServiceDateController.text =
                                    ('${datePicked.year}/${datePicked.month}/${datePicked.day}');
                              });
                            }
                          },
                        ),
                        MyCommonFormField(
                          // isReadOnly: true,
                          textInputType: TextInputType.number,
                          controller: addEquipmentController.hourController,
                          inputFormatters: [
                            IDKitNumeralTextInputFormatter.range(minValue: 0.0, maxValue: 9999.099)
                          ],
                          hintText:
                              'Meter Reading at Last Service (0.1hrs to 9999.9hrs)',
                          prefixIcon: const Icon(
                            Icons.timer,
                            size: 14,
                          ),
                        ),
                        MyCommnonContainer(
                          height: AppSizes.height_8,
                          color: backgroundColor,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, bottom: 8, left: 10, right: 8),
                            child: Row(
                              children: [
                                const MyRegularText(
                                  label: 'Service Type',
                                  fontSize: 12,
                                ),
                                SizedBox(
                                  width: AppSizes.width_9,
                                ),
                                Expanded(
                                  child: MyCommnonContainer(
                                      borderRadius: 6,
                                      height: 36.0,
                                      // width: 165.0,
                                      color: dropDownColor,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            value: addEquipmentController
                                                .service.value,
                                            icon: const Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color: Colors.black,
                                            ),
                                            iconSize: 24,
                                            elevation: 12,
                                            isExpanded: true,
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                addEquipmentController
                                                    .service.value = newValue!;
                                              });
                                            },
                                            items: <String>[
                                              'Engine Service',
                                              '3 Monthly Service',
                                              'Annual Service'
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: MyRegularText(
                                                  label: (value),
                                                  fontSize: 10,
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppSizes.height_2,
                        ),
                        MyCommonFormField(
                          isReadOnly: true,
                          controller:
                              addEquipmentController.nextServiceDateController,
                          prefixIcon: Image.asset(
                            'assets/icons/calendar_cl.png',
                          ),
                          hintText: 'Next Service Date',
                          onTap: () async {
                            DateTime? datePicked = await showDatePicker(
                                context: context,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2030),
                                initialDate: DateTime.now());
                            if (datePicked != null) {
                              setState(() {
                                addEquipmentController
                                        .nextServiceDateController.text =
                                    ('${datePicked.year}/${datePicked.month}/${datePicked.day}');
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0, left: 18, right: 18),
                child: MyCommnonContainer(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 18.0, left: 18, right: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyRegularText(
                            label: 'Add Notes',
                            color: textColor,
                            fontWeight: FontWeight.w400,
                            fontSize: AppFontSize.size_8),
                        SizedBox(
                          height: AppSizes.height_1_4,
                        ),
                        isVisible
                            ? DottedBorder(
                                radius: const Radius.circular(20),
                                color: Colors.black,
                                strokeWidth: 1,
                                //thickness of dash/dots
                                dashPattern: const [12, 6],
                                child: Container(
                                    width: AppSizes.width_30,
                                    height: AppSizes.height_6,
                                    color: backgroundColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/upload.svg'),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              showPicker(context: context);
                                            });
                                          },
                                          child: const MyRegularText(
                                              label: 'Attachment',
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    )),
                              )
                            : Visibility(
                                visible: !isVisible,
                                child: Row(
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: SizedBox(
                                          height: AppSizes.height_9,
                                          child: addEquipmentController
                                                      .galleryFile ==
                                                  null
                                              ? IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.upload,
                                                    size: 30,
                                                  ))
                                              : Image.file(
                                                  addEquipmentController
                                                      .galleryFile!)),
                                    ),
                                    SizedBox(
                                      width: AppSizes.width_4,
                                    ),
                                    Flexible(
                                      flex: 2,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Dialog(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  child: Image.file(
                                                      addEquipmentController
                                                          .galleryFile!),
                                                );
                                              },
                                            );
                                          });
                                        },
                                        child: MyRegularText(
                                          label: '>> Click To Preview<<',
                                          fontWeight: FontWeight.w500,
                                          color: containerTextColor,
                                          fontSize: AppFontSize.size_11_5,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        SizedBox(
                          height: AppSizes.height_1_4,
                        ),
                        MyCommonFormField(
                            controller:
                                addEquipmentController.addNoteController,
                            hintText: 'Add Notes')
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppSizes.height_3,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: MyThemeButton(
          height: AppSizes.height_6_6,
          buttonText: 'Submit',
          onPressed: () {
            if (addEquipmentController.hourController.text.isEmpty) {
              CommanSnackbar.showError('Please Enter Hour', 'Enter valid Hour');
            } else if (addEquipmentController.service.value.isEmpty) {
              CommanSnackbar.showError('Please Enter Name', 'Name is required');
            } else if (addEquipmentController
                .nextServiceDateController.text.isEmpty) {
              CommanSnackbar.showError(
                  'Please Enter Next Service Date', 'Date is required');
            } else {
              addEquipmentController
                  .saveServiceHistory(context, customer_id, equipment_id,serviceId!)
                  .then((value) {

                addEquipmentController.saveServiceHistoryFirstTime(context, customer_id, equipment_id).then((value) {Get.close(0);});
             // Get.back();
              });
            }
          /*  {
              addEquipmentController
                  .saveServiceHistoryFirstTime(context, customer_id, equipment_id)
                  .then((value) {
                addEquipmentController.saveServiceHistory(context, customer_id, equipment_id,serviceId!).then((value) {Get.close(1);});
                //  Get.back();
              });
            }*/
          },
        ),
      ),
    );
  }

  showPicker({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Icon(Icons.photo_library),
                ),
                title: const Text('Photo Library'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Icon(Icons.photo_camera),
                ),
                title: const Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future getImage(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;
    setState(
      () {
        if (xfilePick != null) {
          addEquipmentController.galleryFile = File(pickedFile!.path);
          print('GalleryFile>>>>>>>${addEquipmentController.galleryFile}');
          isVisible = false;
        } else {
          isVisible = true;
          ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }
}
