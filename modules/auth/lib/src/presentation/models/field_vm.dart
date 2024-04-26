import 'package:equatable/equatable.dart';

class FieldVM with EquatableMixin {
  String? Function(String content)? validator;
  String _content = "";

  set content(String newValue) {
    _content = newValue;
    initial = false;
  }

  String get content => _content;
  bool initial = true;

  String? get errorText {
    if (initial) return null;
    return validate();
  }

  String? validate() {
    if (validator != null) {
      return validator!.call(_content);
    }
    if (_content.isEmpty) return 'Invalid field';
    return null;
  }

  FieldVM(this._content);

  @override
  List<Object?> get props => [_content];
}
