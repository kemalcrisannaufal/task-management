import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:to_do_list/app/shared/styles/subheading.dart';

class SubheadingHomeView extends GetView {
  final name;
  final routeDestination;
  final argument;
  SubheadingHomeView(
      {Key? key,
      required this.name,
      required this.routeDestination,
      this.argument})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        name,
        style: SubHeadingStyle(),
      ),
      IconButton(
        onPressed: () => Get.toNamed(routeDestination, arguments: argument),
        icon: Icon(Icons.add),
      ),
    ]);
  }
}
