// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/data/workout_data.dart';
import 'package:workout_app/pages/workout_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // *****A text controller is created to access what is entered in Text Field
  final workoutController = TextEditingController();

  // Method for creating a new workout
  void createWorkout() {
    // *****Create a dialog box first in which we give the workout name, save it or cancel
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Enter the new workout name"),
        content: TextField(
          controller: workoutController,
        ),
        actions: [
          // Save the workout
          MaterialButton(
            onPressed: saveW,
            child: Text(" Save "),
          ),

          // Cancel
          MaterialButton(
            onPressed: cancelW,
            child: Text(" Cancel "),
          )
        ],
      ),
    );
  }

  // Go to workout page
  void goToWorkout(String workoutName) {
    // *****When we move from one page to another
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WorkoutPage(
            workoutName: workoutName,
          ),
        ));
  }

  void saveW() {
    // Get workout name, the controller gets the entered text
    String nameOfWorkout = workoutController.text;

    // *****It is passed to workout data in the following form
    // Provide.of< where_to_pass >(context, listen: false).method;
    Provider.of<WorkoutData>(context, listen: false).addWork(nameOfWorkout);
    Navigator.pop(context);
  }

  void cancelW() {
    Navigator.pop(context);
    //workoutController.clear();
    clearCont();
  }

  //Clears controller contents, when accessed next time
  void clearCont() {
    workoutController.clear();
  }

  @override
  Widget build(BuildContext context) {
    /* The reason why consumer class is used is that it takes the 
      value from the ancestor which is in < > and pass to the builder
      in this case the workout data to the scaffold */

    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            leading: const Icon(
              Icons.heart_broken,
              color: Colors.black,
            ),
            backgroundColor: Colors.deepPurple.shade100,
            title: const Text(
              'Workout App',
              style: TextStyle(color: Colors.black),
            ),
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () => createWorkout,
              child: Icon(
                Icons.add,
                size: 30,
              )),
          body: ListView.builder(

              // So that we know total workouts

              itemCount: value.getWList().length,
              itemBuilder: (context, index) => ListTile(
                    title: Text(value.getWList()[index].name),
                    trailing: IconButton(
                      icon: Icon(Icons.arrow_forward_ios_sharp),
                      onPressed: () =>
                          goToWorkout(value.getWList()[index].name),
                    ),
                  ))),
    );
  }
}
