// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnswerModel {
  String get text => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnswerModelCopyWith<AnswerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerModelCopyWith<$Res> {
  factory $AnswerModelCopyWith(
          AnswerModel value, $Res Function(AnswerModel) then) =
      _$AnswerModelCopyWithImpl<$Res, AnswerModel>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class _$AnswerModelCopyWithImpl<$Res, $Val extends AnswerModel>
    implements $AnswerModelCopyWith<$Res> {
  _$AnswerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnswerModelCopyWith<$Res>
    implements $AnswerModelCopyWith<$Res> {
  factory _$$_AnswerModelCopyWith(
          _$_AnswerModel value, $Res Function(_$_AnswerModel) then) =
      __$$_AnswerModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$_AnswerModelCopyWithImpl<$Res>
    extends _$AnswerModelCopyWithImpl<$Res, _$_AnswerModel>
    implements _$$_AnswerModelCopyWith<$Res> {
  __$$_AnswerModelCopyWithImpl(
      _$_AnswerModel _value, $Res Function(_$_AnswerModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$_AnswerModel(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AnswerModel implements _AnswerModel {
  const _$_AnswerModel({required this.text});

  @override
  final String text;

  @override
  String toString() {
    return 'AnswerModel(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnswerModel &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnswerModelCopyWith<_$_AnswerModel> get copyWith =>
      __$$_AnswerModelCopyWithImpl<_$_AnswerModel>(this, _$identity);
}

abstract class _AnswerModel implements AnswerModel {
  const factory _AnswerModel({required final String text}) = _$_AnswerModel;

  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$_AnswerModelCopyWith<_$_AnswerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
