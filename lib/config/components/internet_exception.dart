import 'package:bloc_clean_coding/config/colors/app_colors.dart';
import 'package:flutter/material.dart';

class InternetException extends StatelessWidget {
  final VoidCallback onPress;
  const InternetException({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).height;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: size * 0.15),
          const Icon(Icons.wifi_off, color: AppColors.redColor, size: 50),
          const SizedBox(height: 20),
          const Text(
            'We are unable to show result.\n please check your internet connection',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: size * 0.05),
          ElevatedButton(
            onPressed: onPress,
            child: Text('Retry', style: Theme.of(context).textTheme.bodySmall),
          ),
        ],
      ),
    );
  }
}
