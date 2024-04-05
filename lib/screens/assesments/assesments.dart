import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month
           && day == other.day;
  }
}

class Assesment {
  final String title;
  final String description;
  final String time;
  final String location;
  final String duration;

  const Assesment({
    required this.title,
    required this.description,
    required this.time,
    required this.location,
    required this.duration,
  });
}

List<Assesment> assesmentList1 = [
    Assesment( title: "MXEN3000 Mechatronics Design Project", description: "Assignment 1", time: "9:00", location: "110.120", duration: "1 hour"),
    Assesment(title: "MXEN3001 Manufacturing for Mechatronics", description: "Class Test 1", time: "9:00", location: "200A.101", duration: "1 hour"),
  ];

List<Assesment> assesmentList2 = [
    Assesment(title: "ELEN3004 Renewable Energy Principles", description: "Lab Report", time: "9:00", location: "120.303", duration: "1 hour"),
    Assesment(title: "ICTE3001 Industrial Design and Automation", description: "Exam", time: "9:00", location: "115.101", duration : "1 hour"),
  ];

class AssesmentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return 
    Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        toolbarHeight: 50,
        centerTitle: false,
        titleSpacing: 15.0,
        title: Text("Assesments"),
        titleTextStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: 30,
          fontWeight: FontWeight.w800,
          fontFamily: 'Inter-Regular',
          
        )
      ),
      body:
      ListView(
        
        children:[
        AssesmentDateCollection(date: DateTime.now(), assesments: assesmentList1,),
        AssesmentDateCollection(date: DateTime.now().add(const Duration(hours: 6, days: 1)), assesments: assesmentList2,),
        ],
      ),
      );
  }
}

class AssesmentDateCollection extends StatelessWidget {
  final DateTime date;
  final List<Assesment> assesments;
  
  const AssesmentDateCollection({
    super.key,
    required this.date,
    required this.assesments,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child:
          Padding(padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
          child:
        Text(
          style:TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 19,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter-Regular',
          ),

          "${date.isSameDate(DateTime.now()) ? 'Today,' : ''} ${DateFormat('dd MMMM yyyy').format(date)}",
        ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: assesments.length,
          itemBuilder: (context, index) {
            return AssesmentCard(assesment: assesments[index]);
          },
        ),
      ],
    );
    
  }
}

class AssesmentCard extends StatelessWidget {
  final Assesment assesment;
  const AssesmentCard({
    super.key,
    required this.assesment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    child:
    Card( 
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10,10,10,0),
                child:
                Row(children: [
                  Icon(CupertinoIcons.map_pin_ellipse, color: Theme.of(context).colorScheme.primary,),
                  SizedBox(width: 10),
                  Text(assesment.location, style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter-Regular',
                ),),  
                ],)
              ),
              Expanded(child: 
              Align(
                alignment: Alignment.topRight,
                child:
              TextButton(
                child: Text('...', style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter-Regular',
                ),),
                onPressed: () {/* ... */},
              ),
              ),
                                    )
            ],
          ),
          ListTile(
            title: Text(assesment.description, style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 14,
              fontWeight: FontWeight.normal,
              fontFamily: 'Inter-Regular',
            ),),
            subtitle: Text(assesment.title, style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Inter-Regular',
            ),
            ),
          ),
          
        ],
      ),
    ),
    );
  }
}
