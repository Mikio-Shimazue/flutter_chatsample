import 'package:http/http.dart';
import 'chat_center_response_model.dart';

class ChatCenterRepository {
  //  チャットルームリスト取得
  Future<ChatRoomList> getChatRoomList() async {
    if (true) {
      List<ChatRoomItem> list = [];
      list.add(ChatRoomItem(1, "Special", "Panda"));
      list.add(ChatRoomItem(2, "NormalRoom", "Koala"));
      return ChatRoomList(1, 1, 1, 1, list);
    }
    else {
      final Uri url = Uri.parse("https://");
      try {
        Map<String, String> headers = {"Content-Type": "application/json"};
        var requestBody = "{}";
        final response = await post(
          url,
          headers: headers,
          body: requestBody, //  body:なし -> status:500 "Internal Server Error"
        );
      } on Exception catch (e) {
        print("ChatCenterRepositorty getChatRoomList Exception:$e");
        throw Exception('Failed');
      } catch (e) {
        throw Exception('Failed');
      }
    }
  }
}
