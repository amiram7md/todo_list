import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list/ToDoWidget.dart';

import 'MyThemeData.dart';

class ListTab extends StatefulWidget{
  @override
  _ListTabState createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: isDarkMode
                ? MyThemeData.scaffoldBackgroundColorDark
                : MyThemeData.scaffoldBackgroundColor,
            child: Stack(
              children: [
                Container(
                  color: MyThemeData.appBar_iconsColor,
                  height: MediaQuery.of(context).size.height*0.08,
                ),
                TableCalendar(
                  selectedDayPredicate: (day) {
                    return isSameDay(selectedDay, day);
                  },
                  onDaySelected: (_selectedDay, _focusedDay) {
                    setState(() {
                      selectedDay = _selectedDay;
                      focusedDay = _focusedDay;
                    });
                  },
                  focusedDay: focusedDay,
                  firstDay: DateTime.now().subtract(Duration(days: 365)),
                  lastDay: DateTime.now().add(Duration(days: 365)),
                  calendarFormat: CalendarFormat.week,
                  weekendDays: [],
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(
                      color: isDarkMode
                          ? MyThemeData.primaryColor
                          : MyThemeData.primaryColorDark,
                    ),
                  ),
                  calendarStyle: CalendarStyle(
                    selectedTextStyle: TextStyle(
                      color: isDarkMode
                          ? MyThemeData.primaryColorDark
                          : MyThemeData.primaryColor,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: MyThemeData.appBar_iconsColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    todayTextStyle: TextStyle(
                        color: MyThemeData.appBar_iconsColor
                    ),
                    todayDecoration: BoxDecoration(
                      color: isDarkMode
                          ? MyThemeData.primaryColorDark
                          : MyThemeData.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    defaultTextStyle: TextStyle(
                      color: isDarkMode
                          ? MyThemeData.primaryColor
                          : MyThemeData.primaryColorDark,
                    ),
                    defaultDecoration: BoxDecoration(
                      color: isDarkMode
                          ? MyThemeData.primaryColorDark
                          : MyThemeData.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (buildContext , index){
              return TodoWidget();
            },
              itemCount: 10,
            ),
          ),
        ]
    );
  }
}