// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'all_series_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AllSeriesModel _$AllSeriesModelFromJson(Map<String, dynamic> json) {
  return _AllShowsModels.fromJson(json);
}

/// @nodoc
mixin _$AllSeriesModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get genres =>
      throw _privateConstructorUsedError; // required int runtime,
//required int averageRuntime,
//required String premiered,
  Schedule get schedule => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  Image get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllSeriesModelCopyWith<AllSeriesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllSeriesModelCopyWith<$Res> {
  factory $AllSeriesModelCopyWith(
          AllSeriesModel value, $Res Function(AllSeriesModel) then) =
      _$AllSeriesModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      List<String> genres,
      Schedule schedule,
      String summary,
      Image image});

  $ScheduleCopyWith<$Res> get schedule;
  $ImageCopyWith<$Res> get image;
}

/// @nodoc
class _$AllSeriesModelCopyWithImpl<$Res>
    implements $AllSeriesModelCopyWith<$Res> {
  _$AllSeriesModelCopyWithImpl(this._value, this._then);

  final AllSeriesModel _value;
  // ignore: unused_field
  final $Res Function(AllSeriesModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? genres = freezed,
    Object? schedule = freezed,
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
      genres: genres == freezed
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
      schedule: schedule == freezed
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Schedule,
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
  $ScheduleCopyWith<$Res> get schedule {
    return $ScheduleCopyWith<$Res>(_value.schedule, (value) {
      return _then(_value.copyWith(schedule: value));
    });
  }

  @override
  $ImageCopyWith<$Res> get image {
    return $ImageCopyWith<$Res>(_value.image, (value) {
      return _then(_value.copyWith(image: value));
    });
  }
}

/// @nodoc
abstract class _$$_AllShowsModelsCopyWith<$Res>
    implements $AllSeriesModelCopyWith<$Res> {
  factory _$$_AllShowsModelsCopyWith(
          _$_AllShowsModels value, $Res Function(_$_AllShowsModels) then) =
      __$$_AllShowsModelsCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      List<String> genres,
      Schedule schedule,
      String summary,
      Image image});

  @override
  $ScheduleCopyWith<$Res> get schedule;
  @override
  $ImageCopyWith<$Res> get image;
}

/// @nodoc
class __$$_AllShowsModelsCopyWithImpl<$Res>
    extends _$AllSeriesModelCopyWithImpl<$Res>
    implements _$$_AllShowsModelsCopyWith<$Res> {
  __$$_AllShowsModelsCopyWithImpl(
      _$_AllShowsModels _value, $Res Function(_$_AllShowsModels) _then)
      : super(_value, (v) => _then(v as _$_AllShowsModels));

  @override
  _$_AllShowsModels get _value => super._value as _$_AllShowsModels;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? genres = freezed,
    Object? schedule = freezed,
    Object? summary = freezed,
    Object? image = freezed,
  }) {
    return _then(_$_AllShowsModels(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      genres: genres == freezed
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
      schedule: schedule == freezed
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Schedule,
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
class _$_AllShowsModels implements _AllShowsModels {
  _$_AllShowsModels(
      {required this.id,
      required this.name,
      required final List<String> genres,
      required this.schedule,
      required this.summary,
      required this.image})
      : _genres = genres;

  factory _$_AllShowsModels.fromJson(Map<String, dynamic> json) =>
      _$$_AllShowsModelsFromJson(json);

  @override
  final int id;
  @override
  final String name;
  final List<String> _genres;
  @override
  List<String> get genres {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

// required int runtime,
//required int averageRuntime,
//required String premiered,
  @override
  final Schedule schedule;
  @override
  final String summary;
  @override
  final Image image;

  @override
  String toString() {
    return 'AllSeriesModel(id: $id, name: $name, genres: $genres, schedule: $schedule, summary: $summary, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AllShowsModels &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            const DeepCollectionEquality().equals(other.schedule, schedule) &&
            const DeepCollectionEquality().equals(other.summary, summary) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(_genres),
      const DeepCollectionEquality().hash(schedule),
      const DeepCollectionEquality().hash(summary),
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$$_AllShowsModelsCopyWith<_$_AllShowsModels> get copyWith =>
      __$$_AllShowsModelsCopyWithImpl<_$_AllShowsModels>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AllShowsModelsToJson(this);
  }
}

abstract class _AllShowsModels implements AllSeriesModel {
  factory _AllShowsModels(
      {required final int id,
      required final String name,
      required final List<String> genres,
      required final Schedule schedule,
      required final String summary,
      required final Image image}) = _$_AllShowsModels;

  factory _AllShowsModels.fromJson(Map<String, dynamic> json) =
      _$_AllShowsModels.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  List<String> get genres;
  @override // required int runtime,
//required int averageRuntime,
//required String premiered,
  Schedule get schedule;
  @override
  String get summary;
  @override
  Image get image;
  @override
  @JsonKey(ignore: true)
  _$$_AllShowsModelsCopyWith<_$_AllShowsModels> get copyWith =>
      throw _privateConstructorUsedError;
}
