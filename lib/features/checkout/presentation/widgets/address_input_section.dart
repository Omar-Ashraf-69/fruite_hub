import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/func/text_field_validator.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/widgets/custom_form_field.dart';
import 'package:fruit_hub/features/checkout/data/address_controllers.dart';
import 'package:fruit_hub/features/checkout/domain/entities/address_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:fruit_hub/generated/l10n.dart';

class AddressInputSection extends StatefulWidget {
  const AddressInputSection({super.key});

  @override
  State<AddressInputSection> createState() => AddressInputSectionState();
}

class AddressInputSectionState extends State<AddressInputSection> {
  final addressFormKey = GlobalKey<FormState>();

  final controllers = AddressControllers();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    controllers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: addressFormKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            CustomFormField(
              hintText: S.of(context).full_name,
              controller: controllers.fullName,
              keyboardType: TextInputType.text,
              validator: (value) =>
                  validator(value, S.of(context).full_name, context),
            ),
            verticalSpace(12),
            CustomFormField(
              hintText: S.of(context).email,
              controller: controllers.email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) =>
                  validator(value, S.of(context).email, context),
            ),
            verticalSpace(12),
            CustomFormField(
              hintText: S.of(context).address,
              controller: controllers.address,
              keyboardType: TextInputType.streetAddress,
              validator: (value) =>
                  validator(value, S.of(context).address, context),
            ),
            verticalSpace(12),
            CustomFormField(
              hintText: S.of(context).city,
              controller: controllers.city,
              keyboardType: TextInputType.text,
              validator: (value) =>
                  validator(value, S.of(context).city, context),
            ),
            verticalSpace(12),
            CustomFormField(
              hintText: S.of(context).floor,
              controller: controllers.floor,
              keyboardType: TextInputType.numberWithOptions(),
              onFieldSubmitted: (value) => FocusScope.of(context).unfocus(),
              validator: (value) =>
                  validator(value, S.of(context).floor, context),
            ),
            verticalSpace(12),
            CustomFormField(
              hintText: S.of(context).phone,
              keyboardType: TextInputType.phone,
              controller: controllers.phone,
              validator: (value) =>
                  validator(value, S.of(context).phone, context),
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (value) => FocusScope.of(context).unfocus(),
            ),
            verticalSpace(12),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    if (!addressFormKey.currentState!.validate()) {
      setState(() {
        autovalidateMode = AutovalidateMode.onUserInteraction;
      });

      return false;
    }

    context.read<CheckoutCubit>().saveAddress(
      AddressEntity(
        fullName: controllers.fullName.text,
        email: controllers.email.text,
        address: controllers.address.text,
        city: controllers.city.text,
        floor: controllers.floor.text,
        phone: controllers.phone.text,
      ),
    );

    return true;
  }
}
