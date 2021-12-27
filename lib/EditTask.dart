import 'package:flutter/material.dart';

import 'MyThemeData.dart';

class EditTask extends StatefulWidget {
  static const String routeName ='EditTask';

  @override
  _EditTaskState createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text("To Do List",
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: isDarkMode
                    ? MyThemeData.primaryColorDark
                    : MyThemeData.primaryColor
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: MyThemeData.appBar_iconsColor,
            height: MediaQuery.of(context).size.height*0.12,
          ),
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(35),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: isDarkMode
                  ? MyThemeData.primaryColorDark
                  : MyThemeData.primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Edit task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode
                          ? MyThemeData.primaryColor
                          : MyThemeData.primaryColorDark
                  ),),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'tittle',
                    labelStyle: TextStyle(
                        fontSize: 20,
                        color: isDarkMode
                            ? MyThemeData.primaryColor
                            : MyThemeData.primaryColorDark
                    ),
                  ),
                ),
                TextField(
                  maxLines: 4,
                  minLines: 2,
                  decoration: InputDecoration(
                    labelText: 'description',
                    labelStyle: TextStyle(
                        fontSize: 20,
                        color: isDarkMode
                            ? MyThemeData.primaryColor
                            : MyThemeData.primaryColorDark
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text('Select time',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode
                            ? MyThemeData.primaryColor
                            : MyThemeData.primaryColorDark
                    ),),
                ),
                InkWell(
                  child: Text('1/1/2022',
                    textAlign: TextAlign.center,
                  ),
                  onTap: (){
                    showDateDialog();
                  },
                ),
                Spacer(),

                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('save changes'),
                  style: ElevatedButton.styleFrom(
                      primary: MyThemeData.appBar_iconsColor,
                      fixedSize: const Size(50, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      )
    );
  }

  void showDateDialog(){
    showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365))
    );
  }
}
