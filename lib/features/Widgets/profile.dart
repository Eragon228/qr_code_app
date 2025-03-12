import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/profile/back.svg',width: 32,height: 32,),

          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Здесь ничего не вставляем для пустого пространства слева (или можно добавить какой-то виджет)
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/profile/logout.svg',),
              iconSize: 60,

            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Пространство для картинки профиля и логина
            CircleAvatar(
              radius: 90,
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                "assets/icons/profile/avatar.svg",

                height: 80,
                width: 80,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Логин",
              style: TextStyle(fontSize: 24, ),
            ),
            SizedBox(height: 60),
            // 3 строки обернутые в белый фон
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ListTile(
                leading: SvgPicture.asset("assets/icons/profile/profile_role.svg"),
                title: Text(
                  "*Пользователь*",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                onTap: () {},
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ListTile(
                leading: Image.asset("assets/icons/profile/Group 35.png"),
                title: Text(
                  "FAQ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                onTap: () {},
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ListTile(
                leading: SvgPicture.asset("assets/icons/profile/story_req.svg"),
                title: Text(
                  "История запросов",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
      // Используем цвет фона из темы// Фон экрана
    );
  }
}
