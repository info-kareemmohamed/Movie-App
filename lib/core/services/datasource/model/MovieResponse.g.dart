// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MovieResponse.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResultsAdapter extends TypeAdapter<Results> {
  @override
  final int typeId = 1;

  @override
  Results read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Results(
      adult: fields[0] as bool?,
      backdropPath: fields[1] as String?,
      id: fields[2] as int?,
      title: fields[3] as String?,
      originalLanguage: fields[4] as String?,
      originalTitle: fields[5] as String?,
      overview: fields[6] as String?,
      posterPath: fields[7] as String?,
      mediaType: fields[8] as String?,
      genreIds: (fields[9] as List?)?.cast<int>(),
      popularity: fields[10] as double?,
      releaseDate: fields[11] as String?,
      video: fields[12] as bool?,
      voteAverage: fields[13] as double?,
      voteCount: fields[14] as int?,
      name: fields[15] as String?,
      originalName: fields[16] as String?,
      firstAirDate: fields[17] as String?,
      originCountry: (fields[18] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Results obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.originalLanguage)
      ..writeByte(5)
      ..write(obj.originalTitle)
      ..writeByte(6)
      ..write(obj.overview)
      ..writeByte(7)
      ..write(obj.posterPath)
      ..writeByte(8)
      ..write(obj.mediaType)
      ..writeByte(9)
      ..write(obj.genreIds)
      ..writeByte(10)
      ..write(obj.popularity)
      ..writeByte(11)
      ..write(obj.releaseDate)
      ..writeByte(12)
      ..write(obj.video)
      ..writeByte(13)
      ..write(obj.voteAverage)
      ..writeByte(14)
      ..write(obj.voteCount)
      ..writeByte(15)
      ..write(obj.name)
      ..writeByte(16)
      ..write(obj.originalName)
      ..writeByte(17)
      ..write(obj.firstAirDate)
      ..writeByte(18)
      ..write(obj.originCountry);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
