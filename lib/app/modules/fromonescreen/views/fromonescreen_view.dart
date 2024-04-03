import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../CommonModel/DropDownValue.dart';
import '../../../CommonModel/ProfileDetailsModel.dart';
import '../../../CommonWidgets/common_app_bar.dart';
import '../../../CommonWidgets/common_button.dart';
import '../../../CommonWidgets/common_text_field_view.dart';
import '../../../CommonWidgets/dropdown.dart';
import '../../../CommonWidgets/remove_focuse.dart';
import '../../../routes/app_pages.dart';
import '../controllers/fromonescreen_controller.dart';

class FromonescreenView extends GetView<FromonescreenController> {
  FromonescreenView({Key? key}) : super(key: key);

  @override
  FromonescreenController controller = Get.find<FromonescreenController>();

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
              titleText: "Form 1",
              isBackVisible: false,
              onBackClick: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: GetBuilder<FromonescreenController>(
                    id: "allField",
                    builder: (controller) {
                      return Column(
                        children: [
                          CommonTextFieldView(
                            controller: controller.nameTextEditingController,
                            errorText: controller.errorName,
                            titleText: "Name",
                            borderRadius: 8,
                            // padding: const EdgeInsets.only(left: 18, right: 18, bottom: 8),
                            hintText:
                            "Enter your name",
                            keyboardType: TextInputType.name,
                            onChanged: (String txt) {
                              if (controller.allValidation(checkingBtnVisibility: true)) {
                                controller.isBtnEnable.value = true;
                                controller.isBtnEnable.refresh();
                              } else {
                                controller.isBtnEnable.value = false;
                                controller.isBtnEnable.refresh();
                              }
                            },
                          ),
                          CommonTextFieldView(
                            controller: controller.mobileNumberTextEditingController,
                            errorText: controller.errorMobileNumber,
                            titleText: "Mobile Number",
                            borderRadius: 8,
                            maxLength: 10,
                            // padding: const EdgeInsets.only(left: 18, right: 18, bottom: 8),
                            hintText:
                            "Enter your mobile number",
                            keyboardType: TextInputType.number,
                            onChanged: (String txt) {
                              if (controller.allValidation(checkingBtnVisibility: true)) {
                                controller.isBtnEnable.value = true;
                                controller.isBtnEnable.refresh();
                              } else {
                                controller.isBtnEnable.value = false;
                                controller.isBtnEnable.refresh();
                              }
                            },
                          ),
                          CommonTextFieldView(
                            controller:controller.emailTextEditingController,
                            errorText: controller.errorEmail,
                            titleText: "Email",
                            borderRadius: 8,
                            // padding: const EdgeInsets.only(left: 18, right: 18, bottom: 8),
                            hintText:
                            "Enter your email",
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (String txt) {
                              if (controller.allValidation(checkingBtnVisibility: true)) {
                                controller.isBtnEnable.value = true;
                                controller.isBtnEnable.refresh();
                              } else {
                                controller.isBtnEnable.value = false;
                                controller.isBtnEnable.refresh();
                              }
                            },
                          ),
                          SizedBox(
                            width: Get.width*0.9,
                            child: DropDownField.formDropDown1WidthMap(
                              [
                                DropDownValue(key: "Chennai", value: "Chennai"),
                                DropDownValue(key: "Rajasthan", value: "Rajasthan"),
                                DropDownValue(key: "Bengaluru", value: "Bengaluru"),
                                DropDownValue(key: "MP", value: "MP"),
                              ],
                                  (value) {
                                controller.selectedCity = value;
                                if (controller.allValidation(checkingBtnVisibility: true)) {
                                  controller.isBtnEnable.value = true;
                                  controller.isBtnEnable.refresh();
                                } else {
                                  controller.isBtnEnable.value = false;
                                  controller.isBtnEnable.refresh();
                                }
                              },
                              "Current City",
                              .9,
                              // isEnable: controllerX.isEnable,
                              selected: controller.selectedCity,
                              dialogHeight: Get.height * .55,
                              autoFocus: true,
                            ),
                          )

                        ],
                      );
                    }),
              ),
            ),
            Obx(() {
              return CommonButton(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 8),
                buttonText: "Next",
                radius: 8,
                height: 40,
                backgroundColor: const Color(0xFF002351),
                isClickable: controller.isBtnEnable.value,

                onTap: () {
                  if (controller.allValidation()) {
                    controller.profileDetailsModel = ProfileDetailsModel(
                      name: controller.nameTextEditingController.text,
                      city: controller.selectedCity?.value,
                      mobileNumber: controller.mobileNumberTextEditingController.text,
                      email: controller.emailTextEditingController.text
                    ) ;
                    Get.toNamed(Routes.FROMTWOSCREEN,arguments: controller.profileDetailsModel?.toJson());
                  }

                  // NavigationServices(context).gotoTabScreen();
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
