import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class DataExportScreen extends StatelessWidget {
  final TextEditingController floorController = TextEditingController();
  final TextEditingController roomController = TextEditingController();
  String selectedItem = "Шкаф";

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
        title: Text("Выбрать положение", style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              controller: floorController,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: "Этаж",
                labelStyle: TextStyle(color: Colors.black, fontSize: 20),
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
            SizedBox(height: 20),
            TextField(
              controller: roomController,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: "Помещение",
                labelStyle: TextStyle(color: Colors.black, fontSize: 20),
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
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedItem,
              items: [
                DropdownMenuItem(child: Text("Шкаф",style: TextStyle(color: Colors.black, fontSize: 20),), value: "Шкаф"),
                DropdownMenuItem(child: Text("Полка",style: TextStyle(color: Colors.black, fontSize: 20)), value: "Полка"),
                DropdownMenuItem(child: Text("Стол",style: TextStyle(color: Colors.black, fontSize: 20)), value: "Стол"),
              ],

              onChanged: (value) {
                selectedItem = value!;
              },
              decoration: InputDecoration(
                alignLabelWithHint: true,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, // Растягиваем кнопки на всю ширину
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Действие выгрузить конкретное
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 25, horizontal: 70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.white,
                    elevation: 0,
                  ),
                  child: Text(
                    "Выгрузить конкретное",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                SizedBox(height: 25), // Отступ между кнопками
                ElevatedButton(
                  onPressed: () {
                    // Действие выгрузить все
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 25, horizontal: 70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.white,
                    elevation: 0,
                  ),
                  child: Text(
                    "Выгрузить все",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                SizedBox(height: 30,)
              ],
            ),

          ],
        ),
      ),
    );
  }
}