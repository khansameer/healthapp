import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/common/common_button_widget.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/common/common_textfield.dart';
import 'package:junohealthapp/core/common/commons_screen_container.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/route/route.dart';
import 'package:junohealthapp/core/string/string_utils.dart';
import 'package:junohealthapp/provider/symptoms_cheeker_provider.dart';
import 'package:provider/provider.dart';

class SymptomsViewTwo extends StatelessWidget {
  const SymptomsViewTwo({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: commonAppBar(title: backOfHeadSysmptoms),
      backgroundColor: Colors.white,
      body: Consumer<SymptomsCheekerProvider>(
          builder: (context, provider, child) {
        return CommonsScreenContainer(
          child: ListView(
            children: [
              CommonTextField(
                top: size.height * zero002,
                hint: backOfHeadSysmptomSearch,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.categories.length,
                  itemBuilder: (context, outerIndex) {
                    final category = provider.categories[outerIndex];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: twenty,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(zero),
                          child: CommonTextWidget(
                            fontWeight: FontWeight.w600,
                            text: category.name,
                          ),
                        ),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap:
                              true, // Prevents the inner ListView from taking infinite height
                          physics:
                              const NeverScrollableScrollPhysics(), // Disables scrolling for the inner ListView
                          itemCount: category.subItems.length,
                          itemBuilder: (context, innerIndex) {
                            final subItem = category.subItems[innerIndex];
                            return ListTile(
                              onTap: () {
                                // Select the tapped sub-item
                                provider.selectSubItem(category, subItem);
                              },
                              trailing: Icon(
                                subItem.isSelected
                                    ? Icons.check_box_outlined
                                    : Icons.check_box_outline_blank_sharp,
                              ),
                              visualDensity: const VisualDensity(
                                  vertical: -2, horizontal: -2),
                              dense: true,
                              contentPadding: EdgeInsets.zero,
                              title: Text(subItem.name),
                            );
                          },
                        ),
                      ],
                    );
                  }),
              SizedBox(
                child: CommonButtonWidget(
                  top: size.height * zero03,
                  onPressed: () {
                    pushScreen(
                        context: context,
                        routeName: RouteName.symptomsViewThreeScreen);
                  },
                  text: addSymptom,
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
