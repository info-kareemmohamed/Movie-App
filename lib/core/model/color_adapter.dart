import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ColorAdapter extends TypeAdapter<Color> {
  @override
  final typeId = 100; // Unique ID for the adapter

  @override
  Color read(BinaryReader reader) {
    final value = reader.readInt(); // Read the color value as an int
    return Color(value);
  }

  @override
  void write(BinaryWriter writer, Color obj) {
    writer.writeInt(obj.value); // Write the color value as an int
  }
}
