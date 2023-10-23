import 'package:flutter/material.dart';

import '../../theme/color/colors.dart';
import '../common_size/nk_general_size.dart';
import '../widgets/my_regular_selecteble_text.dart';
import '../widgets/my_regular_text.dart';

class NkStepper extends StatelessWidget {
  final List<Step>? stepsData;
  final Widget Function(BuildContext, ControlsDetails)? controlsBuilder;
  final StepperType type;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? margin;
  final int currentStep;
  final void Function(int)? onStepTapped;
  const NkStepper(
      {super.key,
      this.stepsData,
      this.controlsBuilder,
      this.type = StepperType.vertical,
      this.physics,
      this.margin,
      this.currentStep = 0,
      this.onStepTapped});

  @override
  Widget build(BuildContext context) {
    return Stepper(
        controlsBuilder: controlsBuilder ??
            (BuildContext context, ControlsDetails details) {
              return Container();
            },
        type: type,
        physics: physics ??
            NkGeneralSize.commonPysics(physics: const ClampingScrollPhysics()),
        margin: margin,
        currentStep: currentStep,
        onStepTapped: onStepTapped,
        steps: stepsData ??
            <Step>[
              Step(
                title: MyRegularText(
                  label: "Step 1",
                  fontWeight: NkGeneralSize.nkBoldFontWeight(),
                ),
                content: const Column(
                  children: [
                    MyRegularSelectableText(
                      label: 'XYZ Shop, City',
                    ),
                    Divider(
                      height: 0.2,
                      color: skyBlueColor,
                    )
                  ],
                ),
              ),
              Step(
                title: MyRegularText(
                  label: "Step 2",
                  fontWeight: NkGeneralSize.nkBoldFontWeight(),
                ),
                content: const Column(
                  children: [
                    MyRegularSelectableText(
                      label: 'XYZ Shop, City',
                    ),
                    Divider(
                      height: 0.2,
                      color: skyBlueColor,
                    )
                  ],
                ),
              ),
            ]);
  }
}
