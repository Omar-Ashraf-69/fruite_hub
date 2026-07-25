  import 'package:flutter/material.dart';
import 'package:fruit_hub/generated/l10n.dart';

void showSankBar(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);

    messenger.removeCurrentSnackBar();

    messenger.showSnackBar(
      SnackBar(
        duration: Duration(microseconds: 1500000),
        content: Text(S.of(context).please_select_a_payment_method),
      ),
    );
  }