import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ToDoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  ToDoAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO(135, 138, 245, 1),
      flexibleSpace: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Container(
          padding: EdgeInsets.only(top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          child: Icon(Icons.person),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.settings,
                              size: 25,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                      'Today, ${DateTime.now().day} ${DateFormat.MMMM().format(DateTime(2020, DateTime.now().month))} ${DateTime.now().year}',
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                  SizedBox(height: 2),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(180); // Sesuaikan dengan ukuran yang diperlukan
}
