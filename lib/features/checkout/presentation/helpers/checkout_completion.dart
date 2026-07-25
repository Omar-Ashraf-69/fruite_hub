import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/func/custom_toast.dart';
import 'package:fruit_hub/core/func/launch_urls.dart';
import 'package:fruit_hub/features/checkout/domain/entities/payment_method.dart';
import 'package:fruit_hub/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:fruit_hub/generated/l10n.dart';

Future<void> completeCheckout(BuildContext context) async {
  final cubit = context.read<CheckoutCubit>();
  
  if (cubit.checkout.paymentMethod == PaymentMethod.paypal) {
    await LaunchUrls.launchURL("https://www.paypal.com/");
  }

  ToastNoContext.showShortToast(message: S.of(context).checkout_completed);

  Navigator.pop(context);
}
