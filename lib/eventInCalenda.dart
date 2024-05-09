import 'package:flutter/material.dart';

class EventInCalendar extends StatefulWidget {
  const EventInCalendar({super.key, required this.eventDate, required this.eventTime, required this.eventTitle});
  final String eventDate,eventTime,eventTitle;

  @override
  State<EventInCalendar> createState() => _EventInCalendarState();
}

class _EventInCalendarState extends State<EventInCalendar> {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      margin: EdgeInsets.symmetric(horizontal:3),
                  height: 50,
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      vertical: BorderSide(color: Colors.black),
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 0.5,
                        color: Colors.black,
                      ),
                      Container(
                        height: 40,
                        margin: EdgeInsets.all(5),
                        color: Colors.amber,
                      )
                    ],
                  ),
                );
              
    // Container(
    //   margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    //   height: 100,
    //   decoration: BoxDecoration(
    //     border: Border.all(color: Colors.black),
    //     color: Colors.amber,
    //     borderRadius: BorderRadius.circular(5),
    //   ),
    //   child: 
    //   Column(
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [Text(widget.eventTitle,style: TextStyle(fontFamily: "Schyler"),), Text(widget.eventDate + " ("+widget.eventTime+")",style: TextStyle(fontFamily: "Schyler"),),],
    //       )
    //     ],
    //   ),
    // )
    
  }
}
