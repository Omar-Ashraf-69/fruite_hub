import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/features/checkout/domain/entities/payment_method.dart';
import 'package:fruit_hub/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:fruit_hub/features/checkout/presentation/widgets/payment_section_options.dart';
import 'package:fruit_hub/generated/l10n.dart';

class ShippingSection extends StatelessWidget {
  const ShippingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CheckoutCubit>();
    return Column(
      children: [
        PaymentSelectionOption(
          title: S.of(context).cach_on_delivery,
          subtitle: S.of(context).pay_when_you_receive,
          price: S.of(context).free,
          isSelected:
              cubit.checkout.paymentMethod == PaymentMethod.cashOnDelivery,
          onTap: () {
            cubit.selectPaymentMethod(method: PaymentMethod.cashOnDelivery);
            // cubit.checkout.paymentMethod = PaymentMethod.cashOnDelivery;
          },
        ),
        verticalSpace(12),
        PaymentSelectionOption(
          title: S.of(context).credit_debit_card,
          subtitle: S.of(context).pay_with_your_card,
          price:
              "${S.of(context).currency} ${context.read<CheckoutCubit>().cart.totalPrice()}",
          isSelected: cubit.checkout.paymentMethod == PaymentMethod.paypal,
          onTap: () {
            cubit.selectPaymentMethod(method: PaymentMethod.paypal);
          },
        ),
      ],
    );
  }
}