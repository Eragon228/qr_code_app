import 'package:flutter/material.dart';

void main() {
  runApp(const ChosenPage());
}

class ChosenPage extends StatelessWidget 
{
  const ChosenPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ekran vibora',
      theme: ThemeData(
        //TextField:  TextStyle(color: Colors.black, fontSize: 20),
        scaffoldBackgroundColor: const Color.fromARGB(240, 175, 175, 175),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.grey, // Set the AppBar background color to grey
        ),
      ),
      home: const MyHomePage(title: 'Выбрать положение'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController floorController = TextEditingController();
  final TextEditingController roomController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String selectedItem = "Стол";

  // A map to hold visibility states for numbers for each item
  Map<String, bool> _visibilityStates = {
    'Этаж:': false,
    'Помещение:': false,
    'Шкаф:': false,
  };

  @override
  Widget build(BuildContext context)
   {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Align
        (
          alignment: Alignment.center,
          child: Text(widget.title),
        ),
        leading: IconButton
        (
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Add your back navigation here
          },
        ),
      ),
      body: SingleChildScrollView(  // Оборачиваем в SingleChildScrollView
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Поле "Этаж"
            TextField(
              controller: floorController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: "Этаж:",
                labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 40),
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
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 40),
            // Выпадающий список/////////////////////////
            DropdownButtonFormField<String>(
              value: selectedItem,
              items: 
              [
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
                  //borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),

            SizedBox(height: 450),  // Оставляем пространство перед кнопкой
            // Кнопка "Добавить"
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Действие при нажатии на кнопку
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),  // Высокая кнопка
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(46.0), // Скругление углов кнопки
                  ),
                  backgroundColor: Colors.white,  // Белый цвет фона кнопки
                  textStyle: TextStyle(color: Colors.black), // Чёрный цвет текста// Без тени
                ),
                child: Text(
                  "Выбрать",  // Текст кнопки
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