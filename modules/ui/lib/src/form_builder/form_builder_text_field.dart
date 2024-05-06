import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:ui/src/localization/localization.dart';

import 'form_builder_decoration.dart';

class UIFormBuilderTextField {
  static normal(
          {required BuildContext context,
          required String name,
          required String labelText,
          Key? key,
          TextInputType? keyboardType,
          initialValue = ""}) =>
      FormBuilderTextField(
        key: key,
        name: name,
        decoration: UIInputDecoration(
          labelText: labelText,
        ),
        initialValue: initialValue,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
        keyboardType: keyboardType,
      );

  static normalRequired(
          {required BuildContext context,
          required String name,
          required String labelText,
          Key? key,
          initialValue = "",
          int? maxLength,
          bool obscureText = false}) =>
      FormBuilderTextField(
        key: key,
        name: name,
        decoration: UIInputDecoration(labelText: labelText.toRequired()),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(
              errorText: ModuleLocalization.of(context).required_info),
        ]),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        initialValue: initialValue,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
        maxLength: maxLength,
        obscureText: obscureText,
      );

  // static phone(
  //         {required BuildContext context,
  //         required String name,
  //         required String labelText,
  //         initialValue = "",
  //         bool isRequired = true}) =>
  //     FormBuilderTextField(
  //       name: name,
  //       decoration: UIInputDecoration(
  //           labelText: isRequired ? labelText.toRequired() : labelText),
  //       keyboardType: TextInputType.phone,
  //       validator: FormBuilderValidators.compose([
  //         FormBuilderValidators.minLength(8,
  //             allowEmpty: !isRequired,
  //             errorText: ModuleLocalization.of(context).error_phone_length_min),
  //       ]),
  //       maxLength: 11,
  //       autovalidateMode: AutovalidateMode.onUserInteraction,
  //       inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'\d'))],
  //       initialValue: initialValue,
  //       style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
  //     );

  static note(
          {required BuildContext context,
          required String name,
          int maxLine = 5,
          required String labelText,
          initialValue = "",
          int maxLength = 1000,
          Key? key,
          bool isRequired = false}) =>
      FormBuilderTextField(
        name: name,
        maxLines: maxLine,
        decoration: UIInputDecoration(
            labelText: isRequired ? labelText.toRequired() : labelText),
        validator: FormBuilderValidators.compose([
          if (isRequired)
            FormBuilderValidators.required(
                errorText: ModuleLocalization.of(context).required_info),
        ]),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        initialValue: initialValue,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
        maxLength: maxLength,
        key: key,
      );

  static email(
          {required BuildContext context,
          required String name,
          required String labelText,
          Key? key,
          initialValue = "",
          isRequired = true}) =>
      FormBuilderTextField(
        key: key,
        name: name,
        decoration: UIInputDecoration(
            labelText: isRequired ? labelText.toRequired() : labelText),
        keyboardType: TextInputType.emailAddress,
        validator: FormBuilderValidators.compose([
          (value) {
            if (value?.isNotEmpty != true) return null;
            final bool emailValid = RegExp(
                    r"^[a-zA-Z\d.a-zA-Z\d.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\d]+\.[a-zA-Z]+")
                .hasMatch(value!);
            if (!emailValid) {
              return ModuleLocalization.of(context).invalid_input;
            }
            return null;
          },
          if (isRequired)
            FormBuilderValidators.required(
                errorText: ModuleLocalization.of(context).required_info),
        ]),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        initialValue: initialValue,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
      );

  static disable(
          {required BuildContext context,
          required String name,
          required String labelText,
          initialValue = "",
          ValueTransformer<dynamic>? valueTransformer,
          int maxLine = 1,
          Key? key}) =>
      FormBuilderTextField(
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: const Color(0xFF939393)),
        name: name,
        decoration: UIInputDecoration(
          labelText: labelText,
          filled: true,
          enabled: false,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF939393), width: 0.5)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF939393), width: 0.5)),
        ),
        initialValue: initialValue,
        valueTransformer: valueTransformer,
        maxLines: maxLine,
        // enabled: false,
        readOnly: true,
        key: key,
      );

  static number({
    required BuildContext context,
    required String name,
    required String labelText,
    Key? key,
    bool isRequired = true,
    int? initialValue,
  }) =>
      FormBuilderTextField(
        key: key,
        name: name,
        decoration: UIInputDecoration(
            labelText: isRequired ? labelText.toRequired() : labelText),
        keyboardType: TextInputType.phone,
        validator: FormBuilderValidators.compose([
          (value) {
            if (value == null || value.isEmpty) return null;
            int? num = int.tryParse(value);
            if (num == null) {
              return ModuleLocalization.of(context).invalid_input;
            }
            return null;
          },
          if (isRequired)
            FormBuilderValidators.required(
                errorText: ModuleLocalization.of(context).required_info),
        ]),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'\d')),
        ],
        initialValue: initialValue?.toString(),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
        valueTransformer: (value) {
          return int.tryParse(value ?? "");
        },
      );

  static numberWithDecimal({
    required BuildContext context,
    required String name,
    required String labelText,
    Key? key,
    bool isRequired = true,
    double? initialValue,
  }) =>
      FormBuilderTextField(
        key: key,
        name: name,
        decoration: UIInputDecoration(
            labelText: isRequired ? labelText.toRequired() : labelText),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        validator: FormBuilderValidators.compose([
          (value) {
            if (value == null || value.isEmpty) return null;
            double? num = double.tryParse(value.replaceAll(',', '.'));
            if (num == null) {
              return ModuleLocalization.of(context).invalid_input;
            }
            return null;
          },
          if (isRequired)
            FormBuilderValidators.required(
                errorText: ModuleLocalization.of(context).required_info),
        ]),
        initialValue: initialValue?.toString(),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
        valueTransformer: (value) {
          return double.tryParse(value?.replaceAll(',', '.') ?? "");
        },
      );

  static price(
          {required BuildContext context,
          required String name,
          required String labelText,
          Key? key,
          int initialValue = 0,
          bool isRequired = true,
          int maxLength = 15}) =>
      FormBuilderTextField(
        key: key,
        name: name,
        decoration: UIInputDecoration(
            labelText: isRequired ? labelText.toRequired() : labelText),
        keyboardType: TextInputType.phone,
        validator: FormBuilderValidators.compose(isRequired
            ? [
                FormBuilderValidators.required(
                    errorText: ModuleLocalization.of(context).required_info),
                (value) {
                  int? num = int.tryParse(value?.replaceAll(".", "") ?? "");
                  if (num == null || num <= 0) {
                    return ModuleLocalization.of(context).required_info;
                  }
                  return null;
                }
              ]
            : []),
        maxLength: maxLength,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'\d')),
          CustomInput(maxDigits: 12),
        ],
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
        initialValue: NumberFormat("#,##0", "en_US").format(initialValue),
        valueTransformer: (value) {
          return int.tryParse(value?.replaceAll(".", "") ?? "");
        },
      );
}

extension _Required on String {
  String toRequired() => "$this*";
}

class CustomInput extends TextInputFormatter {
  CustomInput({this.maxDigits = 10});

  final int maxDigits;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    if (newValue.selection.baseOffset > maxDigits) {
      return oldValue;
    }

    double value = double.parse(newValue.text);
    final formatter = NumberFormat("#,##0", "en_US");
    String newText = formatter.format(value);
    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
