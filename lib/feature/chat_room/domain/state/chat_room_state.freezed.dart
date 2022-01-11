// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_room_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChatRoomStateTearOff {
  const _$ChatRoomStateTearOff();

  ChatRoomLoading loading() {
    return const ChatRoomLoading();
  }

  ChatRoomSuccess success({required List<Message> messages}) {
    return ChatRoomSuccess(
      messages: messages,
    );
  }

  ChatRoomFailure failure() {
    return const ChatRoomFailure();
  }
}

/// @nodoc
const $ChatRoomState = _$ChatRoomStateTearOff();

/// @nodoc
mixin _$ChatRoomState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Message> messages) success,
    required TResult Function() failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Message> messages)? success,
    TResult Function()? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Message> messages)? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatRoomLoading value) loading,
    required TResult Function(ChatRoomSuccess value) success,
    required TResult Function(ChatRoomFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChatRoomLoading value)? loading,
    TResult Function(ChatRoomSuccess value)? success,
    TResult Function(ChatRoomFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomLoading value)? loading,
    TResult Function(ChatRoomSuccess value)? success,
    TResult Function(ChatRoomFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomStateCopyWith<$Res> {
  factory $ChatRoomStateCopyWith(
          ChatRoomState value, $Res Function(ChatRoomState) then) =
      _$ChatRoomStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChatRoomStateCopyWithImpl<$Res>
    implements $ChatRoomStateCopyWith<$Res> {
  _$ChatRoomStateCopyWithImpl(this._value, this._then);

  final ChatRoomState _value;
  // ignore: unused_field
  final $Res Function(ChatRoomState) _then;
}

/// @nodoc
abstract class $ChatRoomLoadingCopyWith<$Res> {
  factory $ChatRoomLoadingCopyWith(
          ChatRoomLoading value, $Res Function(ChatRoomLoading) then) =
      _$ChatRoomLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChatRoomLoadingCopyWithImpl<$Res>
    extends _$ChatRoomStateCopyWithImpl<$Res>
    implements $ChatRoomLoadingCopyWith<$Res> {
  _$ChatRoomLoadingCopyWithImpl(
      ChatRoomLoading _value, $Res Function(ChatRoomLoading) _then)
      : super(_value, (v) => _then(v as ChatRoomLoading));

  @override
  ChatRoomLoading get _value => super._value as ChatRoomLoading;
}

/// @nodoc

class _$ChatRoomLoading implements ChatRoomLoading {
  const _$ChatRoomLoading();

  @override
  String toString() {
    return 'ChatRoomState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChatRoomLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Message> messages) success,
    required TResult Function() failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Message> messages)? success,
    TResult Function()? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Message> messages)? success,
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
    required TResult Function(ChatRoomLoading value) loading,
    required TResult Function(ChatRoomSuccess value) success,
    required TResult Function(ChatRoomFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChatRoomLoading value)? loading,
    TResult Function(ChatRoomSuccess value)? success,
    TResult Function(ChatRoomFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomLoading value)? loading,
    TResult Function(ChatRoomSuccess value)? success,
    TResult Function(ChatRoomFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ChatRoomLoading implements ChatRoomState {
  const factory ChatRoomLoading() = _$ChatRoomLoading;
}

/// @nodoc
abstract class $ChatRoomSuccessCopyWith<$Res> {
  factory $ChatRoomSuccessCopyWith(
          ChatRoomSuccess value, $Res Function(ChatRoomSuccess) then) =
      _$ChatRoomSuccessCopyWithImpl<$Res>;
  $Res call({List<Message> messages});
}

/// @nodoc
class _$ChatRoomSuccessCopyWithImpl<$Res>
    extends _$ChatRoomStateCopyWithImpl<$Res>
    implements $ChatRoomSuccessCopyWith<$Res> {
  _$ChatRoomSuccessCopyWithImpl(
      ChatRoomSuccess _value, $Res Function(ChatRoomSuccess) _then)
      : super(_value, (v) => _then(v as ChatRoomSuccess));

  @override
  ChatRoomSuccess get _value => super._value as ChatRoomSuccess;

  @override
  $Res call({
    Object? messages = freezed,
  }) {
    return _then(ChatRoomSuccess(
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc

class _$ChatRoomSuccess implements ChatRoomSuccess {
  const _$ChatRoomSuccess({required this.messages});

  @override
  final List<Message> messages;

  @override
  String toString() {
    return 'ChatRoomState.success(messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatRoomSuccess &&
            const DeepCollectionEquality().equals(other.messages, messages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(messages));

  @JsonKey(ignore: true)
  @override
  $ChatRoomSuccessCopyWith<ChatRoomSuccess> get copyWith =>
      _$ChatRoomSuccessCopyWithImpl<ChatRoomSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Message> messages) success,
    required TResult Function() failure,
  }) {
    return success(messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Message> messages)? success,
    TResult Function()? failure,
  }) {
    return success?.call(messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Message> messages)? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatRoomLoading value) loading,
    required TResult Function(ChatRoomSuccess value) success,
    required TResult Function(ChatRoomFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChatRoomLoading value)? loading,
    TResult Function(ChatRoomSuccess value)? success,
    TResult Function(ChatRoomFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomLoading value)? loading,
    TResult Function(ChatRoomSuccess value)? success,
    TResult Function(ChatRoomFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ChatRoomSuccess implements ChatRoomState {
  const factory ChatRoomSuccess({required List<Message> messages}) =
      _$ChatRoomSuccess;

  List<Message> get messages;
  @JsonKey(ignore: true)
  $ChatRoomSuccessCopyWith<ChatRoomSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomFailureCopyWith<$Res> {
  factory $ChatRoomFailureCopyWith(
          ChatRoomFailure value, $Res Function(ChatRoomFailure) then) =
      _$ChatRoomFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChatRoomFailureCopyWithImpl<$Res>
    extends _$ChatRoomStateCopyWithImpl<$Res>
    implements $ChatRoomFailureCopyWith<$Res> {
  _$ChatRoomFailureCopyWithImpl(
      ChatRoomFailure _value, $Res Function(ChatRoomFailure) _then)
      : super(_value, (v) => _then(v as ChatRoomFailure));

  @override
  ChatRoomFailure get _value => super._value as ChatRoomFailure;
}

/// @nodoc

class _$ChatRoomFailure implements ChatRoomFailure {
  const _$ChatRoomFailure();

  @override
  String toString() {
    return 'ChatRoomState.failure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChatRoomFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Message> messages) success,
    required TResult Function() failure,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Message> messages)? success,
    TResult Function()? failure,
  }) {
    return failure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Message> messages)? success,
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
    required TResult Function(ChatRoomLoading value) loading,
    required TResult Function(ChatRoomSuccess value) success,
    required TResult Function(ChatRoomFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChatRoomLoading value)? loading,
    TResult Function(ChatRoomSuccess value)? success,
    TResult Function(ChatRoomFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomLoading value)? loading,
    TResult Function(ChatRoomSuccess value)? success,
    TResult Function(ChatRoomFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class ChatRoomFailure implements ChatRoomState {
  const factory ChatRoomFailure() = _$ChatRoomFailure;
}
