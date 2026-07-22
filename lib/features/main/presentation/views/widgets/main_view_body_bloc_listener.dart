import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/core/func/custom_toast.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/main_view_widget.dart';

class MainViewBodyBlocListener extends StatelessWidget {
  const MainViewBodyBlocListener({super.key, required this._currentIndex});

  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          ToastNoContext.showColoredToast(message: 'تمت العملية بنجاح');
        }
        if (state is CartItemRemoved) {
          ToastNoContext.showColoredToast(message: 'تم حذف العنصر بنجاح');
        }
      },
      child: MainViewBody(currentIndex: _currentIndex),
    );
  }
}
