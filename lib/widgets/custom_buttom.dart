import 'package:flutter/material.dart';
import 'package:product_verification_flutter/widgets/bounce_animation.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPress;
  const CustomButton({Key? key, required this.label, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BounceAnimation(
      child: ElevatedButton(
        style: ButtonStyle(
          shadowColor: MaterialStateProperty.all(
            Colors.grey.shade400,
          ),
          elevation: MaterialStateProperty.all(10.0),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
            ),
          ),
        ),
        onPressed: onPress,
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onPress: () {},
    );
  }
}
