import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'view.dart';
import 'choose.dart';
class NewItemScreen extends StatefulWidget {
  @override
  _NewItemScreenState createState() => _NewItemScreenState();
}

class _NewItemScreenState extends State<NewItemScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  Location? selectedLocation; // Переменная для хранения выбранного положения

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
              maxLines: 2,
              controller: nameController,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: "Название",
                labelStyle: TextStyle(color: Colors.black, fontSize: 22),
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
              controller: descriptionController,
              maxLines: 2,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: "Описание",
                labelStyle: TextStyle(color: Colors.black, fontSize: 22),
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
            // Кнопка "Выбрать положение"
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  // Открываем экран выбора положения и ждем результат
                  final selectedLocation = await Navigator.push<Location>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChooseLocationScreen(),
                    ),
                  );

                  // Если пользователь выбрал положение, сохраняем его
                  if (selectedLocation != null) {
                    setState(() {
                      this.selectedLocation = selectedLocation;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 80.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  backgroundColor: Colors.lightBlue[100],
                  textStyle: TextStyle(color: Colors.black),
                  elevation: 0,
                ),
                child: Text(
                  "Выбрать положение",
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
              ),
            ),
            SizedBox(height: 30),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isEmpty || descriptionController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Заполните все поля', style: TextStyle(fontSize: 24))),
                  );
                  return;
                }

                if (selectedLocation == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Выберите положение', style: TextStyle(fontSize: 24))),
                  );
                  return;
                }

                final newItem = Item(
                  id: DateTime.now().millisecondsSinceEpoch,
                  name: nameController.text,
                  description: descriptionController.text,
                  location: selectedLocation!,
                );

                print(newItem.toJson());
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              child: Text("Добавить", style: TextStyle(color: Colors.black, fontSize: 25)),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}