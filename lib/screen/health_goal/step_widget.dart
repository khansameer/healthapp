import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/common/common_button_widget.dart';
import 'package:junohealthapp/core/common/common_drop_down_view.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/common/commons_screen_container.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/route/route.dart';
import 'package:junohealthapp/core/string/string_utils.dart';
import 'package:junohealthapp/provider/health_goal_provider.dart';
import 'package:provider/provider.dart';

class StepWidget extends StatelessWidget {
  const StepWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return CommonsScreenContainer(child:
        Consumer<HealthGoalProvider>(builder: (context, provider, child) {
      return Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
            colorScheme:
                Theme.of(context).colorScheme.copyWith(primary: Colors.green),
            iconTheme: Theme.of(context).iconTheme.copyWith(size: forty)),
        child: Stepper(
          stepIconHeight: forty,
          stepIconWidth: forty,
          margin: EdgeInsets.zero,
          elevation: zero,
          stepIconMargin: EdgeInsets.zero,
          type: StepperType.horizontal,
          currentStep: provider.currentStep,
          onStepContinue: provider.nextStep,
          onStepCancel: provider.previousStep,
          steps: getSteps(stepperProvider: provider, size: size),
          controlsBuilder: (context, ControlsDetails controls) {
            return Row(
              children: [
                Expanded(
                  child: CommonButtonWidget(
                    top: size.height * zero003,
                    onPressed: provider.currentStep == 4
                        ? pushNamedAndRemoveUntil(
                            context: context,
                            routeName: RouteName.dashboardScreen)
                        : controls.onStepContinue,
                    text: continueBtn,
                  ),
                ),
                const SizedBox(width: 8),
                if (provider.currentStep > 0)
                  provider.currentStep == 4
                      ? const SizedBox.shrink()
                      : Expanded(
                          child: CommonButtonWidget(
                            borderWidth: one,
                            top: size.height * zero003,
                            colorBorder: Colors.grey,
                            colorText: Colors.black,
                            colorButton: Colors.white,
                            onPressed: controls.onStepCancel,
                            text: back,
                          ),
                        )
              ],
            );
          },
        ),
      );
    }));
  }

  List<Step> getSteps(
      {required HealthGoalProvider stepperProvider, required Size size}) {
    return [
      _buildStep(
        stepperProvider,
        stepIndex: 0,
        content: _stepCommonView(size: size),
      ),
      _buildStep(
        stepperProvider,
        stepIndex: 1,
        content: _stepCommonView(
          size: size,
          title: "What time do you want?",
        ),
      ),
      _buildStep(
        stepperProvider,
        stepIndex: 2,
        content: _stepCommonView(size: size, title: "What is your goal?"),
      ),
      _buildStep(
        stepperProvider,
        stepIndex: 3,
        content: _stepCommonView(size: size, title: "Choose a reminder?"),
      ),
      _buildStep(
        stepperProvider,
        stepIndex: 4,
        content: _stepCommonView(
            size: size,
            stepIndex: 4,
            title: "Congratulations",
            desc: "You setup your health Goal."),
      ),
    ];
  }

  StepState _getStepState(int stepIndex, int currentStep) {
    if (currentStep > stepIndex) {
      return StepState.indexed; // Completed steps
    } else if (currentStep == stepIndex) {
      return StepState.indexed; // Active step
    } else {
      return StepState.indexed; // Steps that haven't been reached
    }
  }

  Step _buildStep(
    HealthGoalProvider stepperProvider, {
    required int stepIndex,
    required Widget content,
  }) {
    bool isCurrentStep = stepperProvider.currentStep == stepIndex;

    return Step(
      title: Transform.scale(
        scale: isCurrentStep ? 1.5 : 1.0, // Zoom in for current step
        child: CommonTextWidget(text: ''),
      ),
      content: Transform.scale(
        scale: isCurrentStep
            ? 1.05
            : 1.0, // Slight zoom for current step's content
        child: content,
      ),
      isActive: stepperProvider.currentStep >= stepIndex,
      state: _getStepState(stepIndex, stepperProvider.currentStep),
    );
  }

  _stepCommonView(
      {required Size size, String? title, String? desc, int? stepIndex}) {
    final List<String> items = [
      'Item1',
      'Item2',
      'Item3',
      'Item4',
      'Item5',
      'Item6',
      'Item7',
      'Item8',
    ];
    String? selectedValue;
    return Container(
      padding: const EdgeInsets.only(
        top: fifty,
        bottom: fifty,
      ),
      decoration: commonBoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(ten),
          border:
              Border.all(color: Colors.grey.withOpacity(zero30), width: one)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonTextWidget(
            fontWeight: FontWeight.w700,
            fontSize: sixteen,
            text: title ?? "What Health tips you want?",
          ),
          CommonTextWidget(
            top: five,
            text: desc ?? "Are you looking to loss weight?",
          ),
          const SizedBox(
            height: twenty,
          ),
          stepIndex == 4
              ? const SizedBox.shrink()
              : CommonDropDownView(
                  items: items,
                  hint: 'i.e Exercise',
                  selectedValue: selectedValue,
                  size: size,
                )
        ],
      ),
    );
  }
}
