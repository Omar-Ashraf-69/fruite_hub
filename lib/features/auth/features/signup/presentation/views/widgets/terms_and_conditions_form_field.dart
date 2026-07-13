import 'package:flutter/material.dart';
import 'package:fruit_hub/features/auth/features/signup/presentation/views/widgets/terms_and_conditions.dart';
import 'package:fruit_hub/generated/l10n.dart';

class TermsAndConditionsFormField extends StatelessWidget {
  const TermsAndConditionsFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      initialValue: false,
      validator: (value) {
        if (value != true) {
          return S.of(context).please_accept_terms_and_conditions;
        }
        return null;
      },
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TermsAndConditionsTextWidget(
              isAccepted: field.value ?? false,
              onChanged: field.didChange,
            ),
    
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  field.errorText!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        );
      },
    );
  }
}
