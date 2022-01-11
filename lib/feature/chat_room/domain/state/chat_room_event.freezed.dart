// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_room_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChatRoomEventTearOff {
  const _$ChatRoomEventTearOff();

  ChatRoomOpened chatRoomOpened(
      {required String room, required bool isNewRoom}) {
    return ChatRoomOpened(
      room: room,
      isNewRoom: isNewRoom,
    );
  }

  ChatRoomMessageFetched messageFetched({required Message message}) {
    return ChatRoomMessageFetched(
      message: message,
    );
  }

  ChatRoomMessageSended messageSended(
      {required String room, required String text}) {
    return ChatRoomMessageSended(
      room: room,
      text: text,
    );
  }
}

/// @nodoc
const $ChatRoomEvent = _$ChatRoomEventTearOff();

/// @nodoc
mixin _$ChatRoomEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String room, bool isNewRoom) chatRoomOpened,
    required TResult Function(Message message) messageFetched,
    required TResult Function(String room, String text) messageSended,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String room, bool isNewRoom)? chatRoomOpened,
    TResult Function(Message message)? messageFetched,
    TResult Function(String room, String text)? messageSended,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String room, bool isNewRoom)? chatRoomOpened,
    TResult Function(Message message)? messageFetched,
    TResult Function(String room, String text)? messageSended,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatRoomOpened value) chatRoomOpened,
    required TResult Function(ChatRoomMessageFetched value) messageFetched,
    required TResult Function(ChatRoomMessageSended value) messageSended,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChatRoomOpened value)? chatRoomOpened,
    TResult Function(ChatRoomMessageFetched value)? messageFetched,
    TResult Function(ChatRoomMessageSended value)? messageSended,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomOpened value)? chatRoomOpened,
    TResult Function(ChatRoomMessageFetched value)? messageFetched,
    TResult Function(ChatRoomMessageSended value)? messageSended,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomEventCopyWith<$Res> {
  factory $ChatRoomEventCopyWith(
          ChatRoomEvent value, $Res Function(ChatRoomEvent) then) =
      _$ChatRoomEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChatRoomEventCopyWithImpl<$Res>
    implements $ChatRoomEventCopyWith<$Res> {
  _$ChatRoomEventCopyWithImpl(this._value, this._then);

  final ChatRoomEvent _value;
  // ignore: unused_field
  final $Res Function(ChatRoomEvent) _then;
}

/// @nodoc
abstract class $ChatRoomOpenedCopyWith<$Res> {
  factory $ChatRoomOpenedCopyWith(
          ChatRoomOpened value, $Res Function(ChatRoomOpened) then) =
      _$ChatRoomOpenedCopyWithImpl<$Res>;
  $Res call({String room, bool isNewRoom});
}

/// @nodoc
class _$ChatRoomOpenedCopyWithImpl<$Res>
    extends _$ChatRoomEventCopyWithImpl<$Res>
    implements $ChatRoomOpenedCopyWith<$Res> {
  _$ChatRoomOpenedCopyWithImpl(
      ChatRoomOpened _value, $Res Function(ChatRoomOpened) _then)
      : super(_value, (v) => _then(v as ChatRoomOpened));

  @override
  ChatRoomOpened get _value => super._value as ChatRoomOpened;

  @override
  $Res call({
    Object? room = freezed,
    Object? isNewRoom = freezed,
  }) {
    return _then(ChatRoomOpened(
      room: room == freezed
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as String,
      isNewRoom: isNewRoom == freezed
          ? _value.isNewRoom
          : isNewRoom // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChatRoomOpened implements ChatRoomOpened {
  const _$ChatRoomOpened({required this.room, required this.isNewRoom});

  @override
  final String room;
  @override
  final bool isNewRoom;

  @override
  String toString() {
    return 'ChatRoomEvent.chatRoomOpened(room: $room, isNewRoom: $isNewRoom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatRoomOpened &&
            const DeepCollectionEquality().equals(other.room, room) &&
            const DeepCollectionEquality().equals(other.isNewRoom, isNewRoom));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(room),
      const DeepCollectionEquality().hash(isNewRoom));

  @JsonKey(ignore: true)
  @override
  $ChatRoomOpenedCopyWith<ChatRoomOpened> get copyWith =>
      _$ChatRoomOpenedCopyWithImpl<ChatRoomOpened>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String room, bool isNewRoom) chatRoomOpened,
    required TResult Function(Message message) messageFetched,
    required TResult Function(String room, String text) messageSended,
  }) {
    return chatRoomOpened(room, isNewRoom);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String room, bool isNewRoom)? chatRoomOpened,
    TResult Function(Message message)? messageFetched,
    TResult Function(String room, String text)? messageSended,
  }) {
    return chatRoomOpened?.call(room, isNewRoom);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String room, bool isNewRoom)? chatRoomOpened,
    TResult Function(Message message)? messageFetched,
    TResult Function(String room, String text)? messageSended,
    required TResult orElse(),
  }) {
    if (chatRoomOpened != null) {
      return chatRoomOpened(room, isNewRoom);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatRoomOpened value) chatRoomOpened,
    required TResult Function(ChatRoomMessageFetched value) messageFetched,
    required TResult Function(ChatRoomMessageSended value) messageSended,
  }) {
    return chatRoomOpened(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChatRoomOpened value)? chatRoomOpened,
    TResult Function(ChatRoomMessageFetched value)? messageFetched,
    TResult Function(ChatRoomMessageSended value)? messageSended,
  }) {
    return chatRoomOpened?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomOpened value)? chatRoomOpened,
    TResult Function(ChatRoomMessageFetched value)? messageFetched,
    TResult Function(ChatRoomMessageSended value)? messageSended,
    required TResult orElse(),
  }) {
    if (chatRoomOpened != null) {
      return chatRoomOpened(this);
    }
    return orElse();
  }
}

