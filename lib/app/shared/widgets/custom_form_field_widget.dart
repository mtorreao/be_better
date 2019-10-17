import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormFieldWidget extends StatelessWidget {
  final Stream stream;
  final void Function(String) onChanged;
  final FocusNode focusNode;
  final String Function(String) onValidator;
  final String labelText;
  final int maxLength;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType keyboardType;
  final int maxLines;
  final int minLines;
  final bool enabled;

  const CustomFormFieldWidget(
      {Key key,
      @required this.stream,
      @required this.onChanged,
      this.focusNode,
      this.onValidator,
      @required this.labelText,
      this.maxLength,
      this.inputFormatters,
      this.keyboardType,
      this.maxLines,
      this.minLines,
      this.enabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: stream,
        builder: (context, snapshot) {
          final controller = TextEditingController();
          if (snapshot.hasData) {
            controller.text = snapshot.data;
            controller.selection =
                TextSelection.collapsed(offset: snapshot.data.length);
          }
          return TextFormField(
            decoration: InputDecoration(labelText: labelText),
            onChanged: onChanged,
            focusNode: focusNode,
            validator: onValidator,
            maxLength: maxLength,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            controller: controller,
            maxLines: maxLines,
            minLines: minLines,
            enabled: enabled,
          );
        });
  }
}
