// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnswerResponse _$AnswerResponseFromJson(Map<String, dynamic> json) {
  return _AnswerResponse.fromJson(json);
}

/// @nodoc
mixin _$AnswerResponse {
  List<AnswerDto> get children => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerResponseCopyWith<AnswerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerResponseCopyWith<$Res> {
  factory $AnswerResponseCopyWith(
          AnswerResponse value, $Res Function(AnswerResponse) then) =
      _$AnswerResponseCopyWithImpl<$Res, AnswerResponse>;
  @useResult
  $Res call({List<AnswerDto> children});
}

/// @nodoc
class _$AnswerResponseCopyWithImpl<$Res, $Val extends AnswerResponse>
    implements $AnswerResponseCopyWith<$Res> {
  _$AnswerResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? children = null,
  }) {
    return _then(_value.copyWith(
      children: null == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<AnswerDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnswerResponseCopyWith<$Res>
    implements $AnswerResponseCopyWith<$Res> {
  factory _$$_AnswerResponseCopyWith(
          _$_AnswerResponse value, $Res Function(_$_AnswerResponse) then) =
      __$$_AnswerResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AnswerDto> children});
}

/// @nodoc
class __$$_AnswerResponseCopyWithImpl<$Res>
    extends _$AnswerResponseCopyWithImpl<$Res, _$_AnswerResponse>
    implements _$$_AnswerResponseCopyWith<$Res> {
  __$$_AnswerResponseCopyWithImpl(
      _$_AnswerResponse _value, $Res Function(_$_AnswerResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? children = null,
  }) {
    return _then(_$_AnswerResponse(
      children: null == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<AnswerDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnswerResponse implements _AnswerResponse {
  const _$_AnswerResponse({required final List<AnswerDto> children})
      : _children = children;

  factory _$_AnswerResponse.fromJson(Map<String, dynamic> json) =>
      _$$_AnswerResponseFromJson(json);

  final List<AnswerDto> _children;
  @override
  List<AnswerDto> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  String toString() {
    return 'AnswerResponse(children: $children)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnswerResponse &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_children));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnswerResponseCopyWith<_$_AnswerResponse> get copyWith =>
      __$$_AnswerResponseCopyWithImpl<_$_AnswerResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnswerResponseToJson(
      this,
    );
  }
}

abstract class _AnswerResponse implements AnswerResponse {
  const factory _AnswerResponse({required final List<AnswerDto> children}) =
      _$_AnswerResponse;

  factory _AnswerResponse.fromJson(Map<String, dynamic> json) =
      _$_AnswerResponse.fromJson;

  @override
  List<AnswerDto> get children;
  @override
  @JsonKey(ignore: true)
  _$$_AnswerResponseCopyWith<_$_AnswerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

AnswerDto _$AnswerDtoFromJson(Map<String, dynamic> json) {
  return _AnswerDto.fromJson(json);
}

/// @nodoc
mixin _$AnswerDto {
  String get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerDtoCopyWith<AnswerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerDtoCopyWith<$Res> {
  factory $AnswerDtoCopyWith(AnswerDto value, $Res Function(AnswerDto) then) =
      _$AnswerDtoCopyWithImpl<$Res, AnswerDto>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class _$AnswerDtoCopyWithImpl<$Res, $Val extends AnswerDto>
    implements $AnswerDtoCopyWith<$Res> {
  _$AnswerDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$_AnswerDtoCopyWith<$Res> implements $AnswerDtoCopyWith<$Res> {
  factory _$$_AnswerDtoCopyWith(
          _$_AnswerDto value, $Res Function(_$_AnswerDto) then) =
      __$$_AnswerDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$_AnswerDtoCopyWithImpl<$Res>
    extends _$AnswerDtoCopyWithImpl<$Res, _$_AnswerDto>
    implements _$$_AnswerDtoCopyWith<$Res> {
  __$$_AnswerDtoCopyWithImpl(
      _$_AnswerDto _value, $Res Function(_$_AnswerDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$_AnswerDto(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnswerDto implements _AnswerDto {
  const _$_AnswerDto({required this.text});

  factory _$_AnswerDto.fromJson(Map<String, dynamic> json) =>
      _$$_AnswerDtoFromJson(json);

  @override
  final String text;

  @override
  String toString() {
    return 'AnswerDto(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnswerDto &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnswerDtoCopyWith<_$_AnswerDto> get copyWith =>
      __$$_AnswerDtoCopyWithImpl<_$_AnswerDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnswerDtoToJson(
      this,
    );
  }
}

abstract class _AnswerDto implements AnswerDto {
  const factory _AnswerDto({required final String text}) = _$_AnswerDto;

  factory _AnswerDto.fromJson(Map<String, dynamic> json) =
      _$_AnswerDto.fromJson;

  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$_AnswerDtoCopyWith<_$_AnswerDto> get copyWith =>
      throw _privateConstructorUsedError;
}
