abstract class IChatRoomRepository {
  void sendMessage({required String room, required String text});
  void initWebSocketConnection();
}
