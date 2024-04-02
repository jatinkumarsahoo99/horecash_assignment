
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../AppTheme/Theme.dart';
import '../AppTheme/text_styles.dart';
import '../CommonModel/DropDownValue.dart';
import '../data/SizeDefine.dart';
import 'CheckBox/multi_check_box.dart';
import 'CustomSearchDropDown/dropdown_search.dart';
import 'CustomSearchDropDown/src/popupMenu.dart';


class DropDownField {

  Widget formDropDownCheckBoxMap(
      List<MultiCheckBoxModel>? items,
      Function(String) callback,
      String hint,
      double widthRatio, {
        Function(int index, bool selectValue)? onChanged,
        double? height,
        double? paddingBottom,
        MultiCheckBoxModel? selected,
        bool? isEnable,
        String? Function(DropDownValue? value)? validator,
        bool? searchReq,
        bool autoFocus = false,
        double dialogHeight = 280,
        void Function(bool)? onFocusChange,
        double? dialogWidth,
        FocusNode? inkWellFocusNode,
        GlobalKey? widgetKey,
        bool showtitle = true,
        bool titleInLeft = false,
      }) {
    isEnable ??= true;
    widgetKey ??= GlobalKey();
    final textColor = (isEnable) ? Colors.black : Colors.grey;
    final iconLineColor = (isEnable) ? Colors.deepPurpleAccent : Colors.grey;
    inkWellFocusNode ??= FocusNode();
    var selectedVal = "  Enter your $hint".obs;

    return Column(
      // key: titleInLeft ? null : widgetKey,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showtitle && !titleInLeft) ...{
          Padding(
            padding:
            const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
            child: Text(
              hint,
              style: TextStyle(
                fontSize: SizeDefine.labelSize1,
                color: AppTheme.secondaryTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          const SizedBox(height: 5),
        },
        StatefulBuilder(builder: (context, ree) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (titleInLeft) ...{
                Text(
                  hint,
                  style: TextStyle(
                      fontSize: SizeDefine.labelSize1,
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis),
                ),
                const SizedBox(width: 10),
              },
              InkWell(
                  autofocus: autoFocus,
                  focusNode: inkWellFocusNode,
                  canRequestFocus: (isEnable ?? true),
                  onFocusChange: onFocusChange,
                  onTap: (!isEnable!)
                      ? null
                      : () {
                    final RenderBox renderBox = widgetKey!.currentContext
                        ?.findRenderObject() as RenderBox;
                    final offset = renderBox.localToGlobal(Offset.zero);
                    final left = offset.dx;
                    final top = offset.dy + renderBox.size.height;
                    final right = left + renderBox.size.width;
                    final width = renderBox.size.width;
                    bool isAllSelected = false;
                    int val = 0;

                    for (var i = 0; i < (items?.length ?? 0); i++) {
                      if (items?[i].isSelected ?? false) {
                        val = 1;
                      } else {
                        val = 0;
                        break;
                      }
                    }

                    if (val == 1) {
                      isAllSelected = true;
                    }

                    if ((items == null || items.isEmpty)) {
                      showMenu(
                          context: context,
                          useRootNavigator: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          position: RelativeRect.fromLTRB(
                              left, top, right, 0.0),
                          constraints: BoxConstraints.expand(
                            width: dialogWidth ?? width,
                            height: 120,
                          ),
                          items: [
                            PopupMenuItem(
                                child: Text(
                                  "No Record Found",
                                  style: TextStyle(
                                      fontSize:
                                      SizeDefine.dropDownFontSize - 1,
                                      overflow: TextOverflow.ellipsis),
                                ))
                          ]);
                    } else {
                      var tempList = RxList<MultiCheckBoxModel>([]);
                      tempList.addAll(items);
                      showMenu(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        useRootNavigator: true,
                        position:
                        RelativeRect.fromLTRB(left, top, right, 0.0),
                        constraints: BoxConstraints.expand(
                          width: dialogWidth ?? width,
                          height: dialogHeight,
                        ),
                        items: [
                          CustomPopupMenuItem(
                            textStyle: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black,
                                fontSize: SizeDefine.fontSizeInputField),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              height: dialogHeight - 20,
                              child: Column(
                                children: [
                                  /// search
                                  Row(
                                    children: [
                                      StatefulBuilder(
                                          builder: (context, re) {
                                            return Checkbox(
                                              autofocus: true,
                                              value: isAllSelected,
                                              onChanged: (newVal) {
                                                isAllSelected =
                                                !isAllSelected;
                                                for (var i = 0;
                                                i < items.length;
                                                i++) {
                                                  items[i].isSelected =
                                                      isAllSelected;
                                                  selectedVal.value =
                                                  isAllSelected
                                                      ? "All Selected"
                                                      : "";
                                                  // getSelectedName(items);
                                                }
                                                tempList.refresh();
                                                re(() {});
                                              },
                                              materialTapTargetSize:
                                              MaterialTapTargetSize
                                                  .shrinkWrap,
                                            );
                                          }),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: TextFormField(
                                          decoration:
                                          const InputDecoration(
                                            contentPadding:
                                            EdgeInsets.all(12),
                                            isDense: true,
                                            isCollapsed: true,
                                            hintText: "Search",
                                          ),
                                          style: TextStyle(
                                            fontSize: SizeDefine
                                                .fontSizeInputField,
                                          ),
                                          onChanged: ((value) {
                                            if (value.isNotEmpty) {
                                              tempList.clear();
                                              for (var i = 0;
                                              i < items.length;
                                              i++) {
                                                if (items[i]
                                                    .val!
                                                    .value!
                                                    .toLowerCase()
                                                    .contains(value
                                                    .toLowerCase())) {
                                                  tempList.add(items[i]);
                                                }
                                              }
                                            } else {
                                              tempList.clear();
                                              tempList.addAll(items);
                                            }
                                          }),
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .deny("  "),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  /// list
                                  Obx(
                                        () => Expanded(
                                      child: MultiCheckBox(
                                        list: tempList.value,
                                        canScroll: true,
                                        isHorizontal: false,
                                        width: 12,
                                        onChanged: (index, val) async {
                                          // items[index].isSelected =
                                          //     val;
                                          tempList[index].isSelected =
                                              val;
                                          if (onChanged != null) {
                                            onChanged(
                                                tempList[index]
                                                    .realIndex!,
                                                val);
                                          }
                                          selectedVal.value =
                                              getSelectedName(tempList,callback);
                                          // print(selectedVal.value);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    shadowColor: Colors.grey.withOpacity(
                      Theme.of(context).brightness == Brightness.dark ? 0.6 : 0.6,
                    ),
                    child: Container(
                      key: widgetKey,
                      width: Get.width * widthRatio,
                      height: 45,
                      decoration: BoxDecoration(
                       /* border: Border.all(
                          color: iconLineColor,
                        ),*/
                        borderRadius: BorderRadius.circular(8),

                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 4),
                                  child: Obx(
                                        () => Text(
                                      // (selected?.val!.value ??
                                      //     (items!.isEmpty && showNoRecord
                                      //         ? "NO Record Found"
                                      //         : "")),
                                      selectedVal.value ?? "",
                                          style:  TextStyle(color: Theme.of(context).disabledColor,fontSize: 12),
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                              )),
                          Icon(
                            Icons.arrow_drop_down,
                            color: iconLineColor,
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          );
        }),
      ],
    );
  }

  static Widget formDropDown1WidthMap(
      List<DropDownValue>? items,
      Function(DropDownValue) callback,
      String hint,
      double widthRatio, {
        double? height,
        double? paddingBottom,
        DropDownValue? selected,
        bool? isEnable,
        String? Function(DropDownValue? value)? validator,
        bool? searchReq,
        bool autoFocus = false,
        double dialogHeight = 350,
        void Function(bool)? onFocusChange,
        double? dialogWidth,
        FocusNode? inkWellFocusNode,
        GlobalKey? widgetKey,
        bool showtitle = true,
        bool titleInLeft = false,
        bool labelBold = false,
      }) {
    isEnable ??= true;
    widgetKey ??= GlobalKey();
    final textColor = (isEnable) ? Colors.black : Colors.grey;
    final iconLineColor = (isEnable) ? Colors.deepPurpleAccent : Colors.grey;
    inkWellFocusNode ??= FocusNode();
    final _scrollController = ScrollController();

    return Column(
      // key: titleInLeft ? null : widgetKey,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showtitle && !titleInLeft) ...{
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
            child: Text(
              hint,
              style: TextStyle(
                fontSize: SizeDefine.labelSize1,
                color: AppTheme.secondaryTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 5),
        },
        StatefulBuilder(builder: (context, re) {
          bool showNoRecord = false;
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (titleInLeft) ...{
                Text(
                  hint,
                  style: TextStyle(
                    fontSize: SizeDefine.labelSize1,
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 10),
              },
              InkWell(
                // key: widgetKey,
                // key: titleInLeft ? widgetKey : null,
                  autofocus: autoFocus,
                  focusNode: inkWellFocusNode,
                  canRequestFocus: (isEnable ?? true),
                  onFocusChange: onFocusChange,
                  // borderRadius: BorderRadius.circular(5),
                  onTap: (!isEnable!)
                      ? null
                      : () {
                    var isLoading = RxBool(false);

                    final RenderBox renderBox = widgetKey!.currentContext
                        ?.findRenderObject() as RenderBox;
                    final offset = renderBox.localToGlobal(Offset.zero);
                    final left = offset.dx;
                    final top = offset.dy + renderBox.size.height;
                    final right = left + renderBox.size.width;
                    final width = renderBox.size.width;
                    if ((items == null || items.isEmpty)) {
                      showMenu(
                          context: context,
                          useRootNavigator: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          position: RelativeRect.fromLTRB(
                              left, top, right, 0.0),
                          constraints: BoxConstraints.expand(
                            width: dialogWidth ?? width,
                            height: 120,
                          ),
                          items: [
                            PopupMenuItem(
                                child: Text(
                                  "No Record Found",
                                  style: TextStyle(
                                    fontSize: SizeDefine.dropDownFontSize - 1,
                                  ),
                                ))
                          ]);
                    }
                    else {
                      var tempList = RxList<DropDownValue>([]);
                      tempList.addAll(items);
                      showMenu(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        useRootNavigator: true,
                        position:
                        RelativeRect.fromLTRB(left, top, right, 0.0),
                        constraints: BoxConstraints.expand(
                          width: dialogWidth ?? width,
                          height: dialogHeight,
                        ),
                        items: [
                          CustomPopupMenuItem(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: SizeDefine.fontSizeInputField),
                            child: Container(
                              color: Colors.white,
                              padding: const EdgeInsets.all(8),
                              height: dialogHeight - 20,
                              child: Column(
                                children: [
                                  /// search
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(12),
                                      isDense: true,
                                      isCollapsed: true,
                                      hintText: "Search",
                                    ),
                                    autofocus: true,
                                    style: TextStyle(
                                      fontSize:
                                      SizeDefine.fontSizeInputField,
                                    ),
                                    onChanged: ((value) {
                                      if (value.isNotEmpty) {
                                        tempList.clear();

                                        for (var i = 0;
                                        i < items.length;
                                        i++) {
                                          if (items[i]
                                              .value!
                                              .toLowerCase()
                                              .contains(
                                              value.toLowerCase())) {
                                            tempList.add(items[i]);
                                          }
                                        }
                                      } else {
                                        tempList.clear();
                                        tempList.addAll(items);
                                        tempList.refresh();
                                      }
                                    }),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.deny(
                                          "  "),
                                    ],
                                  ),

                                  /// progreesbar
                                  Obx(() {
                                    return Visibility(
                                      visible: isLoading.value,
                                      child:
                                      const LinearProgressIndicator(
                                        minHeight: 3,
                                      ),
                                    );
                                  }),

                                  const SizedBox(height: 5),

                                  /// list
                                  Expanded(
                                    child: Obx(
                                          () {
                                        return Material(
                                          color: Colors.white,
                                          child: Scrollbar(
                                            // isAlwaysShown: true,
                                            controller: _scrollController,
                                            child: ListView(
                                              controller:
                                              _scrollController,
                                              shrinkWrap: true,
                                              children: tempList
                                                  .map(
                                                    (element) => InkWell(
                                                  onTap: () {
                                                    Navigator.pop(
                                                        context);
                                                    selected =
                                                        element;
                                                    re(() {});
                                                    callback(element);
                                                    FocusScope.of(
                                                        context)
                                                        .requestFocus(
                                                        inkWellFocusNode);
                                                  },
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .symmetric(
                                                        vertical:
                                                        8),
                                                    child: Text(
                                                      element.value ??
                                                          "null",
                                                      style:
                                                      TextStyle(
                                                        fontSize:
                                                        SizeDefine
                                                            .dropDownFontSize -
                                                            1,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                                  .toList(),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    shadowColor: Colors.grey.withOpacity(
                      Theme.of(context).brightness == Brightness.dark ? 0.6 : 0.6,
                    ),
                    child: Container(
                      key: widgetKey,
                      width: Get.width * widthRatio,
                      height: 45,
                      decoration: BoxDecoration(
                        /*border: Border.all(
                          color: iconLineColor,
                        ),*/
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 4),
                                  child: Text(
                                    (selected?.value ??
                                        (items!.isEmpty && showNoRecord
                                            ? "NO Record Found"
                                            : "  Select your $hint")),
                                    style: TextStyle(
                                      fontSize: SizeDefine.fontSizeInputField,
                                      color: Theme.of(context).disabledColor,
                                    ),
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              )),
                          Icon(
                            Icons.arrow_drop_down,
                            color: iconLineColor,
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          );
        }),
      ],
    );
    // final iconColor =
    //     (isEnable ?? true) ? Colors.deepPurpleAccent : Colors.grey;
    // return Builder(builder: (context) {
    //   FocusNode focusNode = FocusNode();
    //   return Focus(
    //     focusNode: focusNode,
    //     autofocus: autoFocus,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         LabelText.style(hint: hint),
    //         SizedBox(
    //           height: SizeDefine.heightInputField,
    //           width: Get.width * widthRatio,
    //           child: DropdownSearch<DropDownValue>(
    //             // focusNode: focusNode,
    //             autoValidateMode: AutovalidateMode.onUserInteraction,
    //             enabled: isEnable ?? true,
    //             selectedItem: selected,
    //             dropdownBuilder: (context, selectedItem) {
    //               return Padding(
    //                 padding: const EdgeInsets.only(top: 2.5),
    //                 child: Text(
    //                   (selectedItem?.value ?? ""),
    //                   style: TextStyle(
    //                     fontSize: SizeDefine.fontSizeInputField,
    //                     color: Colors.black,
    //                     fontWeight: FontWeight.normal,
    //                   ),
    //                   textAlign: TextAlign.start,
    //                 ),
    //               );
    //             },
    //             validator: (value) {
    //               if (validator != null) {
    //                 return validator(selected);
    //               } else {
    //                 return null;
    //               }
    //             },
    //             popupItemBuilder: (context, item, s) {
    //               return Container(
    //                 // padding: EdgeInsets.only(left: 4),
    //                 // height: 15,
    //                 //   minVerticalPadding:5,
    //                 // dense:true,
    //                 padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
    //                 child: Text(
    //                   (item.value ?? ""),
    //                   style: TextStyle(
    //                     fontSize: SizeDefine.dropDownFontSize,
    //                     color: Colors.black,
    //                     fontWeight: FontWeight.normal,
    //                   ),
    //                 ),
    //               );
    //             },
    //             dropdownButtonProps: IconButtonProps(
    //               focusNode: AlwaysDisabledFocusNode(),
    //               visualDensity: VisualDensity.compact,
    //               padding: const EdgeInsets.all(3),
    //               alignment: Alignment.topCenter,
    //               icon: Icon(
    //                 Icons.arrow_drop_down_outlined,
    //                 color: iconColor,
    //               ),
    //               focusColor: iconColor,
    //               color: iconColor,
    //               disabledColor: iconColor,
    //             ),
    //             showSearchBox: searchReq ?? true,
    //             isFilteredOnline: false,
    //             mode: Mode.MENU,
    //             itemAsString: (item) => item?.value ?? "",
    //             searchFieldProps: TextFieldProps(
    //               autofocus: true,
    //               style: TextStyle(
    //                 fontSize: SizeDefine.dropDownFontSize,
    //                 color: Colors.black,
    //                 fontWeight: FontWeight.normal,
    //               ),
    //               inputFormatters: [
    //                 // LengthLimitingTextInputFormatter(45),
    //                 // UpperCaseTextFormatter(),
    //                 FilteringTextInputFormatter.deny("  "),
    //                 // FilteringTextInputFormatter.allow(RegExp(r"^(\w+ ?)*$")),
    //               ],
    //               decoration: InputDecoration(
    //                 errorBorder: InputBorder.none,
    //                 hintText: "Search",
    //                 contentPadding: const EdgeInsets.symmetric(
    //                     horizontal: 10, vertical: 12),
    //                 isDense: true,
    //                 enabledBorder: OutlineInputBorder(
    //                   borderSide:
    //                       const BorderSide(color: Colors.deepPurpleAccent),
    //                   borderRadius: BorderRadius.circular(0),
    //                 ),
    //                 focusedBorder: OutlineInputBorder(
    //                   borderSide:
    //                       const BorderSide(color: Colors.deepPurpleAccent),
    //                   borderRadius: BorderRadius.circular(0),
    //                 ),
    //                 disabledBorder: OutlineInputBorder(
    //                   borderSide: const BorderSide(color: Colors.grey),
    //                   borderRadius: BorderRadius.circular(0),
    //                 ),
    //               ),
    //             ),
    //             dropdownSearchDecoration: InputDecoration(
    //               contentPadding: const EdgeInsets.only(left: 10),
    //               border: InputBorder.none,
    //               enabledBorder: OutlineInputBorder(
    //                 borderSide:
    //                     const BorderSide(color: Colors.deepPurpleAccent),
    //                 borderRadius: BorderRadius.circular(0),
    //               ),
    //               errorBorder: InputBorder.none,
    //               focusedBorder: OutlineInputBorder(
    //                 borderSide:
    //                     const BorderSide(color: Colors.deepPurpleAccent),
    //                 borderRadius: BorderRadius.circular(0),
    //               ),
    //               disabledBorder: OutlineInputBorder(
    //                 borderSide: const BorderSide(color: Colors.grey),
    //                 borderRadius: BorderRadius.circular(0),
    //               ),
    //               floatingLabelBehavior: FloatingLabelBehavior.always,
    //             ),
    //             items: items,
    //             onChanged: (val) {
    //               callback(val!);
    //               FocusScope.of(Get.context!).requestFocus(focusNode);
    //             },
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // });
  }

  getSelectedName(List<MultiCheckBoxModel> items, Function(String p1) callback) {
    String? selectedItem;
    var tempLis = items
        .where((element) => (element.isSelected ?? false))
        .toList()
        .map((e) => (e.val?.value ?? ""))
        .toList();
    if (tempLis.isNotEmpty) {
      if (tempLis.length <= 20) {
        selectedItem = tempLis.join(', ');
      } else {
        int cout = tempLis.length;
        tempLis.removeRange(2, tempLis.length);
        selectedItem = selectedItem = "${tempLis.join(', ')} +${cout - 2}";
      }
    }
    callback(selectedItem??"");
    print(">>>>>>>selectedItem$selectedItem");
    return selectedItem ?? "";
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}