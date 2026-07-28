import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/core/enums/payment_method.dart';
import 'package:fruit_hub/core/func/custom_toast.dart';
import 'package:fruit_hub/core/func/launch_urls.dart';
import 'package:fruit_hub/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:fruit_hub/generated/l10n.dart';

Future<void> completeCheckout(BuildContext context) async {
  final cubit = context.read<CheckoutCubit>();
  if (cubit.checkout.paymentMethod == PaymentMethod.paypal) {
    await LaunchUrls.launchURL("https://www.paypal.com/");
    await cubit.addOrder();
  }
  if (!context.mounted) return;
  cubit.deleteOrder();
  CartCubit().cart.clearCart();
  // ignore: use_build_context_synchronously
  ToastNoContext.showShortToast(message: S.of(context).checkout_completed);
  // ignore: use_build_context_synchronously
  Navigator.of(context).popUntil((route) => route.isFirst);
}
