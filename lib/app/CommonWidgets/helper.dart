
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'common_button.dart';
import 'custom_dialog.dart';


mixin Helper {

  Future<bool> showCommonPopupNew(
      String title, String descriptionText, BuildContext context,
      {bool isYesOrNoPopup = false, bool barrierDismissible = true}) async {
    bool isOkClick = false;
    return await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) => CustomDialog(
        title: title,
        description: descriptionText,
        isVerical: true,
        onCloseClick: () {
          Navigator.of(context).pop();
        },
        actionButtonList: isYesOrNoPopup
            ? <Widget>[
                CustomDialogActionButton(
                  buttonText: "Confirm",
                  color: Colors.green,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                CustomDialogActionButton(
                  buttonText: "Go Back",
                  color: Colors.red,
                  onPressed: () {
                    isOkClick = true;
                    Navigator.of(context).pop();
                  },
                )
              ]
            : <Widget>[
                CustomDialogActionButton(
                  buttonText: "OK",
                  color: Colors.green,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
      ),
    ).then((_) {
      return isOkClick;
    });
  }

  Future<bool> showCommonPopupNew1(
      String title, String descriptionText, BuildContext context,
      {bool isYesOrNoPopup = false, bool barrierDismissible = true}) async {
    bool isOkClick = false;
    return await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) => CustomDialog(
        title: title,
        description: descriptionText,
        isVerical: true,
        onCloseClick: () {
          Navigator.of(context).pop();
        },
        actionButtonList: isYesOrNoPopup
            ? <Widget>[
          CommonButton(
            padding: const EdgeInsets.only(left: 18, right: 18, bottom: 8),
            buttonText: "Confirm",
            radius: 8,
            height: 40,
            backgroundColor: const Color(0xFF002351),

            onTap: () {
              isOkClick = true;
              Navigator.of(context).pop();
            },
          ),
          CommonButton(
            padding: const EdgeInsets.only(left: 18, right: 18, bottom: 8),
            buttonText: "Go Back",
            radius: 8,
            height: 40,
            backgroundColor: Colors.white,
            textColor: Colors.black,

            onTap: () {
              Navigator.of(context).pop();
              // NavigationServices(context).gotoTabScreen();
            },
          ),
         /* CustomDialogActionButton(
            buttonText: "Confirm",
            color: Colors.green,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CustomDialogActionButton(
            buttonText: "Go Back",
            color: Colors.red,
            onPressed: () {
              isOkClick = true;
              Navigator.of(context).pop();
            },
          )*/
        ]
            : <Widget>[
          CustomDialogActionButton(
            buttonText: "OK",
            color: Colors.green,
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    ).then((_) {
      return isOkClick;
    });
  }

}
