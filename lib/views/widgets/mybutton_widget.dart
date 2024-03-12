import 'package:flutter/material.dart';

class MyButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final IconData? icon;

  const MyButtonWidget({super.key, required this.onTap, required this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            padding: const EdgeInsets.all(20)),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                icon,
                size: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}