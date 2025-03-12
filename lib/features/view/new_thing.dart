import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class NewItemScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController articleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/profile/back.svg', width: 32, height: 32),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Новая вещь", style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 25),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: "Название",
                labelStyle: TextStyle( color:Colors.black, fontSize: 20,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 25),
            TextField(
              controller: articleController,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: "Артикул",
                labelStyle: TextStyle( color:Colors.black, fontSize: 20,),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(height: 25),
            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: "Описание",
                labelStyle: TextStyle( color:Colors.black, fontSize: 20,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Действие добавления
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              child: Text("Добавить", style: TextStyle(color: Colors.black, fontSize: 20)),
            ),
            SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
}