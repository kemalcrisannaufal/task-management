class Project {
  String? id;
  String? name;
  String? description;
  List<Tasks>? tasks;

  Project({this.id, this.name, this.description, this.tasks});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    if (json['tasks'] != null) {
      tasks = <Tasks>[];
      json['tasks'].forEach((v) {
        tasks?.add(Tasks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    if (tasks != null) {
      data['tasks'] = tasks?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tasks {
  String? id;
  String? name;
  String? dueDate;
  String? status;

  Tasks({this.id, this.name, this.dueDate, this.status});

  Tasks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dueDate = json['due_date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['due_date'] = dueDate;
    data['status'] = status;
    return data;
  }
}
