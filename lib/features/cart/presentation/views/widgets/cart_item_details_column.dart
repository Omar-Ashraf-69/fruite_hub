import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/features/cart/presentation/views/widgets/item_counter_button.dart';

class CartItemDetailsColumn extends StatelessWidget {
  const CartItemDetailsColumn({
    super.key,
    required this.name,
    required this.weight,
    required this.onAdd,
    required this.quantity,
    required this.onRemove,
  });

  final String name;
  final String weight;
  final VoidCallback? onAdd;
  final int quantity;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: TextStyles.bold16),
        const Spacer(),
        Text(
          weight,
          style: TextStyles.semiBold16.copyWith(
            color: AppColors.lightSecondaryColor,
          ),
        ),
        const Spacer(),
        Row(
          children: [
            ItemCounterbutton(icon: Icons.add, onTap: onAdd),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                quantity.toString(),
                style: TextStyles.bold19,
              ),
            ),
            ItemCounterbutton(icon: Icons.remove, onTap: onRemove),
          ],
        ),
      ],
    );
  }
}