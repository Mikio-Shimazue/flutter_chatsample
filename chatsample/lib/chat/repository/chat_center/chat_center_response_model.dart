class ChatCenterResponseModel {
  final int maxPageNo;
  final int pageCnt;
  final int pageNo;
  final int dataCnt;

  ChatCenterResponseModel(
      this.maxPageNo, this.pageCnt, this.pageNo, this.dataCnt);

  Map<String, dynamic> toJson() => {
        'max_page_no': maxPageNo,
        'page_cnt': pageCnt,
        'page_no': pageNo,
        'data_cnt': dataCnt,
      };

  ChatCenterResponseModel.fromJson(Map<String, dynamic> json)
      : maxPageNo = json['max_page_no'],
        pageCnt = json['page_cnt'],
        pageNo = json['page_no'],
        dataCnt = json['data_cnt'];
}

class ChatRoomList {
  final int maxPageNo;
  final int pageCnt;
  final int pageNo;
  final int dataCnt;
  final chatRoomLists;

  ChatRoomList(this.maxPageNo, this.pageCnt, this.pageNo, this.dataCnt,
      this.chatRoomLists);

  Map<String, dynamic> toJson() {
    return {
      'max_page_no': maxPageNo,
      'page_cnt': pageCnt,
      'page_no': pageNo,
      'data_cnt': dataCnt,
      'body': chatRoomLists,
    };
  }

  ChatRoomList.fromJson(Map<String, dynamic> json)
      : pageCnt = json['page_cnt'] ?? '',
        maxPageNo = json['max_page_no'] ?? '',
        pageNo = json['page_no'] ?? '',
        dataCnt = json['data_cnt'] ?? '',
        chatRoomLists =
            json['body'].map((i) => new ChatRoomItem.fromJson(i)).toList();
}

class ChatRoomItem {
  int roomId;
  String roomType;
  String roomName;

  ChatRoomItem(this.roomId, this.roomType, this.roomName);

  Map<String, dynamic> toJson() {
    return {'room_id': roomId, 'room_type': roomType, 'room_name': roomName};
  }

  ChatRoomItem.fromJson(Map<String, dynamic> json)
      : roomId = json['room_id'],
        roomType = json['room_type'] ?? '',
        roomName = json['room_name'] ?? '';
}
