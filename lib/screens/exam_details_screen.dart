import 'package:flutter/material.dart';
import 'package:mis_lab1/models/exam.dart';

class ExamDetailsScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailsScreen({super.key, required this.exam});

  String remainingTime() {
    final now = DateTime.now();
    Duration diff = exam.dateTime.difference(now);

    if (diff.isNegative) return "Испитот веќе е поминат";

    final days = diff.inDays;
    final hours = diff.inHours;

    return "$days дена и $hours часа";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text(
          exam.subject,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.black45,
            shadows: [
              Shadow(
                color: Colors.black45,
                offset: Offset(1, 1),
                blurRadius: 2,
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[400],
        elevation: 0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(color: Colors.black54, thickness: 1, height: 1),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Material(
            color: Color(0xFF6096ba),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.black54,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Center(
            child: Card(
              color: Color(0xFF6096ba),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 12,
              shadowColor: Colors.black.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.school, color: Colors.black54, size: 30),
                        Text(
                          exam.subject,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Divider(color: Colors.black54, thickness: 1),
                    Row(
                      children: [
                        Icon(
                          Icons.date_range_outlined,
                          color: Colors.black54,
                          size: 30,
                        ),
                        Text(
                          "Датум: ${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}",
                          style: const TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.timelapse, color: Colors.black54, size: 30),
                        Text(
                          "Време: ${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')}",
                          style: const TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.place,
                          color: Colors.black54,
                          size: 30,
                        ),
                        Text(
                          "Простории: ${exam.classrooms.join(', ')}",
                          style: const TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.alarm,
                          color: Colors.black54,
                          size: 30,
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            "До испитот преостануваат: ${remainingTime()}",
                            style: const TextStyle(fontSize: 18),
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
