
import 'package:flutter/widgets.dart';
import 'package:fruit_hub/features/checkout/presentation/widgets/address_input_section.dart';
import 'package:fruit_hub/features/checkout/presentation/widgets/payment_section.dart';
import 'package:fruit_hub/features/checkout/presentation/widgets/shipping_section.dart';

class CheckoutPageView extends StatelessWidget {
  const CheckoutPageView({
    super.key,
    required this.pageController,
    required this.onPageChanged,
    required this.addressKey,
  });
  final PageController pageController;

  final GlobalKey addressKey;
  final ValueChanged<int> onPageChanged;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      onPageChanged: (value) => onPageChanged(value),
      itemCount: getPages().length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return getPages()[index];
      },
    );
  }

  List<Widget> getPages() {
    return [
      ShippingSection(),
      AddressInputSection(key: addressKey),
      PaymentSection(),
    ];
  }
}