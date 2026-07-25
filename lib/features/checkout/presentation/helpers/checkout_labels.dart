import 'package:flutter/widgets.dart';
import 'package:fruit_hub/generated/l10n.dart';

class CheckoutLabels {
  static List<String> stepTitles(BuildContext context) => [
        S.of(context).shipping,
        S.of(context).address,
        S.of(context).payment,
      ];

  static List<String> buttonTitles(BuildContext context) => [
        S.of(context).next,
        S.of(context).next,
        S.of(context).pay_with_paypal,
      ];
}