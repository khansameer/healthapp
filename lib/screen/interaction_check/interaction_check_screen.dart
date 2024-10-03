import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/common/common_button_widget.dart';
import 'package:junohealthapp/core/common/common_drop_down_view.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/common/commons_screen_container.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/image/image_path.dart';
import 'package:junohealthapp/core/route/route.dart';
import 'package:junohealthapp/core/string/string_utils.dart';
import 'package:junohealthapp/provider/interaction_provider.dart';
import 'package:provider/provider.dart';

class InteractionCheckScreen extends StatelessWidget {
  const InteractionCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: commonAppBar(title: interactionCheck),
      backgroundColor: Colors.white,
      body: Consumer<InteractionProvider>(builder: (context, provider, child) {
        return CommonsScreenContainer(
          child: ListView(
            children: [
              CommonTextWidget(
                text: selectMedicine,
              ),
              SizedBox(
                height: size.height * zero009,
              ),
              _imageView(),
              const SizedBox(
                height: twenty,
              ),
              _viewMedicine(size: size, provider: provider),
              const SizedBox(
                height: twenty,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // First container
                  Expanded(child: buildNumberBox(number: 1, size: size)),
                  const SizedBox(
                    width: ten,
                  ),
                  Expanded(child: buildNumberBox(number: 2, size: size)),
                ],
              ),
              CommonButtonWidget(
                top: size.height * 0.05,
                text: next,
                onPressed: () {
                  pushScreen(
                      context: context,
                      routeName: RouteName.interactionCheckPhaseOneScreen);
                },
              )
            ],
          ),
        );
      }),
    );
  }

  _viewMedicine({required Size size, required InteractionProvider provider}) {
    /*onChanged: (String? value) {
          */ /*setState(() {
                selectedValue = value;
              });*/ /*
        },*/
    //String? selectedValue;
    return Row(
      children: [
        Expanded(
          child: CommonDropDownView(
            size: size,
            items: provider.items,
            onChanged: (String? value) {
              provider.selectionValue = value ?? '';
            },
            selectedValue: provider.selectedValue,
            hint: "Medicine",
          ),
        ),
        const SizedBox(
          width: ten,
        ),
        Expanded(
            child: CommonDropDownView(
          size: size,
          items: provider.items,
          onChanged: (String? value) {
            provider.selectionValue = value ?? '';
          },
          selectedValue: provider.selectedValue,
          hint: "Medicine",
        ))
      ],
    );
  }

  _imageView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        setAssetImage(
            fit: BoxFit.scaleDown,
            width: oneHundred,
            height: oneHundred,
            image: icMedicine1),
        setAssetImage(
            fit: BoxFit.scaleDown,
            width: oneHundred,
            height: oneHundred,
            image: icMedicine2)
      ],
    );
  }

  buildNumberBox({required int number, required Size size}) {
    return Container(
      width: size.width * zero07,
      height: fifty,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(zero30)),
        borderRadius: BorderRadius.circular(eight),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
              alignment: Alignment.center,
              child: CommonTextWidget(
                left: twenty,
                text: '$number',
                textColor: Colors.grey,
              )),
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.arrow_drop_up, color: Colors.grey),
              Icon(Icons.arrow_drop_down, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }
}
