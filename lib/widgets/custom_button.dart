import 'package:flutter/material.dart';
import 'package:fundr/constants.dart';
import 'package:fundr/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(vertical: 18)),
          backgroundColor: const MaterialStatePropertyAll(
            kPrimaryColor,
          ),
          shadowColor: MaterialStatePropertyAll(kTextColor.withOpacity(0.7)),
          elevation: const MaterialStatePropertyAll(15),
          shape: const MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        ),
        child: CustomText(
          text: text,
          isMedium: true,
          color: kWhiteColor,
        ),
      ),
    );
  }
}
