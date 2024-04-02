import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../CommonModel/DropDownValue.dart';
import '../../../CommonModel/ProfileDetailsModel.dart';
import '../../../CommonWidgets/CheckBox/multi_check_box.dart';
import '../../../utils/validator.dart';

class FromonescreenController extends GetxController {
  //TODO: Implement FromonescreenController

  final count = 0.obs;

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController mobileNumberTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  // TextEditingController currentCityTextEditingController = TextEditingController();

  DropDownValue? selectedCity ;

  String errorName = '';
  String errorMobileNumber = '';
  String errorEmail = '';
  String errorCurrentCity = '';

  Rx<bool> isBtnEnable= Rx<bool>(false);

  ProfileDetailsModel ?profileDetailsModel;

  bool allValidation({bool checkingBtnVisibility = false}) {
    bool isValid = true;

    if(!checkingBtnVisibility) {
      if (nameTextEditingController.text
          .trim()
          .isEmpty) {
        errorName = "name can not be empty";
        isValid = false;
      } else {
        errorName = '';
      }

      if (mobileNumberTextEditingController.text
          .trim()
          .isEmpty) {
        errorMobileNumber = "mobile can not be empty";
        isValid = false;
      } else if (mobileNumberTextEditingController.text.length != 10) {
        errorMobileNumber = "please enter a valid mobile number";
        isValid = false;
      } else {
        errorMobileNumber = '';
      }

      if (emailTextEditingController.text
          .trim()
          .isEmpty) {
        errorEmail = "email can not be empty";
        isValid = false;
      }  else {
        errorEmail = '';
      }

      if (selectedCity == null) {
        errorCurrentCity = "please enter current city";
        isValid = false;
      } else {
        errorCurrentCity = "";
      }


      update(['allField']);
      return isValid;
    }
    else{
      if (nameTextEditingController.text
          .trim()
          .isEmpty) {
        isValid = false;
      } else {
        errorName = '';
      }

      if (mobileNumberTextEditingController.text
          .trim()
          .isEmpty) {
        isValid = false;
      } else if (mobileNumberTextEditingController.text.length != 10) {
        // errorMobileNumber = "please enter a valid mobile number";
        isValid = false;
      } else {
        errorMobileNumber = '';
      }

      if (emailTextEditingController.text
          .trim()
          .isEmpty) {
        // errorEmail = "email can not be empty";
        isValid = false;
      } else {
        errorEmail = '';
      }

      if (selectedCity == null) {
        // errorCurrentCity = "please enter current city";
        isValid = false;
      } else {
        errorCurrentCity = "";
      }
      // update(['allField']);
      return isValid;
    }
  }



  @override
  void onInit() {
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
