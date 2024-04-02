import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../AppTheme/Theme.dart';
import '../AppTheme/text_styles.dart';

class CommonAppbarView extends StatelessWidget {
  final double? topPadding;
  final double? imageWidth;
  final Widget? backWidget;
  final String titleText;
  final String pageName;
  final VoidCallback? onBackClick;
  final IconData? iconData;
  final bool? isBackVisible;

  const CommonAppbarView({
    Key? key,
    this.topPadding,
    this.onBackClick,
    this.titleText = '',
    this.pageName = '',
    this.backWidget,
    this.iconData,
    this.imageWidth,
    this.isBackVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paddingTop = topPadding ?? MediaQuery.of(context).padding.top;
    return Container(
      color: const Color(0xFF002351),
      child: Padding(
        padding: EdgeInsets.only(top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: SizedBox(
                    width:imageWidth??110 ,
                    height: 30,
                    child:  Image.asset("assets/images/horecah1.png",fit: BoxFit.fill,)
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 0, left: 8, right: 8),
                  child: Text("Naukri in Hospitality",
                      style: TextStyles(context).getTitleStyle().copyWith(fontSize: 7,color: Colors.white)),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                (isBackVisible??false)? SizedBox(
                  height: AppBar().preferredSize.height,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0, left: 8, right: 0),
                    child: SizedBox(
                      width: AppBar().preferredSize.height - 8,
                      height: AppBar().preferredSize.height - 8,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(32.0),
                          ),
                          onTap: onBackClick,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 0,top: 0,bottom: 0),
                            child: backWidget ??
                                Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ):Container(),
                Padding(
                  padding:  EdgeInsets.only(top: 0, left:((isBackVisible??false)? 4:24), right: 24),
                  child: Text(titleText, style: TextStyles(context).getTitleStyle().copyWith(fontSize: 20,color: Colors.white)),
                ),
              ],
            ),
            SizedBox(
              height: (isBackVisible??false)?7:35,
            )
          ],
        ),
      ),
    );
  }
}
