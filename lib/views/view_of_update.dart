import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:patterns_bloc/blocs/update_post_cubit.dart';
import 'package:patterns_bloc/model/post_model.dart';
_finish(BuildContext context) {
  SchedulerBinding.instance.addPostFrameCallback((_) {
    Navigator.pop(context, 'result');
  });
}
Widget viewOfUpdate(BuildContext context,TextEditingController _titleTextEditingController, TextEditingController _bodyTextEditingController, bool isLoading) {
  return SingleChildScrollView(
    child: Stack(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              // Title
              Container(
                height: 75,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12,
                ),
                child: Center(
                  child: TextField(
                    controller: _titleTextEditingController,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'Title',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10,),

              // Body
              Container(
                height: 300,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12,
                ),
                child: TextField(
                  controller: _bodyTextEditingController,
                  style: TextStyle(fontSize: 18),
                  maxLines: 30,
                  decoration: InputDecoration(
                    labelText: 'Body',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              FlatButton(
                color: Colors.blue,
                child: Text("update"),
                onPressed: (){
                  Post post = Post(id: Random().nextInt(100),title: _titleTextEditingController.text, body: _bodyTextEditingController.text, userId: Random().nextInt(100));
                  UpdatePostCubit().apiPostUpdate(post);
                  _finish(context);
                },
              ),
            ],
          ),
        ),

        isLoading ? Center(child: CircularProgressIndicator(),) : SizedBox.shrink(),
      ],
    ),
  );
}