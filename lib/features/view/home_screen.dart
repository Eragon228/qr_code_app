import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/features/Widgets/Widgets.dart';
import '/router/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // Убираем автоматическую кнопку для бокового меню
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Кнопка для открытия бокового меню
            Builder(
              builder: (context) => IconButton(
                icon: SvgPicture.asset('assets/icons/home_p/sidebar.svg'),
                iconSize: 60,
                onPressed: () {
                  // Открытие бокового меню
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
            SizedBox(width: 13),
            // Поле поиска
            Container(
              height: 40,
              width: 190,
              child: TextField(
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 20),
                  hintText: 'Поиск',
                  prefixIcon: SvgPicture.asset(
                    'assets/icons/home_p/search.svg',
                    height: 15,
                    width: 15,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                ),
              ),
            ),
            SizedBox(width: 13),
            // Кнопка профиля
            IconButton(
              icon: SvgPicture.asset('assets/icons/home_p/profile.svg'),
              iconSize: 60,
              onPressed: () {
                Navigator.pushNamed(context, "/profile");
              },
            ),
          ],
        ),
      ),
      // Боковое меню
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Уменьшаем высоту синего поля с надписью "Меню"
            // SizedBox(height: 40,),
            DrawerHeader(
              padding: EdgeInsets.all(20),  // Уменьшаем внутренние отступы
              child: Text(''),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue[50], // Фон для элемента
                borderRadius: BorderRadius.circular(12), // Закругление углов
              ),
              child: ListTile(
                title: Text('Инвентаризация',style: TextStyle(fontSize: 20,color: Colors.black)),
                onTap: () {
                  Navigator.pushNamed(context, "/inventory");
                },
              ),
            ),
            SizedBox(height: 12,),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue[50], // Фон для элемента
                borderRadius: BorderRadius.circular(12), // Закругление углов
              ),
              child: ListTile(
                title: Text('Выгрузка данных',style: TextStyle(fontSize: 20,color: Colors.black)),
                onTap: () {
                  Navigator.pushNamed(context, "/uploading_thing");
                },
              ),
            ),
          ],
        ),
      ),
      body: InventoryScreen(),
    );
  }
}
