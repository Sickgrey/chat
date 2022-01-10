// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rooms_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RoomsEventTearOff {
  const _$RoomsEventTearOff();

  RoomsListOpened roomsListOpened() {
    return const RoomsListOpened();
  }
}

/// @nodoc
const $RoomsEvent = _$RoomsEventTearOff();

/// @nodoc
mixin _$RoomsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() roomsListOpened,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? roomsListOpened,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? roomsListOpened,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoomsListOpened value) roomsListOpened,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoomsListOpened value)? roomsListOpened,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomsListOpened value)? roomsListOpened,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomsEventCopyWith<$Res> {
  factory $RoomsEventCopyWith(
          RoomsEvent value, $Res Function(RoomsEvent) then) =
      _$RoomsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$RoomsEventCopyWithImpl<$Res> implements $RoomsEventCopyWith<$Res> {
  _$RoomsEventCopyWithImpl(this._value, this._then);

  final RoomsEvent _value;
  // ignore: unused_field
  final $Res Function(RoomsEvent) _then;
}

/// @nodoc
abstract class $RoomsListOpenedCopyWith<$Res> {
  factory $RoomsListOpenedCopyWith(
          RoomsListOpened value, $Res Function(RoomsListOpened) then) =
      _$RoomsListOpenedCopyWithImpl<$Res>;
}

/// @nodoc
class _$RoomsListOpenedCopyWithImpl<$Res> extends _$RoomsEventCopyWithImpl<$Res>
    implements $RoomsListOpenedCopyWith<$Res> {
  _$RoomsListOpenedCopyWithImpl(
      RoomsListOpened _value, $Res Function(RoomsListOpened) _then)
      : super(_value, (v) => _then(v as RoomsListOpened));

  @override
  RoomsListOpened get _value => super._value as RoomsListOpened;
}

/// @nodoc

class _$RoomsListOpened implements RoomsListOpened {
  const _$RoomsListOpened();

  @override
  String toString() {
    return 'RoomsEvent.roomsListOpened()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RoomsListOpened);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() roomsListOpened,
  }) {
    return roomsListOpened();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? roomsListOpened,
  }) {
    return roomsListOpened?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? roomsListOpened,
    required TResult orElse(),
  }) {
    if (roomsListOpened != null) {
      return roomsListOpened();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoomsListOpened value) roomsListOpened,
  }) {
    return roomsListOpened(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoomsListOpened value)? roomsListOpened,
  }) {
    return roomsListOpened?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomsListOpened value)? roomsListOpened,
    required TResult orElse(),
  }) {
    if (roomsListOpened != null) {
      return roomsListOpened(this);
    }
    return orElse();
  }
}

abstract class RoomsListOpened implements RoomsEvent {
  const factory RoomsListOpened() = _$RoomsListOpened;
}
