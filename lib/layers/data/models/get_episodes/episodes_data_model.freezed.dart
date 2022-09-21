// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'episodes_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EpisodesDataModel _$EpisodesDataModelFromJson(Map<String, dynamic> json) {
  return _EpisodesDataModel.fromJson(json);
}

/// @nodoc
mixin _$EpisodesDataModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get season => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  Image get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpisodesDataModelCopyWith<EpisodesDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodesDataModelCopyWith<$Res> {
  factory $EpisodesDataModelCopyWith(
          EpisodesDataModel value, $Res Function(EpisodesDataModel) then) =
      _$EpisodesDataModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      int season,
      int number,
      String summary,
      Image image});

  $ImageCopyWith<$Res> get image;
}

/// @nodoc
class _$EpisodesDataModelCopyWithImpl<$Res>
    implements $EpisodesDataModelCopyWith<$Res> {
  _$EpisodesDataModelCopyWithImpl(this._value, this._then);

  final EpisodesDataModel _value;
  // ignore: unused_field
  final $Res Function(EpisodesDataModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? season = freezed,
    Object? number = freezed,
    Object? summary = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      season: season == freezed
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as int,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      summary: summary == freezed
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image,
    ));
  }

  @override
  $ImageCopyWith<$Res> get image {
    return $ImageCopyWith<$Res>(_value.image, (value) {
      return _then(_value.copyWith(image: value));
    });
  }
}

/// @nodoc
abstract class _$$_EpisodesDataModelCopyWith<$Res>
    implements $EpisodesDataModelCopyWith<$Res> {
  factory _$$_EpisodesDataModelCopyWith(_$_EpisodesDataModel value,
          $Res Function(_$_EpisodesDataModel) then) =
      __$$_EpisodesDataModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      int season,
      int number,
      String summary,
      Image image});

  @override
  $ImageCopyWith<$Res> get image;
}

/// @nodoc
class __$$_EpisodesDataModelCopyWithImpl<$Res>
    extends _$EpisodesDataModelCopyWithImpl<$Res>
    implements _$$_EpisodesDataModelCopyWith<$Res> {
  __$$_EpisodesDataModelCopyWithImpl(
      _$_EpisodesDataModel _value, $Res Function(_$_EpisodesDataModel) _then)
      : super(_value, (v) => _then(v as _$_EpisodesDataModel));

  @override
  _$_EpisodesDataModel get _value => super._value as _$_EpisodesDataModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? season = freezed,
    Object? number = freezed,
    Object? summary = freezed,
    Object? image = freezed,
  }) {
    return _then(_$_EpisodesDataModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      season: season == freezed
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as int,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      summary: summary == freezed
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EpisodesDataModel implements _EpisodesDataModel {
  _$_EpisodesDataModel(
      {required this.id,
      required this.name,
      required this.season,
      required this.number,
      required this.summary,
      required this.image});

  factory _$_EpisodesDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_EpisodesDataModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int season;
  @override
  final int number;
  @override
  final String summary;
  @override
  final Image image;

  @override
  String toString() {
    return 'EpisodesDataModel(id: $id, name: $name, season: $season, number: $number, summary: $summary, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EpisodesDataModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.season, season) &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.summary, summary) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(season),
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(summary),
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$$_EpisodesDataModelCopyWith<_$_EpisodesDataModel> get copyWith =>
      __$$_EpisodesDataModelCopyWithImpl<_$_EpisodesDataModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EpisodesDataModelToJson(this);
  }
}

abstract class _EpisodesDataModel implements EpisodesDataModel {
  factory _EpisodesDataModel(
      {required final int id,
      required final String name,
      required final int season,
      required final int number,
      required final String summary,
      required final Image image}) = _$_EpisodesDataModel;

  factory _EpisodesDataModel.fromJson(Map<String, dynamic> json) =
      _$_EpisodesDataModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get season;
  @override
  int get number;
  @override
  String get summary;
  @override
  Image get image;
  @override
  @JsonKey(ignore: true)
  _$$_EpisodesDataModelCopyWith<_$_EpisodesDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
