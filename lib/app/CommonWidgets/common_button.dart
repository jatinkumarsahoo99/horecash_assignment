
import 'package:flutter/material.dart';
import 'package:horecah/app/CommonWidgets/tap_effect.dart';

import '../AppTheme/text_styles.dart';




class CommonButton extends StatelessWidget {
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final String? buttonText;
  final Widget? buttonTextWidget;
  final Color? textColor, backgroundColor,iconColor;
  final bool? isClickable;
  final double radius;
  final double? height;
  final bool isIcon;
  final IconData? icon;
  const CommonButton({
    Key? key,
    this.onTap,
    this.buttonText,
    this.buttonTextWidget,
    this.textColor = Colors.white,
    this.backgroundColor,
    this.iconColor,
    this.padding,
    this.isClickable = true,
    this.radius = 24,
    this.height = 48,
    this.icon = Icons.arrow_forward,
    this.isIcon = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(),
      child: TapEffect(
        isClickable: isClickable!,
        onClick: onTap ?? () {},
        child: SizedBox(
          height: height??48,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            color:((isClickable??false)? backgroundColor ?? Theme.of(context).primaryColor:Colors.grey),
            shadowColor: Colors.black12.withOpacity(
              Theme.of(context).brightness == Brightness.dark ? 0.6 : 0.2,
            ),
            child: (isIcon)?Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon,color: iconColor??Colors.white,size: 15,),
                SizedBox(
                  width: 8,
                ),
                buttonTextWidget ??
                    Text(
                      buttonText ?? "",
                      style: TextStyles(context).getRegularStyle().copyWith(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),
                    ),

              ],
            ): Center(
              child: buttonTextWidget ??
                  Text(
                    buttonText ?? "",
                    style: TextStyles(context).getRegularStyle().copyWith(
                          color: textColor,
                          fontSize: 16,
                      fontWeight: FontWeight.bold
                        ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
