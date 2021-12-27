import 'package:flutter/material.dart';

import 'MyThemeData.dart';

class AddToDoButtonSheet extends StatefulWidget {

  @override
  _AddToDoButtonSheetState createState() => _AddToDoButtonSheetState();
}

class _AddToDoButtonSheetState extends State<AddToDoButtonSheet> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(12),
      color: isDarkMode
          ? MyThemeData.primaryColorDark
          : MyThemeData.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Add new task',
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
              labelText: 'enter your task tittle',
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
              labelText: 'enter your task description',
              labelStyle: TextStyle(
                  fontSize: 20,
                  color: isDarkMode
                      ? MyThemeData.primaryColor
                      : MyThemeData.primaryColorDark
              ),
            ),
          ),
          Spacer(),
          Text('Select time',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isDarkMode
                    ? MyThemeData.primaryColor
                    : MyThemeData.primaryColorDark
            ),),
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
              child: Text('Add'),
            style: ElevatedButton.styleFrom(
                primary: MyThemeData.appBar_iconsColor,
              fixedSize: const Size(50, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
            ),
          ),
          Spacer(),

        ],
      ),
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
