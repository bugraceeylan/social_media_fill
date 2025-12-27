
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PasswordContainer extends StatefulWidget {
  final TextEditingController controller;
  final String label;

  const PasswordContainer({
    Key? key,
    required this.controller,
    required this.label,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PasswordContainerState createState() => _PasswordContainerState();
}

class _PasswordContainerState extends State<PasswordContainer> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceConfig.screenWidth! * 0.9,
      height: DeviceConfig.screenHeight! * 0.08,
      decoration:
          BoxDecoration(color: cWhite, borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _isObscure,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          labelText: widget.label,
          hintText: widget.label,
          hintStyle: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 14,
              fontWeight: FontWeight.w600),
          labelStyle: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 14,
              fontWeight: FontWeight.w600),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
          suffixIcon: IconButton(
            icon: SvgPicture.asset("assets/svg_assets/pass.svg"),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
          ),
        ),
      ),
    );
  }
}
