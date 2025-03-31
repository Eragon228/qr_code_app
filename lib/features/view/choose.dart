import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'view.dart';
class ChooseLocationScreen extends StatefulWidget {
  @override
  _ChooseLocationScreenState createState() => _ChooseLocationScreenState();
}

class _ChooseLocationScreenState extends State<ChooseLocationScreen> {
  final TextEditingController floorController = TextEditingController();
  final TextEditingController roomController = TextEditingController();
  Location? selectedLocation;
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
        title: Text("Выбор положения",style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(  // Оборачиваем в SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 28),
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
                  borderRadius: BorderRadius.circular (16.0),
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
              isDense:false,
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

            SizedBox(height: 250,),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (floorController.text.isEmpty || roomController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Заполните все поля',style: TextStyle(fontSize: 23),)),
                  );
                  return;
                  }
                  final selectedLocation=Location(
                    id: DateTime.now().millisecondsSinceEpoch,
                    floor: floorController.text,
                    room: roomController.text,
                    type: selectedItem,
                  );
                  print(selectedLocation.toJson());

                  Navigator.pop(context,selectedLocation);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 70.0),  // Высокая кнопка
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // Скругление углов кнопки
                  ),
                  backgroundColor: Colors.white,  // Белый цвет фона кнопки
                  textStyle: TextStyle(color: Colors.black), // Чёрный цвет текста
                  elevation: 0, // Без тени
                ),
                child: Text(
                  "Выбрать",  // Текст кнопки
                  style: TextStyle(color: Colors.black, fontSize: 25),  // Чёрный текст
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
