import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewLocationScreen extends StatefulWidget {
  @override
  _NewLocationScreenState createState() => _NewLocationScreenState();
}

class _NewLocationScreenState extends State<NewLocationScreen> {
  final TextEditingController floorController = TextEditingController();
  final TextEditingController roomController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String selectedItem = "Стол";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/profile/back.svg', width: 32, height: 32),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Новое положение",style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(  // Оборачиваем в SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            // Поле "Этаж"
            TextField(
              controller: floorController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: "Этаж",
                labelStyle: TextStyle(color: Colors.black, fontSize: 20),
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
            // Поле "Помещение"
            TextField(
              controller: roomController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: "Помещение",
                labelStyle: TextStyle(color: Colors.black, fontSize: 20),
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
            // Выпадающий список/////////////////////////
            DropdownButtonFormField<String>(
              value: selectedItem,
              items: [
                DropdownMenuItem(child: Text("Стол",style: TextStyle(fontSize: 20),), value: "Стол"),
                DropdownMenuItem(child: Text("Шкаф",style: TextStyle(fontSize: 20),), value: "Шкаф"),
                DropdownMenuItem(child: Text("Помещение",style: TextStyle(fontSize: 20),), value: "Помещение"),
              ],
              onChanged: (value) {
                setState(() {
                  selectedItem = value!;
                });
              },
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.black, fontSize: 20),
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
            // Поле "Описание"
            TextField(
              controller: descriptionController,
              maxLines: 5,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: "Описание",
                labelStyle: TextStyle(color: Colors.black, fontSize: 20),
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
                alignLabelWithHint: true,
              ),
            ),
            SizedBox(height: 180),  // Оставляем пространство перед кнопкой
            // Кнопка "Добавить"
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Действие при нажатии на кнопку
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),  // Высокая кнопка
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // Скругление углов кнопки
                  ),
                  backgroundColor: Colors.white,  // Белый цвет фона кнопки
                  textStyle: TextStyle(color: Colors.black), // Чёрный цвет текста
                  elevation: 0, // Без тени
                ),
                child: Text(
                  "Добавить",  // Текст кнопки
                  style: TextStyle(color: Colors.black, fontSize: 24),  // Чёрный текст
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
