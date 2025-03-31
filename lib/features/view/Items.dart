import "package:flutter/material.dart";
import "package:qr_flutter/qr_flutter.dart";

class Item {
  final int id;
  final String name;
  final Location location;
  final String description;

  Item({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
  });

  // Метод для преобразования объекта в JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location.toJson(),
      'description': description,
    };
  }
}

class Location {
  final int id;
  final String floor;
  final String room;
  final String type;
  final String? description;

  Location({
    required this.id,
    required this.floor,
    required this.room,
    required this.type,
    this.description,
  });

  // Метод для преобразования объекта в JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'floor': floor,
      'room': room,
      'type': type,
      'description': description,
    };
  }
}
