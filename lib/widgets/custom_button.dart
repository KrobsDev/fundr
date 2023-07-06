import 'package:flutter/material.dart';
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
    return ElevatedButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
      ),
      child: CustomText(
        text: text,
        isBold: true,
      ),
    );
  }
}
