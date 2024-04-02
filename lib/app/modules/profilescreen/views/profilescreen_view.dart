import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../CommonWidgets/common_app_bar.dart';
import '../../../CommonWidgets/remove_focuse.dart';
import '../controllers/profilescreen_controller.dart';

class ProfilescreenView extends GetView<ProfilescreenController> {
   ProfilescreenView({Key? key}) : super(key: key);

  @override
  ProfilescreenController controller = Get.find<ProfilescreenController>();

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
              titleText: "Profile",
              isBackVisible: false,
              onBackClick: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name"),
                    Text(controller.profileDetailsModel?.name??""),
                    SizedBox(
                      height: 9,
                    ),
                    Text("Mobile Number"),
                    Text(controller.profileDetailsModel?.mobileNumber??""),
                    SizedBox(
                      height: 9,
                    ),
                    Text("Email"),
                    Text(controller.profileDetailsModel?.email??""),

                    SizedBox(
                      height: 9,
                    ),
                    Text("City"),
                    Text(controller.profileDetailsModel?.city??""),
                    SizedBox(
                      height: 9,
                    ),
                    Text("About"),
                    Text(controller.profileDetailsModel?.about??""),
                    SizedBox(
                      height: 9,
                    ),
                    Text("Portfolio Link"),
                    Text(controller.profileDetailsModel?.portfolioLink??""),
                    SizedBox(
                      height: 9,
                    ),
                    Text("Languages"),
                    Text(controller.profileDetailsModel?.languages??""),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
