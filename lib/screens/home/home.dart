import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bloc/page_controller_provider.dart';
import '../assesments/assesments.dart';
import '../map/map.dart';
import '../settings/settings.dart';
import '../timetable/timetable.dart';
import 'package:flutter/cupertino.dart'; // Import Cupertino icons


class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class SmallCard extends StatelessWidget {
  const SmallCard({
    super.key,
    required this.title, 
    required this.icon,
    required this.color,
    required this.index,
  });

  final String title;
  final Icon icon;
  final Color color;
  final int index;


  @override
  Widget build(BuildContext context) {
    final pageControllerProvider = Provider.of<PageControllerProvider>(context);

    final textStyle = Theme.of(context).textTheme.displaySmall!.copyWith(
      color: Colors.black,
      fontSize: 25,
    );

    return 
    GestureDetector(
      onTap: () {
        pageControllerProvider.navigateToPage(index); // Navigate to the corresponding page
      },
      child:
      Card(
      color: color,
      margin: EdgeInsets.all(8),
      child: 
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: Icon(
              icon.icon,
              size: 70
              ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Text(title, style: textStyle),
          ),
        ],
      ),
      )
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.title, 
    required this.icon,
    required this.color,
    required this.index,
  });

  final String title;
  final Icon icon;
  final Color color;
  final int index;


  @override
  Widget build(BuildContext context) {
    final pageControllerProvider = Provider.of<PageControllerProvider>(context);

    final theme = Theme.of(context);

    final textStyle = theme.textTheme.displayMedium!.copyWith(
      color: Colors.black,
      
    );

    return 
        GestureDetector(
      onTap: () {
        pageControllerProvider.navigateToPage(index); // Navigate to the corresponding page
      },
      child:
    Card(
      color: color,
      margin: EdgeInsets.all(8),
      child: 
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Icon(
              icon.icon,
              size: 70
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(title, style: textStyle),
          ),
        ],
      ),
    )
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  bool _enableSwiping = true; // Add this variable

final List<Widget> _pages = [
    HomePage(),
    MapPage(),
    TimetablePage(),
    AssesmentsPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
      PageControllerProvider pageControllerProvider = Provider.of<PageControllerProvider>(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        return 
        Scaffold(
          
          body: 
          Stack(
            children: [
                PageView.builder(
                controller: pageControllerProvider.pageController,
                physics: _enableSwiping
                    ? AlwaysScrollableScrollPhysics()
                    : NeverScrollableScrollPhysics(), // Control swiping here

                onPageChanged: (int page) {
                  setState(() {
                    _selectedIndex = page;
                    _enableSwiping = _selectedIndex != 1;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (BuildContext context, int index) {
                  return _pages[index % _pages.length];
                },
              ),
              ],
          ),
          
          bottomNavigationBar: 
          Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Theme.of(context).colorScheme.onBackground, width: 1.0))),
        child:
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                activeIcon: Icon(CupertinoIcons.home),
                label: 'Home',
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
                tooltip: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.map),
                activeIcon: Icon(CupertinoIcons.map_fill),
                label: 'Map',
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
                tooltip: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.calendar),
                activeIcon: Icon(CupertinoIcons.calendar),
                label: 'Timetable',
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
                tooltip: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assessment_outlined),
                activeIcon: Icon(Icons.assessment),
                label: 'Assessments',
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
                tooltip: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings),
                activeIcon: Icon(CupertinoIcons.settings_solid),
                label: 'Settings',
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
              ),
            ],
            currentIndex: _selectedIndex,
            unselectedItemColor: Theme.of(context).colorScheme.onPrimary,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            onTap: (page) {
                setState(() {
                  _selectedIndex = page;
                });
                pageControllerProvider.pageController.jumpToPage(page);
              },
            showSelectedLabels: true,
            showUnselectedLabels: true,
            iconSize: 30,

          ),
        ),
        );
      }
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
            elevation: 0,
            toolbarHeight: 10,
            backgroundColor: Theme.of(context).colorScheme.background,
          ),
          body:
    
    Center(
      
      child: 
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: BigCard(title: "Timetable", icon: Icon(CupertinoIcons.calendar), color: Theme.of(context).colorScheme.primary, index: 2),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: SmallCard(title: "Assesments", icon: Icon(CupertinoIcons.book), color: Theme.of(context).colorScheme.surface, index: 3),
              ),
              Expanded(
                child: SmallCard(title: "Progress", icon: Icon(CupertinoIcons.chart_bar), color: Theme.of(context).colorScheme.surface, index: 4),
              ),              
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child:
                  BigCard(title: "Map", icon: Icon(CupertinoIcons.map), color: Theme.of(context).colorScheme.surface, index: 1),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child:
                  BigCard(title: "", icon: Icon(null), color: Theme.of(context).colorScheme.surface, index: 0),
              )
            ],
          ),
        ],
      ),
    ),
    ),
    );
  }
}
