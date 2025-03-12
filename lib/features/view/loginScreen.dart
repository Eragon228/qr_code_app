import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text("logo", style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
              Spacer(),
              TextField(
                controller: loginController,
                decoration: InputDecoration(
                  labelText: "Логин",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Пароль",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              SizedBox(height: 35),

              ElevatedButton(
                onPressed: () {
                  String login = loginController.text;
                  String password = passwordController.text;

                  // Проверка логина и пароля
                  if (login == "admin" && password == "1234") {
                    // Если логин и пароль верные, переход на другой экран
                    Navigator.pushNamed(context, "/main_screen"); // Замените на нужный экран
                  } else {
                    // Если данные неверные, показываем ошибку
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Ошибка'),
                          content: Text('Неверный логин или пароль.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),  // Высокая кнопка
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(27.0), // Скругление углов кнопки
                  ),
                  backgroundColor: Colors.white,  // Белый цвет фона кнопки
                  textStyle: TextStyle(color: Colors.black), // Чёрный цвет текста
                  elevation: 0, // Без тени
                ),
                child: Text("Войти", style: TextStyle(color: Colors.black, fontSize: 20)),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
