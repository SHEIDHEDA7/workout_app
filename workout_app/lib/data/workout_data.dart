// ignore_for_file: unused_local_variable, avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:workout_app/models/exercises.dart';
import 'package:workout_app/models/workout.dart';

//Change notifier so that changes are saved and system
//managed.
class WorkoutData extends ChangeNotifier {
  /* 

  Workout is a list which will have a name and 
  a list of exercises.

  */

  List<Workout> workoutList = [
    Workout(
      name: 'Pull',
      exercise: [
        Exercise(
          name: 'Rowing',
          sets: '4',
        ),
      ],
    ),
    Workout(
      name: 'Push',
      exercise: [
        Exercise(
          name: 'Bench Press',
          sets: '4',
        )
      ],
    )
  ];

  // Getting the list of workouts
  List<Workout> getWList() {
    return workoutList;
  }

  // Adding a workout
  void addWork(String name) {
    workoutList.add(Workout(name: name, exercise: []));

    notifyListeners();
  }

  // Adding an exercise to a workout
  void addExe(String workName, String exerName, String sets) {
    // ***** find relevant workout, so that we add to one that already exists
    // Workout relevantOne =
    //     workoutList.firstWhere((Workout) => Workout.name == workName);
    // List name.firstWhere((Class) => class.val == name in parameter);
    // *********
    Workout relevantW = getrelevantWork(workName);
    relevantW.exercise.add(Exercise(name: exerName, sets: sets));

    notifyListeners();
  }

  // Check off exercise
  void checkOff(String workName, String exerName) {
    // Find relevant workout and exercise if they exist
    Exercise relevantExer = getrelevantExer(workName, exerName);

    //Check off
    relevantExer.isDone = !relevantExer.isDone;

    notifyListeners();
  }

  // Getting length of workout
  int numberofExer(String workName) {
    Workout relevantW = getrelevantWork(workName);
    return relevantW.exercise.length;
  }

  // Returns relevant workout object, name
  Workout getrelevantWork(String workName) {
    Workout relevantW =
        workoutList.firstWhere((Workout) => Workout.name == workName);
    return relevantW;
  }

  // Returns relevant exercise object, name
  Exercise getrelevantExer(String workName, String exerName) {
    // First find relevant workout
    Workout relevantW = getrelevantWork(workName);

    // Then relevant exercise
    Exercise relevantE =
        relevantW.exercise.firstWhere((Exercise) => Exercise.name == exerName);
    return relevantE;
  }
}
