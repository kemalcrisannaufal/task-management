import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/app/modules/home/views/navigation_menu_view.dart';
import 'package:to_do_list/app/modules/home/views/project_item_view.dart';
import 'package:to_do_list/app/modules/home/views/subheading_home_view.dart';
import 'package:to_do_list/app/modules/project/controllers/project_controller.dart';
import 'package:to_do_list/app/routes/app_pages.dart';
import 'package:to_do_list/app/shared/widget/appbar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final projectC = Get.put(ProjectController());
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: ToDoAppBar(title: "Dashboard"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavigationMenuView(
                  name: 'List',
                  icon: Icon(Icons.list_alt),
                ),
                SizedBox(width: 10),
                NavigationMenuView(
                  name: 'Calendar',
                  icon: Icon(Icons.calendar_month_outlined),
                  onTap: () => Get.toNamed(Routes.CALENDAR),
                ),
                SizedBox(width: 10),
                NavigationMenuView(
                  name: 'Project',
                  icon: Icon(Icons.work_history_outlined),
                ),
              ],
            ),
            SizedBox(height: 20),
            SubheadingHomeView(
                name: "Project", routeDestination: Routes.ADD_PROJECT),
            Container(
                height: 200,
                margin: EdgeInsets.only(bottom: 10),
                child: Obx(
                  () => projectC.projects.isEmpty
                      ? Container(
                          color: Colors.white,
                          child: Center(child: Text("Project is empty")))
                      : ListView.builder(
                          itemCount: projectC.projects.length,
                          itemBuilder: ((context, index) {
                            return ProjectItemView(
                                id: projectC.projects[index].id,
                                name: projectC.projects[index].name);
                          }),
                        ),
                )),
            SubheadingHomeView(name: "Task", routeDestination: Routes.ADD_TASK),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_TASK),
        child: Icon(Icons.add),
      ),
    );
  }
}
