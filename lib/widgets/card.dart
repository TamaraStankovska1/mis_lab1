import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:mis_lab1/screens/exam_details_screen.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final cardColor = exam.dateTime.month != 11
        ? Color(0xFFced4da)
        : Color(0xFF52b788);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExamDetailsScreen(exam: exam),
          ),
        );
      },

      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        color: cardColor,
        elevation: 10,

        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.school, color: Colors.black54, size: 30),
                  const SizedBox(width: 8),
                  Text(exam.subject, style: const TextStyle(fontSize: 18)),
                ],
              ),
              const SizedBox(height: 4),
              const Divider(
                color: Colors.black54,
                thickness: 1,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.date_range_outlined,
                    color: Colors.black54,
                    size: 30,
                  ),
                  Text(
                    "Датум: ${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}",
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.timelapse, color: Colors.black54, size: 30),
                  Text(
                    "Време: ${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')}",
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.place, color: Colors.black54, size: 30),
                  Text("Простории: ${exam.classrooms.join(', ')}"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
