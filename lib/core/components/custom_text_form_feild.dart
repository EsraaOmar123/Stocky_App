import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.formFieldKey,
    required this.isPassword,
    this.type,
    this.controller,
    this.validate,
    this.onTap,
    this.suffixIcon,
    this.suffixPressed,
    this.border,
    this.edgeInsetsGeometry,
    this.hint,
    this.onChanged,
    this.onSubmitted,
    this.prefixIcon,
    this.labelStyle,
    this.hintStyle,
    this.enabledBorder,
    this.focusedBorder,
    this.maxLine,
    this.minLine,
    this.isEnable,
    this.scrollController,
    this.autofocus,
    this.focusNode,
    this.floatingLabelBehavior,
    this.hintTextDirection,
    this.hintMaxLines,
    this.onSaved,
    this.label,
  });

  ScrollController? scrollController;
  bool isPassword;
  bool? autofocus;
  TextInputType? type;
  TextEditingController? controller;
  String? Function(String?)? onSubmitted;
  String? Function(String?)? onSaved;
  String? Function(String?)? onChanged;
  String? Function(String?)? validate;
  String? hint;
  IconData? prefixIcon;
  IconData? suffixIcon;
  VoidCallback? onTap;
  VoidCallback? suffixPressed;
  InputBorder? border;
  InputBorder? focusedBorder;
  InputBorder? enabledBorder;
  EdgeInsetsGeometry? edgeInsetsGeometry;
  String? label;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  bool? isEnable;
  int? maxLine;
  int? minLine;
  FocusNode? focusNode;
  FloatingLabelBehavior? floatingLabelBehavior;
  TextDirection? hintTextDirection;
  int? hintMaxLines;
  Key? formFieldKey;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: formFieldKey,
      scrollController: scrollController,
      obscureText: isPassword,
      keyboardType: type,
      controller: controller,
      onFieldSubmitted: onSubmitted,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validate,
      maxLines: maxLine,
      minLines: minLine,
      onTap: onTap,
      enabled: isEnable,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintTextDirection: hintTextDirection,
        hintMaxLines: hintMaxLines,
        helperStyle: const TextStyle(
          decorationStyle: TextDecorationStyle.dotted,
        ),
        contentPadding: edgeInsetsGeometry,
        prefixIcon: Icon(
          prefixIcon,
          size: 20,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        border: border,
        focusedBorder: focusedBorder,
        enabledBorder: enabledBorder,
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.grey,
              fontSize: 15,
            ),
        hintText: hint,
        labelText: label ?? '',
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffixIcon,
                  color: Theme.of(context).colorScheme.onSurface,
                ))
            : null,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        floatingLabelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.brown,
            ),
      ),
      cursorColor: Colors.brown,
    );
  }
}
