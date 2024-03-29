/**import 'package:flutter/material.dart';
import 'main.dart';
import 'package:uuid/uuid.dart';
import 'dart:math';
import 'dart:collection';

class TodoObject {

  TodoObject(String title, IconData icon) {
    this.title = title;
    this.icon = icon;
    this.color = ColorChoies.colors[new Random().nextInt(ColorChoies.colors.length)];
    tasks = new Map<DateTime, List<TaskObject>>();
    this.uuid = new Uuid().v1();
  }

  TodoObject.import(String uuidS, String title, int sortID, Color color, IconData icon, Map<DateTime, List<TaskObject>> tasks) {
    this.sortID = sortID;
    this.title = title;
    this.color = color;
    this.icon = icon;
    this.tasks = tasks;
    this.uuid = uuidS;
  }

  String uuid;
  int sortID;
  String title;
  Color color;
  IconData icon;
  Map<DateTime, List<TaskObject>> tasks;

  int taskAmount() {
    int amount = 0;
    tasks.values.forEach((list) {
      amount += list.length;
    });
    return amount;
  }

  //List<TaskObject> tasks;





}

class TaskObject {
  DateTime date;
  String task;
  bool _completed;

  TaskObject(String task, DateTime date) {
    this.task = task;
    this.date = date;
    this._completed = false;
  }

  TaskObject.import(String task, DateTime date, bool completed) {
    this.task = task;
    this.date = date;
    this._completed = completed;
    
  }

  void setComplete(bool value) {
    _completed = value;
  }

  isCompleted() => _completed;

}

 */