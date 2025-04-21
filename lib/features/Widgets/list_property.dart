import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InventoryScreen extends StatefulWidget {
  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  // Управление состоянием текущего фильтра
  String currentFilter = 'Положение'; // Варианты: 'Положение', 'Положения', 'Имущество'
  String? selectedHierarchy; // Выбранный этаж или кабинет

  // Пример данных
  final List<String> floors = ['Этаж 1', 'Этаж 2', 'Этаж 3'];
  final Map<String, List<String>> rooms = {
    'Этаж 1': ['Кабинет 101', 'Кабинет 102', 'Кабинет 103'],
    'Этаж 2': ['Кабинет 201', 'Кабинет 202'],
    'Этаж 3': ['Кабинет 301', 'Кабинет 302', 'Кабинет 303', 'Кабинет 304'],

  };

  // Список элементов для отображения
  List<String> get currentList {
    if (selectedHierarchy != null) {
      // Показываем кабинеты на выбранном этаже
      return rooms[selectedHierarchy] ?? [];
    } else if (currentFilter == 'Положения') {
      // Показываем этажи
      return floors;
    } else if (currentFilter == 'Имущество') {
      // Показываем имущество (пример)
      return ['Стул', 'Стол', 'Компьютер', 'Доска'];
    }
    // По умолчанию показываем Положение элементы
    return ['Этаж 1', 'Этаж 2', 'Этаж 3', 'Стул', 'Стол', 'Компьютер','Этаж 1', 'Этаж 2', 'Этаж 3', 'Стул', 'Стол', 'Компьютер'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          // Верхняя панель фильтров
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFilterButton('Положения'),
                _buildFilterButton('Имущество'),
                SizedBox(width: 50,),
                IconButton(
                  icon: Icon(Icons.filter_list),
                  iconSize: 35,
                  onPressed: () {
                    // Здесь можно добавить расширенный фильтр
                  },
                ),
                SizedBox(width: 0,)
              ],
            ),
          ),

          // Заголовок выбранного элемента и кнопка "назад"
          if (selectedHierarchy != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    iconSize: 35,
                    onPressed: () {
                      setState(() {
                        selectedHierarchy = null; // Возврат к предыдущей иерархии
                      });
                    },
                  ),
                  Text(
                    selectedHierarchy!,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),

          // Динамический список
          Expanded(
            child: ListView.separated(

              itemCount: currentList.length,
              itemBuilder: (context, index) {
                final item = currentList[index];
                return ListTile(
                  title: Text(item,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20,),
                  onTap: () {
                    setState(() {
                      if (currentFilter == 'Положения' && selectedHierarchy == null) {
                        // Если выбрали этаж, показываем кабинеты
                        selectedHierarchy = item;
                      } else {
                        // Здесь можно обработать выбор имущества
                      }
                    });
                  },
                );
              },
              separatorBuilder: (context,index){
                return Divider(
                  color: Colors.lightBlueAccent[100],
                  thickness: 0.4,


                );
              },
            ),
          ),

          // Статичные кнопки внизу экрана
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/icons/home_p/edit.svg'),
                  iconSize: 35,
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/icons/home_p/qr_code.svg'),
                  iconSize: 58,
                ),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (context) {
                        return Container(
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min, // Минимизирует высоту
                            children: [
                              ListTile(
                                leading: Icon(Icons.location_on, color: Colors.blue),
                                title: Text("Положение", style: TextStyle(fontSize: 18)),
                                onTap: () {
                                  Navigator.pop(context); // Закрываем меню
                                  Navigator.pushNamed(context, '/new_pos'); // Переход на экран "Новое положение"
                                },
                              ),
                              Divider(thickness: 1),
                              ListTile(
                                leading: Icon(Icons.add_circle_outline, color: Colors.green),
                                title: Text("Вещь", style: TextStyle(fontSize: 18)),
                                onTap: () {
                                  Navigator.pop(context); // Закрываем меню
                                  Navigator.pushNamed(context, '/new_thing'); // Переход на экран "Новая вещь"
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  icon: SvgPicture.asset('assets/icons/home_p/add.svg'),
                  iconSize: 35,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Создание кнопки фильтра
  Widget _buildFilterButton(String filter) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          currentFilter = filter;
          selectedHierarchy = null; // Сброс выбранной иерархии
        });
      },
      child: Text(
        filter,
          style: TextStyle(
            fontSize: 15,
            color: currentFilter == filter ? Colors.white : Colors.black, // Цвет текста
          ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: currentFilter == filter ? Colors.black87 : Colors.white,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),

        ),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),

      ),
    );
  }
}
