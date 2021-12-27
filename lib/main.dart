import 'package:flutter/material.dart';
import 'package:todo_list/AddToDoButtonSheet.dart';
import 'package:todo_list/EditTask.dart';
import 'package:todo_list/MyThemeData.dart';
import 'ListTab.dart';
import 'SettingsTab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      home: MyHomePage(),
        routes: {
          MyHomePage.routeName : (BuildContext)=> MyHomePage(),
          EditTask.routeName : (BuildContext)=> EditTask(),


        },
        initialRoute: MyHomePage.routeName
    );
  }

}

class MyHomePage extends StatefulWidget {
  static const String routeName = 'HomeScreen' ;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0 ;
  List <Widget> tabs = [
    ListTab() ,
    SettingsTab()
  ];

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyThemeData.appBar_iconsColor,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (buildContext){
                return AddToDoButtonSheet();
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        shape: StadiumBorder(
          side: BorderSide(
            color: isDarkMode
                ? MyThemeData.primaryColorDark
                : MyThemeData.primaryColor ,
            width: 5
          )
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 7.0,
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          currentIndex : currentIndex ,
          onTap: (index){
            currentIndex = index ;
            setState(() {
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: isDarkMode
              ? MyThemeData.primaryColorDark
              : MyThemeData.primaryColor,
          selectedItemColor: MyThemeData.appBar_iconsColor,
          unselectedItemColor: isDarkMode
              ? MyThemeData.primaryColor
              : Colors.grey,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                ),
              label: 'List',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
              label: 'Settings',
            ),
          ],
        ),
      ),
      body: tabs[currentIndex] ,
    );
  }
}
