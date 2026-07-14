
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/extenstions.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/generated/l10n.dart';

void setupErrorState(BuildContext context, String error) {
  context.pop();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(Icons.error, color: Colors.red, size: 32),
      content: Text(error, style: TextStyles.bold16),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(S.of(context).got_it, style: TextStyles.bold16),
        ),
      ],
    ),
  );
}