abstract class ChatRoomOpened implements ChatRoomEvent {
  const factory ChatRoomOpened(
      {required String room, required bool isNewRoom}) = _$ChatRoomOpened;

  String get room;
  bool get isNewRoom;
  @JsonKey(ignore: true)
  $ChatRoomOpenedCopyWith<ChatRoomOpened> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomMessageFetchedCopyWith<$Res> {
  factory $ChatRoomMessageFetchedCopyWith(ChatRoomMessageFetched value,
          $Res Function(ChatRoomMessageFetched) then) =
      _$ChatRoomMessageFetchedCopyWithImpl<$Res>;
  $Res call({Message message});
}

/// @nodoc
class _$ChatRoomMessageFetchedCopyWithImpl<$Res>
    extends _$ChatRoomEventCopyWithImpl<$Res>
    implements $ChatRoomMessageFetchedCopyWith<$Res> {
  _$ChatRoomMessageFetchedCopyWithImpl(ChatRoomMessageFetched _value,
      $Res Function(ChatRoomMessageFetched) _then)
      : super(_value, (v) => _then(v as ChatRoomMessageFetched));

  @override
  ChatRoomMessageFetched get _value => super._value as ChatRoomMessageFetched;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(ChatRoomMessageFetched(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message,
    ));
  }
}

/// @nodoc

class _$ChatRoomMessageFetched implements ChatRoomMessageFetched {
  const _$ChatRoomMessageFetched({required this.message});

  @override
  final Message message;

  @override
  String toString() {
    return 'ChatRoomEvent.messageFetched(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatRoomMessageFetched &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $ChatRoomMessageFetchedCopyWith<ChatRoomMessageFetched> get copyWith =>
      _$ChatRoomMessageFetchedCopyWithImpl<ChatRoomMessageFetched>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String room, bool isNewRoom) chatRoomOpened,
    required TResult Function(Message message) messageFetched,
    required TResult Function(String room, String text) messageSended,
  }) {
    return messageFetched(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String room, bool isNewRoom)? chatRoomOpened,
    TResult Function(Message message)? messageFetched,
    TResult Function(String room, String text)? messageSended,
  }) {
    return messageFetched?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String room, bool isNewRoom)? chatRoomOpened,
    TResult Function(Message message)? messageFetched,
    TResult Function(String room, String text)? messageSended,
    required TResult orElse(),
  }) {
    if (messageFetched != null) {
      return messageFetched(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatRoomOpened value) chatRoomOpened,
    required TResult Function(ChatRoomMessageFetched value) messageFetched,
    required TResult Function(ChatRoomMessageSended value) messageSended,
  }) {
    return messageFetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChatRoomOpened value)? chatRoomOpened,
    TResult Function(ChatRoomMessageFetched value)? messageFetched,
    TResult Function(ChatRoomMessageSended value)? messageSended,
  }) {
    return messageFetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomOpened value)? chatRoomOpened,
    TResult Function(ChatRoomMessageFetched value)? messageFetched,
    TResult Function(ChatRoomMessageSended value)? messageSended,
    required TResult orElse(),
  }) {
    if (messageFetched != null) {
      return messageFetched(this);
    }
    return orElse();
  }
}

