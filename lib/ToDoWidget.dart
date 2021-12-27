import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_list/EditTask.dart';
import 'package:todo_list/MyThemeData.dart';

class TodoWidget extends StatefulWidget {

  @override
  _TodoWidgetState createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Slidable(
      actionPane: SlidableScrollActionPane(),
      actions: [
        IconSlideAction(
          color: Colors.transparent,
          iconWidget: Container(
            margin: EdgeInsets.only(left: 12,top: 12,bottom: 12),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 Icon(Icons.delete,
                 color: MyThemeData.primaryColor,
                 ),
                Text('delete',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: MyThemeData.primaryColor,
                ),
                ),
              ],
            ),
          ),
          onTap: (){

          },
        ),
      ],
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, EditTask.routeName);
        },
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isDarkMode
                ? MyThemeData.primaryColorDark
                : MyThemeData.primaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  height: 70,
                  width: 4,
                  decoration: BoxDecoration(
                    color: MyThemeData.appBar_iconsColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Tittle',
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: MyThemeData.appBar_iconsColor
                      ),
                    ),
                    Text('Description',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? MyThemeData.primaryColor
                              : MyThemeData.primaryColorDark,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  width: 50,
                  decoration: BoxDecoration(
                    color: MyThemeData.appBar_iconsColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.check,
                    size: 40,
                    color: MyThemeData.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
