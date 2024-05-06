import 'package:get/get.dart';

import '../modules/addNote/bindings/add_note_binding.dart';
import '../modules/addNote/views/add_note_view.dart';
import '../modules/addProject/bindings/add_project_binding.dart';
import '../modules/addProject/views/add_project_view.dart';
import '../modules/addTask/bindings/add_task_binding.dart';
import '../modules/addTask/views/add_task_view.dart';
import '../modules/calendar/bindings/calendar_binding.dart';
import '../modules/calendar/views/calendar_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/note/bindings/note_binding.dart';
import '../modules/note/views/note_view.dart';
import '../modules/project/bindings/project_binding.dart';
import '../modules/project/views/project_view.dart';
import '../modules/projectDetail/bindings/project_detail_binding.dart';
import '../modules/projectDetail/views/project_detail_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TASK,
      page: () => const AddTaskView(),
      binding: AddTaskBinding(),
    ),
    GetPage(
      name: _Paths.CALENDAR,
      page: () => const CalendarView(),
      binding: CalendarBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PROJECT,
      page: () => const AddProjectView(),
      binding: AddProjectBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT,
      page: () => const ProjectView(),
      binding: ProjectBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT_DETAIL,
      page: () => const ProjectDetailView(),
      binding: ProjectDetailBinding(),
    ),
    GetPage(
      name: _Paths.NOTE,
      page: () => const NoteView(),
      binding: NoteBinding(),
    ),
    GetPage(
      name: _Paths.ADD_NOTE,
      page: () => const AddNoteView(),
      binding: AddNoteBinding(),
    ),
  ];
}