abstract class ChatRoomMessageFetched implements ChatRoomEvent {
  const factory ChatRoomMessageFetched({required Message message}) =
      _$ChatRoomMessageFetched;

  Message get message;
  @JsonKey(ignore: true)
  $ChatRoomMessageFetchedCopyWith<ChatRoomMessageFetched> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomMessageSendedCopyWith<$Res> {
  factory $ChatRoomMessageSendedCopyWith(ChatRoomMessageSended value,
          $Res Function(ChatRoomMessageSended) then) =
      _$ChatRoomMessageSendedCopyWithImpl<$Res>;
  $Res call({String room, String text});
}

/// @nodoc
class _$ChatRoomMessageSendedCopyWithImpl<$Res>
    extends _$ChatRoomEventCopyWithImpl<$Res>
    implements $ChatRoomMessageSendedCopyWith<$Res> {
  _$ChatRoomMessageSendedCopyWithImpl(
      ChatRoomMessageSended _value, $Res Function(ChatRoomMessageSended) _then)
      : super(_value, (v) => _then(v as ChatRoomMessageSended));

  @override
  ChatRoomMessageSended get _value => super._value as ChatRoomMessageSended;

  @override
  $Res call({
    Object? room = freezed,
    Object? text = freezed,
  }) {
    return _then(ChatRoomMessageSended(
      room: room == freezed
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChatRoomMessageSended implements ChatRoomMessageSended {
  const _$ChatRoomMessageSended({required this.room, required this.text});

  @override
  final String room;
  @override
  final String text;

  @override
  String toString() {
    return 'ChatRoomEvent.messageSended(room: $room, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatRoomMessageSended &&
            const DeepCollectionEquality().equals(other.room, room) &&
            const DeepCollectionEquality().equals(other.text, text));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(room),
      const DeepCollectionEquality().hash(text));

  @JsonKey(ignore: true)
  @override
  $ChatRoomMessageSendedCopyWith<ChatRoomMessageSended> get copyWith =>
      _$ChatRoomMessageSendedCopyWithImpl<ChatRoomMessageSended>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String room, bool isNewRoom) chatRoomOpened,
    required TResult Function(Message message) messageFetched,
    required TResult Function(String room, String text) messageSended,
  }) {
    return messageSended(room, text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String room, bool isNewRoom)? chatRoomOpened,
    TResult Function(Message message)? messageFetched,
    TResult Function(String room, String text)? messageSended,
  }) {
    return messageSended?.call(room, text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String room, bool isNewRoom)? chatRoomOpened,
    TResult Function(Message message)? messageFetched,
    TResult Function(String room, String text)? messageSended,
    required TResult orElse(),
  }) {
    if (messageSended != null) {
      return messageSended(room, text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatRoomOpened value) chatRoomOpened,
    required TResult Function(ChatRoomMessageFetched value) messageFetched,
    required TResult Function(ChatRoomMessageSended value) messageSended,
  }) {
    return messageSended(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChatRoomOpened value)? chatRoomOpened,
    TResult Function(ChatRoomMessageFetched value)? messageFetched,
    TResult Function(ChatRoomMessageSended value)? messageSended,
  }) {
    return messageSended?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomOpened value)? chatRoomOpened,
    TResult Function(ChatRoomMessageFetched value)? messageFetched,
    TResult Function(ChatRoomMessageSended value)? messageSended,
    required TResult orElse(),
  }) {
    if (messageSended != null) {
      return messageSended(this);
    }
    return orElse();
  }
}

abstract class ChatRoomMessageSended implements ChatRoomEvent {
  const factory ChatRoomMessageSended(
      {required String room, required String text}) = _$ChatRoomMessageSended;

  String get room;
  String get text;
  @JsonKey(ignore: true)
  $ChatRoomMessageSendedCopyWith<ChatRoomMessageSended> get copyWith =>
      throw _privateConstructorUsedError;
}
