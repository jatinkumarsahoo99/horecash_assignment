import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:horecah/app/CommonWidgets/helper.dart';

import '../../../CommonModel/DropDownValue.dart';
import '../../../CommonModel/ProfileDetailsModel.dart';
import '../../../CommonWidgets/CheckBox/multi_check_box.dart';
import '../../../routes/app_pages.dart';

class FromtwoscreenController extends GetxController with Helper {
  //TODO: Implement FromtwoscreenController

  final count = 0.obs;

  var languages = RxList<MultiCheckBoxModel>();
  TextEditingController aboutTextEditingController = TextEditingController();
  TextEditingController portFolioTextEditingController =
      TextEditingController();

  String selectedLanguages = "";

  String errorAbout = '';
  String errorPortFolioLink = '';
  Rx<bool> isBtnEnable = Rx<bool>(false);
  Rx<bool> isAboutEnable = Rx<bool>(false);
  FocusNode aboutFocusNode = FocusNode();

  final gemini = Gemini.instance;

  showLoading() {
    Get.dialog(
      WillPopScope(
          onWillPop: () async => false,
          child: SpinKitFadingCircle(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? Colors.red : Colors.green,
                ),
              );
            },
          )),
      barrierDismissible: false,
    );
  }

  closeDialogIfOpen() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }

  getDataFromAI() {
    showLoading();
    gemini
        .text(
            "Write 100 words  using following data name:${profileDetailsModel?.name} email:${profileDetailsModel?.email} mobile:${profileDetailsModel?.mobileNumber} city:${profileDetailsModel?.city}")
        .then((value) {
      closeDialogIfOpen();
      aboutTextEditingController.text = value?.output??"";
      if (kDebugMode) {
        print(value?.output);
      }
    })

        /// or value?.content?.parts?.last.text
        .catchError((e) {
      closeDialogIfOpen();
    });
  }

  bool allValidation() {
    bool isValid = true;

    if (aboutTextEditingController.text.trim().isEmpty) {
      isValid = false;
    }

    if (portFolioTextEditingController.text.trim().isEmpty) {
      isValid = false;
    }
    if (selectedLanguages == "") {
      isValid = false;
    }

    // update(['allField']);
    return isValid;
  }

  ProfileDetailsModel? profileDetailsModel;

  callPopup() async {
    bool isOk = await showCommonPopupNew1(
      "Alert",
      "Are You Sure?.",
      Get.context!,
      barrierDismissible: true,
      isYesOrNoPopup: true,
    );
    if (isOk) {
      // calBackgroundServices();
      Get.back();
      if (profileDetailsModel != null) {
        profileDetailsModel?.about = aboutTextEditingController.text;
        profileDetailsModel?.portfolioLink =
            portFolioTextEditingController.text;
        profileDetailsModel?.languages = selectedLanguages;
        Get.toNamed(Routes.PROFILESCREEN,
            arguments: profileDetailsModel?.toJson());
      }
    }
  }

  @override
  void onInit() {
    languages.value = [
      MultiCheckBoxModel(DropDownValue(key: "Odia", value: "Odia"), false, 0),
      MultiCheckBoxModel(DropDownValue(key: "Hindi", value: "Hindi"), false, 1),
      MultiCheckBoxModel(
          DropDownValue(key: "Arabic", value: "Arabic"), false, 2),
      MultiCheckBoxModel(
          DropDownValue(key: "Chinese", value: "Chinese"), false, 3),
      MultiCheckBoxModel(
          DropDownValue(key: "English", value: "English"), false, 4),
    ];
    profileDetailsModel = ProfileDetailsModel.fromJson(Get.arguments);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
