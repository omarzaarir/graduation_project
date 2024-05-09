import 'package:flutter/material.dart';
import 'package:graduation_project/eventInCalenda.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';

extension DateTimeExt on DateTime {
  DateTime get monthStart => DateTime(year, month);
  DateTime get dayStart => DateTime(year, month, day);

  DateTime addMonth(int count) {
    return DateTime(year, month + count, day);
  }

  bool isSameDate(DateTime date) {
    return year == date.year && month == date.month && day == date.day;
  }

  bool get isToday {
    return isSameDate(DateTime.now());
  }
}

class MyCalendarInDays extends StatefulWidget {
  const MyCalendarInDays({super.key});
  @override
  State<MyCalendarInDays> createState() => _MyCalendarInDaysState();
}

class _MyCalendarInDaysState extends State<MyCalendarInDays> {
  late DateTime selectedMonth;
  DateTime? selectedDate;
  @override
  void initState() {
    selectedMonth = DateTime.now().monthStart;
    super.initState();
  }

  final _scrollController = ScrollController();
  final _list = List.generate(
      10,
      (index) => EventInCalendar(
            eventTitle: "Title",
            eventDate:
                "${DateTime.now().year} /${DateTime.now().month}/${DateTime.now().day}",
            eventTime: "${DateTime.now().hour}:${DateTime.now().minute}",
          ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 0),
        child: Container(
          color: const Color.fromARGB(255, 36, 161, 145),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                   Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_sharp),
              ),
              Row(
                children: [
                  Text(
                      "(" +
                          selectedMonth.month.toString() +
                          ") " +
                         MonthsName[ selectedMonth.month-1],
                      style: TextStyle(fontFamily: "Schyler")),
                  VerticalDivider(),
                  Text(selectedMonth.year.toString(),
                      style: TextStyle(fontFamily: "Schyler")),
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    child: IconButton(
                      onPressed: () {
                        //move date table to left
                        setState(() {
                          selectedMonth = selectedMonth.addMonth(-1);
                        });
                      },
                      icon: const Icon(Icons.arrow_back_sharp),
                    ),
                  ),
                  CircleAvatar(
                    child: IconButton(
                      onPressed: () {
                        //move date table to right
                        setState(() {
                          selectedMonth = selectedMonth.addMonth(1);
                        });
                      },
                      icon: const Icon(Icons.arrow_forward_sharp),
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                border: Border.all(color: Colors.black),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    // spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ]),
            child: Column(
              children: [
                _Body(
                  selectedMonth: selectedMonth,
                  selectedDate: selectedDate,
                  selectDate: (DateTime value) => setState(() {
                    selectedDate = value;
                  }),
                ),
                Container(
                  height: 2,
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(bottom: 2,top: 4,left: 25,right: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Color.fromARGB(255, 28, 112, 133),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _list.length,
              itemBuilder: (BuildContext context, int index) {
                return _list[index];

                // ListTile(
                //   title: Text(_list[index]),
                // );
              },
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body:  Center(
  //       child: Container(
  //         height: 450,
  //         width: 250,
  //         decoration: BoxDecoration(
  //           border: Border.all(color: Colors.black),
  //         ),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             _Header(
  //               selectedMonth: selectedMonth,
  //               selectedDate: selectedDate,
  //               onChange: (value) => setState(() => selectedMonth = value),
  //             ),
  //             Expanded(
  //               child: _Body(
  //                 selectedDate: selectedDate,
  //                 selectedMonth: selectedMonth,
  //                 selectDate: (DateTime value) => setState(() {
  //                   selectedDate = value;
  //                 }),
  //               ),
  //             ),
  //             _Bottom(
  //               selectedDate: selectedDate,
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.selectedMonth,
    required this.selectedDate,
    required this.selectDate,
  });

  final DateTime selectedMonth;
  final DateTime? selectedDate;

  final ValueChanged<DateTime> selectDate;

  @override
  Widget build(BuildContext context) {
    var data = CalendarMonthData(
      year: selectedMonth.year,
      month: selectedMonth.month,
    );

    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('M', style: TextStyle(fontFamily: "Schyler")),
            Text('T', style: TextStyle(fontFamily: "Schyler")),
            Text('W', style: TextStyle(fontFamily: "Schyler")),
            Text('T', style: TextStyle(fontFamily: "Schyler")),
            Text('F', style: TextStyle(fontFamily: "Schyler")),
            Text('S', style: TextStyle(fontFamily: "Schyler")),
            Text('S', style: TextStyle(fontFamily: "Schyler")),
          ],
        ),
        // const SizedBox(height: 1),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 1,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
            for (var week in data.weeks)
              Row(
                children: week.map((d) {
                  return Expanded(
                    child: _RowItem(
                      hasRightBorder: false,
                      date: d.date,
                      isActiveMonth: d.isActiveMonth,
                      onTap: () => selectDate(d.date),
                      isSelected: selectedDate != null &&
                          selectedDate!.isSameDate(d.date),
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ],
    );
  }
}

class _RowItem extends StatelessWidget {
  const _RowItem({
    required this.hasRightBorder,
    required this.isActiveMonth,
    required this.isSelected,
    required this.date,
    required this.onTap,
  });

  final bool hasRightBorder;
  final bool isActiveMonth;
  final VoidCallback onTap;
  final bool isSelected;

  final DateTime date;
  @override
  Widget build(BuildContext context) {
    final int number = date.day;
    final isToday = date.isToday;
    final bool isPassed = date.isBefore(DateTime.now());

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 12),
        height: 25,
        decoration: isSelected
            ? BoxDecoration(
                color: Color.fromARGB(255, 184, 139, 4),
                borderRadius: BorderRadius.circular(35))
            : isToday
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(
                      color: Colors.amber,
                    ),
                  )
                : null,
        child: Text(
          number.toString(),
          style: TextStyle(
              fontFamily: "Schyler",
              fontSize: 14,
              color: isPassed
                  ? isActiveMonth
                      ? Colors.grey
                      : Colors.transparent
                  : isActiveMonth
                      ? Colors.black
                      : Colors.grey[300]),
        ),
      ),
    );
  }
}

// class _Header extends StatelessWidget {
//   const _Header({
//     required this.selectedMonth,
//     required this.selectedDate,
//     required this.onChange,
//   });

//   final DateTime selectedMonth;
//   final DateTime? selectedDate;

//   final ValueChanged<DateTime> onChange;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Text(
//               'Selected date: ${selectedDate == null ? 'non' : "${selectedDate!.day}.${selectedDate!.month}.${selectedDate!.year}"}'),
//           Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   'Month: ${selectedMonth.month + 1}/${selectedMonth.year}',
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {
//                   onChange(selectedMonth.addMonth(-1));
//                 },
//                 icon: const Icon(Icons.arrow_left_sharp),
//               ),
//               IconButton(
//                 onPressed: () {
//                   onChange(selectedMonth.addMonth(1));
//                 },
//                 icon: const Icon(Icons.arrow_right_sharp),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _Bottom extends StatelessWidget {
//   const _Bottom({
//     required this.selectedDate,
//   });

//   final DateTime? selectedDate;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ElevatedButton(
//           onPressed: () {
//             print(selectedDate);
//           },
//           child: const Text('save'),
//         ),
//         ElevatedButton(
//           onPressed: () {},
//           child: const Text('cancel'),
//         ),
//       ],
//     );
//   }
// }

class CalendarMonthData {
  final int year;
  final int month;

  int get daysInMonth => DateUtils.getDaysInMonth(year, month);
  int get firstDayOfWeekIndex => 0;

  int get weeksCount => ((daysInMonth + firstDayOffset) / 7).ceil();

  const CalendarMonthData({
    required this.year,
    required this.month,
  });

  int get firstDayOffset {
    final int weekdayFromMonday = DateTime(year, month).weekday - 1;

    return (weekdayFromMonday - ((firstDayOfWeekIndex - 1) % 7)) % 7 - 1;
  }

  List<List<CalendarDayData>> get weeks {
    final res = <List<CalendarDayData>>[];
    var firstDayMonth = DateTime(year, month, 1);
    var firstDayOfWeek = firstDayMonth.subtract(Duration(days: firstDayOffset));

    for (var w = 0; w < weeksCount; w++) {
      final week = List<CalendarDayData>.generate(
        7,
        (index) {
          final date = firstDayOfWeek.add(Duration(days: index));

          final isActiveMonth = date.year == year && date.month == month;

          return CalendarDayData(
            date: date,
            isActiveMonth: isActiveMonth,
            isActiveDate: date.isToday,
          );
        },
      );
      res.add(week);
      firstDayOfWeek = firstDayOfWeek.add(const Duration(days: 7));
    }
    return res;
  }
}

class CalendarDayData {
  final DateTime date;
  final bool isActiveMonth;
  final bool isActiveDate;

  const CalendarDayData({
    required this.date,
    required this.isActiveMonth,
    required this.isActiveDate,
  });
}

var MonthsName = ['January', 'February','March', 'April','May', 'June','July', 'August','September', 'October','November', 'December'];
