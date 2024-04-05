import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TimetablePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _TimetablePageState createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: Scaffold(
            body: Container(
                color: Theme.of(context).colorScheme.surface,
                child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SfCalendar(
                      view: CalendarView.month,
                      dataSource: getCalendarDataSource(),
                      cellBorderColor: Theme.of(context).colorScheme.surface,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      todayHighlightColor:
                          Theme.of(context).colorScheme.primary,
                      showWeekNumber: true,
                      headerStyle: CalendarHeaderStyle(
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.normal,
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.w500),
                      ),
                      headerDateFormat: 'MMMM',
                      monthViewSettings: MonthViewSettings(
                          showAgenda: true,
                          dayFormat: 'EEE',
                          agendaViewHeight: 350,
                          agendaStyle: AgendaStyle(
                            backgroundColor:
                                Theme.of(context).colorScheme.surface,
                            appointmentTextStyle: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface),
                            dateTextStyle: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            dayTextStyle: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.black),
                          )
                          ),
                    )
                  )
                )
              )
            );
  }

  _DataSource getCalendarDataSource() {
    final List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 4, days: -1)),
      endTime: DateTime.now().add(const Duration(hours: 5, days: -1)),
      subject: 'Release Meeting',
      color: Theme.of(context).colorScheme.background,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 2, days: -2)),
      endTime: DateTime.now().add(const Duration(hours: 4, days: -2)),
      subject: 'Performance check',
      color: Theme.of(context).colorScheme.background,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 6, days: -3)),
      endTime: DateTime.now().add(const Duration(hours: 7, days: -3)),
      subject: 'MXEN3000 Mechatronic Automation Project',
      color: Theme.of(context).colorScheme.background,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 6, days: 2)),
      endTime: DateTime.now().add(const Duration(hours: 7, days: 2)),
      subject: 'Retrospective',
      color: Theme.of(context).colorScheme.background,
    ));

    return _DataSource(appointments);
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
