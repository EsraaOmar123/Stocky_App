import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/widgets/app_colors.dart';

class CustomPhoneNumberField extends StatelessWidget {
  const CustomPhoneNumberField({
    super.key,
    required this.controller,
    required this.type,
    this.validate,
    this.onSubmit,
    //required this.onChanged,
    required this.label,
    this.prefix,
    this.onTap,
    this.radius = 12.0,
    this.width = double.infinity,
    this.autovalidateMode,
  });
  final TextEditingController controller;
  final TextInputType type;
  final FormFieldValidator<String>? validate;
  final ValueChanged<String>? onSubmit;
  //final Function onChanged;
  final String label;
  final IconData? prefix;
  final GestureTapCallback? onTap;
  final double radius;
  final double width;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      contextMenuBuilder: (context, editableTextState) {
        final List<ContextMenuButtonItem> buttonItems =
            editableTextState.contextMenuButtonItems;
        buttonItems.removeWhere((ContextMenuButtonItem buttonItem) {
          return buttonItem.type == ContextMenuButtonType.cut;
        });
        return AdaptiveTextSelectionToolbar.buttonItems(
          anchors: editableTextState.contextMenuAnchors,
          buttonItems: buttonItems,
        );
      },
      inputFormatters: [
        LengthLimitingTextInputFormatter(12),
        FilteringTextInputFormatter.digitsOnly,
      ],
      cursorColor: const Color(AppColors.kPrimaryColor),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      //textDirection: TextDirection.rtl,
      textAlign: TextAlign.start,
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: (s) {
        debugPrint(s);
      },
      onTap: onTap,
      //onChanged: onChanged,
      validator: validate,
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: const BorderSide(color: Color(AppColors.kPrimaryColor)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: const BorderSide(color: Color(AppColors.kPrimaryColor)),
        ),
        labelText: label,
        labelStyle:
            const TextStyle(fontSize: 14, color: Color(AppColors.kGreyColor)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
