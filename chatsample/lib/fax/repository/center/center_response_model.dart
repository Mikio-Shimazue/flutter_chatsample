import 'package:intl/intl.dart';

class CenterResponseModel {
  final int maxPageNo;
  final int pageCnt;
  final int pageNo;
  final int dataCnt;

  CenterResponseModel(this.maxPageNo, this.pageCnt, this.pageNo, this.dataCnt);

  Map<String, dynamic> toJson() => {
        'max_page_no': maxPageNo,
        'page_cnt': pageCnt,
        'page_no': pageNo,
        'data_cnt': dataCnt,
      };

  CenterResponseModel.fromJson(Map<String, dynamic> json)
      : maxPageNo = json['max_page_no'],
        pageCnt = json['page_cnt'],
        pageNo = json['page_no'],
        dataCnt = json['data_cnt'];
}

class FaxReceiveList {
  final int maxPageNo;
  final int pageCnt;
  final int pageNo;
  final int dataCnt;
  final roles;
  final receiveItems;

  FaxReceiveList(this.maxPageNo, this.pageCnt, this.pageNo, this.dataCnt,
      this.roles, this.receiveItems);

  Map<String, dynamic> toJson() {
    return {
      "max_page_no": maxPageNo,
      "page_cnt": pageCnt,
      "page_no": pageNo,
      "data_cnt": dataCnt,
      "roles": roles,
      "body": receiveItems
    };
  }

  FaxReceiveList.fromJson(Map<String, dynamic> json)
      : maxPageNo = json["max_page_no"] ?? "",
        pageCnt = json["page_cnt"] ?? "",
        pageNo = json["page_no"] ?? "",
        dataCnt = json["data_cnt"] ?? "",
        roles = json["roles"] ?? "",
        receiveItems =
            json["body"].map((i) => new FaxReceiveItem.fromJson(i)).toList();
}

class FaxReceiveRoles {
  String st;
  bool isBtnSel;

  FaxReceiveRoles(this.st, this.isBtnSel);

  Map<String, dynamic> toJson() {
    return {
      "st": st,
      "is_btn_sel": isBtnSel,
    };
  }

  FaxReceiveRoles.fromJson(Map<String, dynamic> json)
      : st = json["st"] ?? "",
        isBtnSel = json["is_btn_sel"] ?? "";
}

class FaxReceiveItem {
  bool isBtnSel;
  int receiveFaxLogID;
  DateTime receiveDate;
  String srcTel;
  String dstTel;

  FaxReceiveItem(this.isBtnSel, this.receiveFaxLogID, this.receiveDate,
      this.srcTel, this.dstTel);

  Map<String, dynamic> toJso() {
    return {
      "is_btn_sel": isBtnSel,
      "receive_fax_log_id": receiveFaxLogID,
      "receive_date": receiveDate.toString(),
      "src_tel": srcTel,
      "dst_tel": dstTel
    };
  }

  FaxReceiveItem.fromJson(Map<String, dynamic> json)
      : isBtnSel = json["is_btn_sel"],
        receiveFaxLogID = json["receive_fax_log_id"],
        receiveDate = DateFormat("yyyy/MM/dd hh:mm:ss")
            .parse(json["receive_date"] ?? "0000/01/01 00:00:00"),
        srcTel = json["src_tel"] ?? "",
        dstTel = json["dst_tel"] ?? "";
}
