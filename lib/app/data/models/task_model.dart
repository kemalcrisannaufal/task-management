class Task {
  String? id;
  String? name;
  String? dueDate;
  String? status;

  Task({this.id, this.name, this.dueDate, this.status});

  Task.fromJson(Map<String, dynamic> json) {
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
