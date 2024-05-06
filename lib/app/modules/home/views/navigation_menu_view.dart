import 'package:flutter/material.dart';

import 'package:get/get.dart';

class NavigationMenuView extends GetView {
  final String name;
  final Icon icon;
  final void Function()? onTap;

  const NavigationMenuView({
    Key? key,
    required this.name,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
          onTap: onTap,
          child: Column(
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 80,
                color: Colors.white60,
                child: Center(
                  child: icon,
                ),
              ),
            ],
          )),
    );
  }
}
