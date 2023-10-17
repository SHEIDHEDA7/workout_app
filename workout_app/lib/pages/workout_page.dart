// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member, annotate_overrides, avoid_web_libraries_in_flutter

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:workout_app/pages/homepage.dart';

class WorkoutPage extends StatefulWidget {
  final String workoutName;
  const WorkoutPage({super.key, required this.workoutName});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  @override

  // Going back
  void goBack() {
    Navigator.push(
        context as BuildContext,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => goBack,
        ),
        title: Text("Add Workouts"),
        backgroundColor: Colors.black,
      ),
    );
  }
}
