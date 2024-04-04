import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../AppTheme/Theme.dart';
import '../AppTheme/text_styles.dart';



class CommonTextFieldView extends StatelessWidget {
  final String? titleText;
  final int? maxLength;
  final String hintText;
  final String? errorText;
  final bool isObscureText, isAllowTopTitleView;
  final bool? enable;
  final EdgeInsetsGeometry padding;
  final Function(String)? onChanged;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final double? pad;
  final double? height;
  final double? borderRadius;
  final BuildContext? contextNew;

   CommonTextFieldView({
    Key? key,
    this.hintText = '',
    this.isObscureText = false,
    this.padding = const EdgeInsets.only(
        left: 18, right: 18, bottom: 5),
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.isAllowTopTitleView = true,
    this.errorText,
    this.titleText = '',
    this.controller,
    this.maxLength,
     this.pad = 16,
     this.contextNew,
     this.height,
     this.borderRadius,
     this.enable = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isAllowTopTitleView && titleText != '')
            Padding(
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
              child: Text(
                titleText ?? "",
                style: TextStyles(context).getDescriptionStyle().copyWith(fontSize: 13),
              ),
            ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius??24),
            ),
            shadowColor: Colors.grey.withOpacity(
              Theme.of(context).brightness == Brightness.dark ? 0.6 : 0.6,
            ),
            child: Padding(
              padding:  EdgeInsets.only(left: pad!, right:  pad!),
              child: SizedBox(
                height: height??48,
                child: Center(
                  child: TextField(
                    controller: controller,
                    maxLines: 1,
                    enabled: enable,

                    onChanged: onChanged,
                    maxLength: maxLength??50,
                    style: TextStyles(context).getRegularStyle().copyWith(color: ((enable == false)?( Theme.of(context).disabledColor):AppTheme.primaryTextColor)),
                    obscureText: isObscureText,
                    cursorColor: Theme.of(context).primaryColor,
                    onEditingComplete: () {
                      if(context != null){
                        FocusScope.of(context)?.nextFocus();
                      }else if(Get.context != null){
                        FocusScope.of(Get.context!).nextFocus();
                      }

                    },
                    decoration: InputDecoration(
                      errorText: null,
                      counterText: "",
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle:
                          TextStyle(color: Theme.of(context).disabledColor,fontSize: 12),
                    ),
                    keyboardType: keyboardType,
                  ),
                ),
              ),
            ),
          ),
          if (errorText != null && errorText != '')
            Padding(
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
              child: Text(
                errorText ?? "",
                style: TextStyles(context).getDescriptionStyle().copyWith(
                      color: AppTheme.redErrorColor,
                    ),
              ),
            )
        ],
      ),
    );
  }
}

class CommonTextFieldView1 extends StatelessWidget {
  final String? titleText;
  final int? maxLength;
  final String hintText;
  final String? errorText;
  final bool isObscureText, isAllowTopTitleView;
  final bool? enable;
  final EdgeInsetsGeometry padding;
  final Function(String)? onChanged;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final double? pad;
  final double? height;
  final double? borderRadius;
  final BuildContext? contextNew;
  final FocusNode? focusNode;

   CommonTextFieldView1({
    Key? key,
    this.hintText = '',
    this.isObscureText = false,
    this.padding = const EdgeInsets.only(
        left: 18, right: 18, bottom: 5),
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.isAllowTopTitleView = true,
    this.errorText,
    this.titleText = '',
    this.controller,
    this.maxLength,
     this.pad = 16,
     this.contextNew,
     this.height,
     this.borderRadius,
     this.focusNode,
     this.enable = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isAllowTopTitleView && titleText != '')
            Padding(
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
              child: Text(
                titleText ?? "",
                style: TextStyles(context).getDescriptionStyle().copyWith(fontSize: 13),
              ),
            ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius??24),
            ),
            shadowColor: Colors.grey.withOpacity(
              Theme.of(context).brightness == Brightness.dark ? 0.6 : 0.6,
            ),
            color: (enable == false)?Colors.grey:null,
            child: Padding(
              padding:  EdgeInsets.only(left: pad!, right:  pad!),
              child: SizedBox(
                height: height??48,
                child: Center(
                  child: TextField(
                    controller: controller,
                    focusNode: focusNode??FocusNode(),
                    // maxLines: 1,
                    maxLines: null,
                    enabled: enable,
                    expands: true,


                    onChanged: onChanged,
                    maxLength: null,
                    style: TextStyles(context).getRegularStyle().copyWith(color: ((enable == false)?( Theme.of(context).disabledColor):AppTheme.primaryTextColor)),
                    obscureText: isObscureText,
                    cursorColor: Theme.of(context).primaryColor,
                    onEditingComplete: () {
                      if(context != null){
                        FocusScope.of(context)?.nextFocus();
                      }else if(Get.context != null){
                        FocusScope.of(Get.context!).nextFocus();
                      }

                    },
                    decoration: InputDecoration(
                      errorText: null,
                      counterText: "",
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle:
                          TextStyle(color: Theme.of(context).disabledColor,fontSize: 12),
                    ),
                    keyboardType: keyboardType,
                  ),
                ),
              ),
            ),
          ),
          if (errorText != null && errorText != '')
            Padding(
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
              child: Text(
                errorText ?? "",
                style: TextStyles(context).getDescriptionStyle().copyWith(
                      color: AppTheme.redErrorColor,
                    ),
              ),
            )
        ],
      ),
    );
  }
}
