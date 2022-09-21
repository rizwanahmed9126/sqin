// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Image _$ImageFromJson(Map<String, dynamic> json) {
  return _Image.fromJson(json);
}

/// @nodoc
mixin _$Image {
  String get medium => throw _privateConstructorUsedError;
  String get original => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageCopyWith<Image> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageCopyWith<$Res> {
  factory $ImageCopyWith(Image value, $Res Function(Image) then) =
      _$ImageCopyWithImpl<$Res>;
  $Res call({String medium, String original});
}

/// @nodoc
class _$ImageCopyWithImpl<$Res> implements $ImageCopyWith<$Res> {
  _$ImageCopyWithImpl(this._value, this._then);

  final Image _value;
  // ignore: unused_field
  final $Res Function(Image) _then;

  @override
  $Res call({
    Object? medium = freezed,
    Object? original = freezed,
  }) {
    return _then(_value.copyWith(
      medium: medium == freezed
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as String,
      original: original == freezed
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ImageCopyWith<$Res> implements $ImageCopyWith<$Res> {
  factory _$$_ImageCopyWith(_$_Image value, $Res Function(_$_Image) then) =
      __$$_ImageCopyWithImpl<$Res>;
  @override
  $Res call({String medium, String original});
}

/// @nodoc
class __$$_ImageCopyWithImpl<$Res> extends _$ImageCopyWithImpl<$Res>
    implements _$$_ImageCopyWith<$Res> {
  __$$_ImageCopyWithImpl(_$_Image _value, $Res Function(_$_Image) _then)
      : super(_value, (v) => _then(v as _$_Image));

  @override
  _$_Image get _value => super._value as _$_Image;

  @override
  $Res call({
    Object? medium = freezed,
    Object? original = freezed,
  }) {
    return _then(_$_Image(
      medium: medium == freezed
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as String,
      original: original == freezed
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Image implements _Image {
  _$_Image({required this.medium, required this.original});

  factory _$_Image.fromJson(Map<String, dynamic> json) =>
      _$$_ImageFromJson(json);

  @override
  final String medium;
  @override
  final String original;

  @override
  String toString() {
    return 'Image(medium: $medium, original: $original)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Image &&
            const DeepCollectionEquality().equals(other.medium, medium) &&
            const DeepCollectionEquality().equals(other.original, original));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(medium),
      const DeepCollectionEquality().hash(original));

  @JsonKey(ignore: true)
  @override
  _$$_ImageCopyWith<_$_Image> get copyWith =>
      __$$_ImageCopyWithImpl<_$_Image>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageToJson(this);
  }
}

abstract class _Image implements Image {
  factory _Image(
      {required final String medium,
      required final String original}) = _$_Image;

  factory _Image.fromJson(Map<String, dynamic> json) = _$_Image.fromJson;

  @override
  String get medium;
  @override
  String get original;
  @override
  @JsonKey(ignore: true)
  _$$_ImageCopyWith<_$_Image> get copyWith =>
      throw _privateConstructorUsedError;
}

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return _Schedule.fromJson(json);
}

/// @nodoc
mixin _$Schedule {
  String get time => throw _privateConstructorUsedError;
  List<String> get days => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleCopyWith<Schedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleCopyWith<$Res> {
  factory $ScheduleCopyWith(Schedule value, $Res Function(Schedule) then) =
      _$ScheduleCopyWithImpl<$Res>;
  $Res call({String time, List<String> days});
}

/// @nodoc
class _$ScheduleCopyWithImpl<$Res> implements $ScheduleCopyWith<$Res> {
  _$ScheduleCopyWithImpl(this._value, this._then);

  final Schedule _value;
  // ignore: unused_field
  final $Res Function(Schedule) _then;

  @override
  $Res call({
    Object? time = freezed,
    Object? days = freezed,
  }) {
    return _then(_value.copyWith(
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      days: days == freezed
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_ScheduleCopyWith<$Res> implements $ScheduleCopyWith<$Res> {
  factory _$$_ScheduleCopyWith(
          _$_Schedule value, $Res Function(_$_Schedule) then) =
      __$$_ScheduleCopyWithImpl<$Res>;
  @override
  $Res call({String time, List<String> days});
}

/// @nodoc
class __$$_ScheduleCopyWithImpl<$Res> extends _$ScheduleCopyWithImpl<$Res>
    implements _$$_ScheduleCopyWith<$Res> {
  __$$_ScheduleCopyWithImpl(
      _$_Schedule _value, $Res Function(_$_Schedule) _then)
      : super(_value, (v) => _then(v as _$_Schedule));

  @override
  _$_Schedule get _value => super._value as _$_Schedule;

  @override
  $Res call({
    Object? time = freezed,
    Object? days = freezed,
  }) {
    return _then(_$_Schedule(
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      days: days == freezed
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Schedule implements _Schedule {
  _$_Schedule({required this.time, required final List<String> days})
      : _days = days;

  factory _$_Schedule.fromJson(Map<String, dynamic> json) =>
      _$$_ScheduleFromJson(json);

  @override
  final String time;
  final List<String> _days;
  @override
  List<String> get days {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  String toString() {
    return 'Schedule(time: $time, days: $days)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Schedule &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(_days));

  @JsonKey(ignore: true)
  @override
  _$$_ScheduleCopyWith<_$_Schedule> get copyWith =>
      __$$_ScheduleCopyWithImpl<_$_Schedule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScheduleToJson(this);
  }
}

abstract class _Schedule implements Schedule {
  factory _Schedule(
      {required final String time,
      required final List<String> days}) = _$_Schedule;

  factory _Schedule.fromJson(Map<String, dynamic> json) = _$_Schedule.fromJson;

  @override
  String get time;
  @override
  List<String> get days;
  @override
  @JsonKey(ignore: true)
  _$$_ScheduleCopyWith<_$_Schedule> get copyWith =>
      throw _privateConstructorUsedError;
}
