import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/app/modules/home/controllers/home_controller.dart';
import 'package:to_do_list/app/routes/app_pages.dart';

class ItemTaskView extends GetView<HomeController> {
  ItemTaskView(this.data);
  final data;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.ADD_PROJECT, arguments: data.id),
      child: Container(
        decoration: BoxDecoration(
          color: data.status == "Complete" ? Colors.green : Colors.white,
        ),
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              child: Icon(Icons.task_outlined),
              radius: 30,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name!,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    data.dueDate!,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.check,
                size: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
