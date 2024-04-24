import 'package:flutter/material.dart';
import 'package:ui/src/localization/localization.dart';

class MessageDialog extends StatelessWidget {
  final String? title;
  final String content;
  final Function? onDone;
  final String? textButton;

  const MessageDialog(
      {Key? key,
      this.title,
      required this.content,
      this.onDone,
      this.textButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.0),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 50.0),
        padding: const EdgeInsets.only(
            top: 20.0, left: 20.0, right: 20.0, bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title ?? ModuleLocalization.of(context).dialog_message_title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 48.0,
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    onDone?.call();
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: Text(
                        (textButton ??
                                ModuleLocalization.of(context)
                                    .dialog_message_done_button)
                            .toUpperCase(),
                        style: Theme.of(context).textTheme.labelLarge),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
