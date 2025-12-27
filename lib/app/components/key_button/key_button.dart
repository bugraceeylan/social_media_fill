import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:flutter/material.dart';

class KeyButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;

  const KeyButton({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF327037).withOpacity(0.9),
            const Color(0xff5FD669), 
          ],
          begin: Alignment.bottomRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onPressed,
        child: Container(
          width: DeviceConfig.screenWidth! * 0.9,
          height: DeviceConfig.screenHeight! * 0.09,
          alignment: Alignment.center,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
