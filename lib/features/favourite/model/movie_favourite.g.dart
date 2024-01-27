// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_favourite.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieFavouriteAdapter extends TypeAdapter<MovieFavourite> {
  @override
  final int typeId = 2;

  @override
  MovieFavourite read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieFavourite(
      backdropPath: fields[0] as String?,
      id: fields[1] as int?,
      title: fields[2] as String?,
      originalLanguage: fields[3] as String?,
      genres: (fields[4] as List?)?.cast<String>(),
      voteAverage: fields[5] as double?,
      originCountry: fields[6] as String?,
      release_date: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieFavourite obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.backdropPath)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.originalLanguage)
      ..writeByte(4)
      ..write(obj.genres)
      ..writeByte(5)
      ..write(obj.voteAverage)
      ..writeByte(6)
      ..write(obj.originCountry)
      ..writeByte(7)
      ..write(obj.release_date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieFavouriteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
