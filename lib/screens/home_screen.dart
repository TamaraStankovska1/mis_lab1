import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key}) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  final List<Exam> exams = [
    Exam(
      subject: "Структурно програмирање",
      dateTime: DateTime(2025, 09, 11, 10, 0),
      classrooms: ["200ab", "215"],
    ),
    Exam(
      subject: "Веб програмирање",
      dateTime: DateTime(2025, 11, 15, 08, 0),
      classrooms: ["215", "3"],
    ),
    Exam(
      subject: "Бази на податоци",
      dateTime: DateTime(2025, 11, 16, 14, 0),
      classrooms: ["138", "2"],
    ),
    Exam(
      subject: "Вовед во науката за податоци",
      dateTime: DateTime(2025, 11, 29, 12, 0),
      classrooms: ["12", "13"],
    ),
    Exam(
      subject: "Бизнис статистика",
      dateTime: DateTime(2025, 11, 20, 10, 0),
      classrooms: ["200v", "13"],
    ),
    Exam(
      subject: "Дискретна математика",
      dateTime: DateTime(2025, 11, 21, 16, 0),
      classrooms: ["2", "3", "12"],
    ),
    Exam(
      subject: "Оперативни системи",
      dateTime: DateTime(2025, 11, 18, 10, 0),
      classrooms: ["200ab", "215", "117"],
    ),
    Exam(
      subject: "Веројатност и статистика",
      dateTime: DateTime(2025, 11, 16, 10, 0),
      classrooms: ["117", "12"],
    ),
    Exam(
      subject: "Компјутерски мрежи",
      dateTime: DateTime(2025, 09, 03, 09, 0),
      classrooms: ["138", "3"],
    ),
    Exam(
      subject: "Вовед во компјутерски науки",
      dateTime: DateTime(2025, 09, 05, 10, 0),
      classrooms: ["200v", "200ab"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6A89A7),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.menu_book,
              color: Colors.black45,
              size: 28,
            ),
            const SizedBox(width: 8),
            Text(
              "Распоред за испити 223113",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black45,
                letterSpacing: 0.5,
                shadows: [
                  Shadow(
                    color: Colors.black45,
                    offset: Offset(1, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(color: Colors.black54, thickness: 1, height: 1),
        ),
      ),

      body: Stack(
        children: [
          Container(color: Color(0xFF6A89A7)),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index) => ExamCard(exam: exams[index]),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Color(0xFF6A89A7),
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.school, size: 30, color: Colors.white),
                  const SizedBox(width: 8),
                  Text(
                    "Вкупниот број на испити е: ${exams.length}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
