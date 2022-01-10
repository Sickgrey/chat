// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rooms_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RoomsStateTearOff {
  const _$RoomsStateTearOff();

  RoomsLoading loading() {
    return const RoomsLoading();
  }

  RoomssSuccess success({required List<Room> rooms}) {
    return RoomssSuccess(
      rooms: rooms,
    );
  }

  RoomsFailure failure() {
    return const RoomsFailure();
  }
}

/// @nodoc
const $RoomsState = _$RoomsStateTearOff();

/// @nodoc
mixin _$RoomsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Room> rooms) success,
    required TResult Function() failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Room> rooms)? success,
    TResult Function()? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Room> rooms)? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoomsLoading value) loading,
    required TResult Function(RoomssSuccess value) success,
    required TResult Function(RoomsFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoomsLoading value)? loading,
    TResult Function(RoomssSuccess value)? success,
    TResult Function(RoomsFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomsLoading value)? loading,
    TResult Function(RoomssSuccess value)? success,
    TResult Function(RoomsFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomsStateCopyWith<$Res> {
  factory $RoomsStateCopyWith(
          RoomsState value, $Res Function(RoomsState) then) =
      _$RoomsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$RoomsStateCopyWithImpl<$Res> implements $RoomsStateCopyWith<$Res> {
  _$RoomsStateCopyWithImpl(this._value, this._then);

  final RoomsState _value;
  // ignore: unused_field
  final $Res Function(RoomsState) _then;
}

/// @nodoc
abstract class $RoomsLoadingCopyWith<$Res> {
  factory $RoomsLoadingCopyWith(
          RoomsLoading value, $Res Function(RoomsLoading) then) =
      _$RoomsLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$RoomsLoadingCopyWithImpl<$Res> extends _$RoomsStateCopyWithImpl<$Res>
    implements $RoomsLoadingCopyWith<$Res> {
  _$RoomsLoadingCopyWithImpl(
      RoomsLoading _value, $Res Function(RoomsLoading) _then)
      : super(_value, (v) => _then(v as RoomsLoading));

  @override
  RoomsLoading get _value => super._value as RoomsLoading;
}

/// @nodoc

class _$RoomsLoading implements RoomsLoading {
  const _$RoomsLoading();

  @override
  String toString() {
    return 'RoomsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RoomsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Room> rooms) success,
    required TResult Function() failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Room> rooms)? success,
    TResult Function()? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Room> rooms)? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoomsLoading value) loading,
    required TResult Function(RoomssSuccess value) success,
    required TResult Function(RoomsFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoomsLoading value)? loading,
    TResult Function(RoomssSuccess value)? success,
    TResult Function(RoomsFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomsLoading value)? loading,
    TResult Function(RoomssSuccess value)? success,
    TResult Function(RoomsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RoomsLoading implements RoomsState {
  const factory RoomsLoading() = _$RoomsLoading;
}

/// @nodoc
abstract class $RoomssSuccessCopyWith<$Res> {
  factory $RoomssSuccessCopyWith(
          RoomssSuccess value, $Res Function(RoomssSuccess) then) =
      _$RoomssSuccessCopyWithImpl<$Res>;
  $Res call({List<Room> rooms});
}

/// @nodoc
class _$RoomssSuccessCopyWithImpl<$Res> extends _$RoomsStateCopyWithImpl<$Res>
    implements $RoomssSuccessCopyWith<$Res> {
  _$RoomssSuccessCopyWithImpl(
      RoomssSuccess _value, $Res Function(RoomssSuccess) _then)
      : super(_value, (v) => _then(v as RoomssSuccess));

  @override
  RoomssSuccess get _value => super._value as RoomssSuccess;

  @override
  $Res call({
    Object? rooms = freezed,
  }) {
    return _then(RoomssSuccess(
      rooms: rooms == freezed
          ? _value.rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<Room>,
    ));
  }
}

/// @nodoc

class _$RoomssSuccess implements RoomssSuccess {
  const _$RoomssSuccess({required this.rooms});

  @override
  final List<Room> rooms;

  @override
  String toString() {
    return 'RoomsState.success(rooms: $rooms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RoomssSuccess &&
            const DeepCollectionEquality().equals(other.rooms, rooms));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(rooms));

  @JsonKey(ignore: true)
  @override
  $RoomssSuccessCopyWith<RoomssSuccess> get copyWith =>
      _$RoomssSuccessCopyWithImpl<RoomssSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Room> rooms) success,
    required TResult Function() failure,
  }) {
    return success(rooms);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Room> rooms)? success,
    TResult Function()? failure,
  }) {
    return success?.call(rooms);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Room> rooms)? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(rooms);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoomsLoading value) loading,
    required TResult Function(RoomssSuccess value) success,
    required TResult Function(RoomsFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoomsLoading value)? loading,
    TResult Function(RoomssSuccess value)? success,
    TResult Function(RoomsFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomsLoading value)? loading,
    TResult Function(RoomssSuccess value)? success,
    TResult Function(RoomsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class RoomssSuccess implements RoomsState {
  const factory RoomssSuccess({required List<Room> rooms}) = _$RoomssSuccess;

  List<Room> get rooms;
  @JsonKey(ignore: true)
  $RoomssSuccessCopyWith<RoomssSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomsFailureCopyWith<$Res> {
  factory $RoomsFailureCopyWith(
          RoomsFailure value, $Res Function(RoomsFailure) then) =
      _$RoomsFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$RoomsFailureCopyWithImpl<$Res> extends _$RoomsStateCopyWithImpl<$Res>
    implements $RoomsFailureCopyWith<$Res> {
  _$RoomsFailureCopyWithImpl(
      RoomsFailure _value, $Res Function(RoomsFailure) _then)
      : super(_value, (v) => _then(v as RoomsFailure));

  @override
  RoomsFailure get _value => super._value as RoomsFailure;
}

/// @nodoc

class _$RoomsFailure implements RoomsFailure {
  const _$RoomsFailure();

  @override
  String toString() {
    return 'RoomsState.failure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RoomsFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Room> rooms) success,
    required TResult Function() failure,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Room> rooms)? success,
    TResult Function()? failure,
  }) {
    return failure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Room> rooms)? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoomsLoading value) loading,
    required TResult Function(RoomssSuccess value) success,
    required TResult Function(RoomsFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoomsLoading value)? loading,
    TResult Function(RoomssSuccess value)? success,
    TResult Function(RoomsFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomsLoading value)? loading,
    TResult Function(RoomssSuccess value)? success,
    TResult Function(RoomsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class RoomsFailure implements RoomsState {
  const factory RoomsFailure() = _$RoomsFailure;
}
