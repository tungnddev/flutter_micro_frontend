import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

class UIFormBuilderCheckbox extends FormBuilderFieldDecoration<bool> {
  final Widget title;

  final bool shouldRequestFocus;

  /// Creates a single Checkbox field
  UIFormBuilderCheckbox({
    //From Super
    Key? key,
    required String name,
    FormFieldValidator<bool>? validator,
    bool? initialValue,
    InputDecoration decoration = const InputDecoration(
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      isDense: true,
      contentPadding: EdgeInsets.zero,
      errorStyle: TextStyle(fontSize: 13, height: 0.7, fontWeight: FontWeight.w400),
    ),
    ValueChanged<bool?>? onChanged,
    ValueTransformer<bool?>? valueTransformer,
    bool enabled = true,
    FormFieldSetter<bool?>? onSaved,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    VoidCallback? onReset,
    FocusNode? focusNode,
    required this.title,
    this.shouldRequestFocus = false,
  }) : super(
          key: key,
          initialValue: initialValue,
          name: name,
          validator: validator,
          valueTransformer: valueTransformer,
          onChanged: onChanged,
          autovalidateMode: autovalidateMode,
          onSaved: onSaved,
          enabled: enabled,
          onReset: onReset,
          decoration: decoration,
          focusNode: focusNode,
          builder: (FormFieldState<bool?> field) {
            final state = field as FormBuilderCheckboxState;
            return InputDecorator(
              decoration: state.decoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      value: state.value ?? false,
                      onChanged: state.enabled
                          ? (value) {
                              if (shouldRequestFocus) {
                                state.focus();
                              }
                              state.didChange(value);
                            }
                          : null,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        state.didChange(!(state.value ?? false));
                      },
                      child: title,
                    ),
                  )
                ],
              ),
            );
          },
        );

  @override
  FormBuilderCheckboxState createState() => FormBuilderCheckboxState();
}

class FormBuilderCheckboxState
    extends FormBuilderFieldDecorationState<UIFormBuilderCheckbox, bool> {}
