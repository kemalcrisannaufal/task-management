import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:to_do_list/app/data/models/project_model.dart';
import 'package:to_do_list/app/data/providers/weather_provider.dart';
import 'package:to_do_list/app/modules/home/views/navigation_menu_view.dart';
import 'package:to_do_list/app/modules/home/views/project_item_view.dart';
import 'package:to_do_list/app/modules/home/views/reminder_card_view.dart';
import 'package:to_do_list/app/modules/home/views/subheading_home_view.dart';
import 'package:to_do_list/app/modules/note/controllers/note_controller.dart';
import 'package:to_do_list/app/modules/note/views/note_item_view.dart';
import 'package:to_do_list/app/modules/project/controllers/project_controller.dart';
import 'package:to_do_list/app/routes/app_pages.dart';
import 'package:to_do_list/app/shared/styles/condition_weather_style.dart';
import 'package:to_do_list/app/shared/styles/subheading.dart';
import 'package:to_do_list/app/shared/widget/appbar.dart';
import 'package:to_do_list/app/shared/widget/weather_icon.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final projectC = Get.put(ProjectController());
    final noteC = Get.put(NoteController());
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: ToDoAppBar(title: "Dashboard"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text("Weather", style: SubHeadingStyle()),
            SizedBox(height: 10),
            Container(
              height: 150,
              margin: EdgeInsets.only(bottom: 20),
              color: Colors.white,
              child: FutureBuilder<Map<String, dynamic>>(
                future: WeatherProvider().fetchWeather("Korpri Jatinangor"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error}"),
                    );
                  } else {
                    Map<String, dynamic> data = snapshot.data!;

                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          WeatherIconWidget(
                              iconUrl: data["current"]["condition"]["icon"]),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['location']['name'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      data['current']['condition']['text'],
                                      style: ConditionWeatherStyle(),
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      data['current']['temp_c'].toString() +
                                          "°C",
                                      style: ConditionWeatherStyle(),
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      "UV : " +
                                          data['current']['uv'].toString(),
                                      style: ConditionWeatherStyle(),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Last Updated: " +
                                      data['current']['last_updated'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: Colors.black45,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            Text("Reminder", style: SubHeadingStyle()),
            SizedBox(height: 10),
            Obx(() => (projectC.tasksDueToday.length != 0)
                ? Container(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: projectC.tasksDueToday.length,
                      itemBuilder: ((context, index) {
                        String key =
                            projectC.tasksDueToday.keys.elementAt(index);
                        Tasks task = projectC.tasksDueToday[key]!;
                        return ReminderCardView(
                          project: key.substring(0, key.length - 26),
                          task: task.name,
                          dueDate: task.dueDate,
                        );
                      }),
                    ),
                  )
                : Container(
                    height: 130,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.event_busy_outlined,
                          size: 40,
                          color: Color.fromRGBO(135, 138, 245, 1),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "No task due today",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        )
                      ],
                    ),
                  )),
            SizedBox(height: 20),
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
            Obx(() => Container(
                  height: (projectC.projects.isEmpty)
                      ? 100
                      : 100 * projectC.projects.length.toDouble(),
                  margin: EdgeInsets.only(bottom: 10),
                  child: projectC.projects.isEmpty
                      ? Container(
                          child: Center(child: Text("Project is empty")))
                      : ListView.builder(
                          itemCount: projectC.projects.length,
                          itemBuilder: ((context, index) {
                            return ProjectItemView(
                              id: projectC.projects[index].id,
                              name: projectC.projects[index].name,
                              icon: Icon(Icons.work_history_outlined),
                              onTap: () => Get.toNamed(Routes.PROJECT_DETAIL,
                                  arguments: projectC.projects[index].id),
                            );
                          }),
                        ),
                )),
            SubheadingHomeView(
                name: "Notes", routeDestination: Routes.ADD_NOTE),
            Obx(
              () => Container(
                height: (noteC.notes.isEmpty)
                    ? 100
                    : 100 * noteC.notes.length.toDouble(),
                margin: EdgeInsets.only(bottom: 10),
                child: (noteC.notes.isEmpty)
                    ? Center(
                        child: Text("Note is empty"),
                      )
                    : ListView.builder(
                        itemCount: noteC.notes.length,
                        itemBuilder: ((context, index) {
                          return NoteItemView(
                            id: noteC.notes[index].id,
                            name: noteC.notes[index].title,
                            icon: Icon(Icons.task_outlined),
                            onTap: () => Get.toNamed(Routes.NOTE,
                                arguments: noteC.notes[index].id),
                          );
                        }),
                      ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(WeatherProvider().fetchWeather("Jatinangor"));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
