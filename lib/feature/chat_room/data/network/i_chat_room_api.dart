abstract class IChatRoomApi {
  void sendMessage({required String room, required String text});
  void dispose();
}
