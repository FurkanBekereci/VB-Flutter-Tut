import 'package:first_project/202/state_management/state_learn_view_model.dart';
import 'package:flutter/material.dart';

class StateManagementLearn extends StatefulWidget {
  const StateManagementLearn({Key? key}) : super(key: key);

  @override
  State<StateManagementLearn> createState() => _StateManagementLearnState();
}

class _StateManagementLearnState extends BaseViewModel<StateManagementLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isVisible ? Colors.amber : Colors.teal,
        actions: [Center(child: CircularProgressIndicator(color: isOpacity ? Colors.white : Colors.brown))],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ElevatedButton(onPressed: toggleOpacity, child: const Text('Change action color'))],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleVisibility,
        child: const Icon(Icons.change_circle),
      ),
    );
  }
}
