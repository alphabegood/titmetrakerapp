import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timetrackerapp/activity.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  String durationStr;

  ActivityCard(this.activity) {
    final String hour =
        (this.activity.duration ~/ 60).toString().padLeft(2, '0');
    final String minute =
        (this.activity.duration % 60).toString().padLeft(2, '0');

    durationStr = '${hour}h:${minute}m';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.all(
                  Radius.circular(3.5),
                )),
            child: Text(
              durationStr,
              style: TextStyle(
                fontFamily: 'Arial',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                activity.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                DateFormat('EEEE, d MMMM HH:mm').format(activity.creationDate),
                style: TextStyle(color: Colors.grey, fontSize: 12),
              )
            ],
          )
        ],
      ),
      elevation: 6,
    );
  }
}