import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../CommonWidgets/common_app_bar.dart';
import '../../../CommonWidgets/common_button.dart';
import '../../../CommonWidgets/common_text_field_view.dart';
import '../../../CommonWidgets/dropdown.dart';
import '../../../CommonWidgets/remove_focuse.dart';
import '../controllers/fromtwoscreen_controller.dart';

class FromtwoscreenView extends GetView<FromtwoscreenController> {
  FromtwoscreenView({Key? key}) : super(key: key);

  @override
  FromtwoscreenController controller = Get.find<FromtwoscreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RemoveFocuse(
        onClick: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonAppbarView(
              iconData: Icons.arrow_back,
              titleText: "Form 2",
              isBackVisible: true,
              onBackClick: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CommonTextFieldView1(
                      controller: controller.aboutTextEditingController,
                      errorText: "",
                      titleText: "About",
                      borderRadius: 8,
                      height: 140,
                      // padding: const EdgeInsets.only(left: 18, right: 18, bottom: 8),
                      hintText:
                      "Enter about",
                      keyboardType: TextInputType.text,
                      onChanged: (String txt) {
                        if (controller.allValidation()) {
                          controller.isBtnEnable.value = true;
                          controller.isBtnEnable.refresh();
                        } else {
                          controller.isBtnEnable.value = false;
                          controller.isBtnEnable.refresh();
                        }
                      },
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: CommonButton(
                            padding: const EdgeInsets.only(left: 18, right: 5, bottom: 8),
                            buttonText: "Write with A.I.",
                            radius: 8,
                            height: 40,
                            isIcon: true,
                            icon: Icons.star,
                            backgroundColor: const Color(0xFF002351),
                            iconColor: Colors.orange,
                            onTap: () {
                              // NavigationServices(context).gotoTabScreen();
                            },
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: CommonButton(
                            padding: const EdgeInsets.only(left: 18, right: 18, bottom: 8),
                            buttonText: "Type",
                            radius: 8,
                            height: 40,
                            textColor: const Color(0xFF002351),
                            backgroundColor: Colors.white,


                            onTap: () {
                              // NavigationServices(context).gotoTabScreen();
                            },
                          ),
                        ),
                      ],
                    ),
                    CommonTextFieldView(
                      controller: controller.portFolioTextEditingController,
                      errorText: "",
                      titleText: "Portfolio link",
                      borderRadius: 8,
                      // padding: const EdgeInsets.only(left: 18, right: 18, bottom: 8),
                      hintText:
                      "Enter your Portfolio link",
                      keyboardType: TextInputType.text,
                      onChanged: (String txt) {
                        if (controller.allValidation()) {
                          controller.isBtnEnable.value = true;
                          controller.isBtnEnable.refresh();
                        } else {
                          controller.isBtnEnable.value = false;
                          controller.isBtnEnable.refresh();
                        }
                      },
                    ),
                    DropDownField().formDropDownCheckBoxMap(
                        controller.languages,
                            (value) {
                          controller.selectedLanguages = value;
                          if (controller.allValidation()) {
                            controller.isBtnEnable.value = true;
                            controller.isBtnEnable.refresh();
                          } else {
                            controller.isBtnEnable.value = false;
                            controller.isBtnEnable.refresh();
                          }
                          if (kDebugMode) {
                            print(value);
                          }
                        },
                        "Languages",
                        0.9,

                        onChanged: (index, selectValue) {
                          if (kDebugMode) {
                            print(">>>>>>>>>$selectValue");
                          }
                        },
                        dialogHeight: 450
                    ),


                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Obx(() {
                    return CommonButton(
                      padding: const EdgeInsets.only(left: 18, right: 18, bottom: 8),
                      buttonText: "Submit",
                      radius: 8,
                      height: 40,
                      backgroundColor: const Color(0xFF002351),
                      isClickable: controller.isBtnEnable.value,

                      onTap: () {
                        controller.callPopup();

                        // NavigationServices(context).gotoTabScreen();
                      },
                    );
                  }),
                ),
                Expanded(
                  flex: 3,
                  child: CommonButton(
                    padding: const EdgeInsets.only(left: 18, right: 18, bottom: 8),
                    buttonText: "Back",
                    radius: 8,
                    height: 40,
                    backgroundColor: Colors.white,
                    textColor: const Color(0xFF002351),

                    onTap: () {
                      // controller.callPopup();
                      Get.back();

                      // NavigationServices(context).gotoTabScreen();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
