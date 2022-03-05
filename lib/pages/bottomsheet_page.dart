import 'dart:math';

import 'package:flutter/material.dart';

import 'package:patterns_bloc/model/post_model.dart';
import 'package:patterns_bloc/pages/home_page.dart';
import 'package:patterns_bloc/services/http_service.dart';

class BottomSheetpage extends StatefulWidget {
  String fullname;
  String mobile;

  BottomSheetpage({
    Key key,
    this.fullname,
    this.mobile,
  }) : super(key: key);
static const String id="botoomsheet_page";
  @override
  BottomSheetpageState createState() => BottomSheetpageState();
}

class BottomSheetpageState extends State<BottomSheetpage> {
  bool isLoading = false;
  final TextEditingController _titleTextEditingController = TextEditingController();
  final TextEditingController _bodyTextEditingController = TextEditingController();

  _apiPostUpdate() async {
    setState(() {
      isLoading = true;
    });

    // Post post = Post(
    //     id: Random().nextInt(pow(2, 30) - 1),
    //     fullname: _titleTextEditingController.text,
    //     mobile: _bodyTextEditingController.text);


    // var response =
    //     await Network.PUT(Network.API_UPDATE + '1', Network.paramsUpdate(post));

  //   setState(() {
  //     if (response != null) {
  //       Navigator.pushNamedAndRemoveUntil(
  //           context, Home_page.id, (route) => false);
  //     }
  //     print(response);
  //     isLoading = false;
  //   });
   }

  @override
  void initState() {
    super.initState();

    _titleTextEditingController.text = widget.fullname;
    _bodyTextEditingController.text = widget.mobile;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
   _titleTextEditingController;
   _bodyTextEditingController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text("Title",style: TextStyle(color: Colors.grey,fontSize: 20),),
                  const SizedBox(height: 10,),
                  // #title
                  Container(
                    height: 70,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    child: Center(
                      child: TextField(
                        controller: _titleTextEditingController,
                        style: const TextStyle(color:Colors.white,fontSize: 20),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Content",style: TextStyle(color: Colors.grey,fontSize: 20),),
                  const SizedBox(height: 10,),
                  // #content
                  Container(
                    height: 300,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    child: TextField(
                      controller: _bodyTextEditingController,
                      style: const TextStyle(color:Colors.white,fontSize: 18),
                      maxLines: 30,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  FlatButton(
                    onPressed: (){
                      _apiPostUpdate();},
                    height: 45,
                    minWidth: double.infinity,
                    color: Colors.blue,
                    child: const Text("Update",style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),
                ],
              ),
            ),
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
