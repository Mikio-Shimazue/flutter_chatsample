import 'package:flutter/material.dart';

import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:open_file/open_file.dart';

import '../chat_expansion/chat_custombottomwidget.dart';
import 'package:flutter/services.dart';

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage(this.name, {Key? key}) : super(key: key);
  final String name;

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoomPage> {
  List<types.Message> _messages = [];
  String randomId = Uuid().v4();
  final _user = const types.User(id: '0', firstName: 'Aさん');

  bool isTextEdit = false; //  Chat　Text編集モード状態 true:編集中/false:その他
  types.Message? editMessage; //  Text編集メッセージ(isTextEdit:trueで有効)
  final chatInputFocusNode = FocusNode();
  final chatTextController = TextEditingController();

  static const chatBackGroundColor = Color(0xFFC0F1F2); //  チャットルーム画面　基本背景色
  static const atachmentFileIconColor = Color(0xFF4F4F4F); //  ファイル添付メニューアイコン色
  static const editMenuTextStyle = TextStyle(color: Color(0xFF000000));
  static const editMenuLabelSize = Size.fromHeight(80);

  //  チャットメッセージテキストスタイル
  static const chatMessageTextStyle = TextStyle(
      color: Color(0xFF000000),
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5);

  static const editItemColor = Colors.white10;

  void initState() {
    _getMessages();
    super.initState();
  }

  void _getMessages() {
    /*
    final getData = await FirebaseFirestore.instance
      .collection('chat_room')
      .doc(widget.name)
      .collection('contens')
      .get();

      final message = getData.docs
        .map((d) => types.TextMessage(
          author:types.User(id: d.data()['uid'], firstName: d.data()['name']),
          createdAt: d.data()['createAt'],
          id: d.data()['id'],
          text: d.data()['text']))
          .toList();
     */
    List<types.Message> message = [];

    setState(() {
      _messages = [...message];
    });
  }

  //  Chatメッセージ受信
  void _responseOther() {
    String str = "はい、"; //  テスト用ダミーメッセージ
    const _rewponseUser = types.User(
        id: '2',
        firstName: 'Aさん',
        imageUrl: 'https://placehold.jp/150x150.png');

    final textMessage = types.TextMessage(
      author: _rewponseUser,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomId,
      text: str,
    );

    _addMessage(textMessage);
  }

  //  チャットメッセージリストにメッセージをセット
  void _addMessage(types.Message message) async {
    setState(() {
      _messages.insert(0, message);
    });
  }

  //  チャットメッセージリストからメッセージを削除
  void _dellMessage(types.TextMessage message) {
    setState(() {
      _messages.remove(message);
    });
  }

  void _changeMessage(
      types.Message? changeMessage, types.Message message) async {
    if (null == changeMessage) return;
    setState(() {
      final index = _messages.lastIndexOf(changeMessage!);
      _messages.remove(changeMessage!);
      _messages.insert(index, message);
    });
  }

  //  リンク添付時にリンクプレビューを表示する
  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = _messages[index].copyWith();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        _messages[index] = updatedMessage;
      });
    });
  }

  //  メッセージ送信時の処理
  void _handlesendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomId,
      text: message.text,
    );

    //  ここにメッセージ送信処理を追加

    if (isTextEdit) {
      //  メッセージ編集をチャットリストへ登録
      _changeMessage(editMessage, textMessage);
      isTextEdit = false;
    } else {
      //  チャット画面にメッセージ追加
      _addMessage(textMessage);

      //  ダミー応答文表示（正規対応時は要削除)
      _responseOther();
    }

    //  入力メッセージを初期化
    chatTextController.text = '';
  }

  //  特定のメッセージを消去
  void dellMessage(BuildContext context, types.Message message) async {
    if (message is types.TextMessage) {
      _dellMessage(message);
    }
    //  ここにサーバー側メッセージ削除処理を追記！！
  }

  //  ファイルオープン
  void openFile(types.Message message) async {
    if (message is types.FileMessage) {
      await OpenFile.open(message.uri);
    }
  }

  //  テキスト入力欄メッセージ変更処理
  void onTextChange(String str) async {
    print(str);
  }

  @override
  Widget build(BuildContext context) {
    const rightTextUser = types.User(
        id: '1', firstName: '私', imageUrl: 'https://placehold.jp/150x150.png');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: chatBackGroundColor,
        title: const Text('チャットルーム名'),
      ),
      body: Chat(
        theme: const DefaultChatTheme(
          //  メッセージ入力欄色
          inputBackgroundColor: chatBackGroundColor,
          // 送信ボタン
          sendButtonIcon: Icon(Icons.send),
          sendingIcon: Icon(Icons.update_outlined),
          deliveredIcon: Icon(Icons.send),
          //  右側メッセージテキストスタイル
          sentMessageBodyTextStyle: chatMessageTextStyle,
          receivedMessageBodyTextStyle: chatMessageTextStyle,
          //  チャット右側吹出し背景色
          primaryColor: Color.fromARGB(255, 136, 229, 153),
          //  チャット左側吹出し背景色
          secondaryColor: Color.fromARGB(255, 234, 188, 188),
          attachmentButtonIcon: Icon(Icons.add),
          //  Message Input Tab leftSide
          inputTextColor: Color(0xFF000000), //  入力文字色
        ),
        //  ユーザーの名前を表示するかどうか
        showUserNames: true,
        //  メッセージの配列
        messages: _messages,
        onMessageTap: _handleOnMessageTap,
        onMessageLongPress: _handleOnMessageLongPress,
        onPreviewDataFetched: _handlePreviewDataFetched,
        onSendPressed: _handlesendPressed,
        // isTextMessageTextSelectable: true,
        //  ユーザーアイコン表示
        showUserAvatars: true,
        //  チャット画面右側表示するユーザー
        user: rightTextUser,
        l10n: const ChatL10nJa(),
        customBottomWidget: ChatCustomBottomWidget(
          isAttachmentUploading: false,
          onAttachmentPressed: _handleAtachmentPressed,
          onSendPressed: _handlesendPressed,
          sendButtonVisibilityMode: SendButtonVisibilityMode.editing,
          chatInputFocusNode: chatInputFocusNode,
          chatTextController: chatTextController,
        ),
      ),
    );
  }

  void _handleOnTap() {
    print('_handleOnTap');
  }

  //  メッセージタップ時処理
  void _handleOnMessageTap(BuildContext context, types.Message message) async {
    //  ファイルの場合ファイルをオープン
    if (message is types.FileMessage) {
      openFile(message);
    }
  }

  //  メッセージ長押し時、メッセージ編集ダイアログを表示
  void _handleOnMessageLongPress(
      BuildContext context, types.Message message) async {
    // ユーザー入力メッセージの場合
    if (message.author == _user) {}
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: chatBackGroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                // 上部Padding
                height: 40,
              ),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  _handleMessageEddting(message);
                },
                style: OutlinedButton.styleFrom(fixedSize: editMenuLabelSize),
                icon: const Icon(
                  Icons.print,
                  color: Color(0xFF000000),
                ),
                label: const Align(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    '編集',
                    style: editMenuTextStyle,
                  ),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  if (message is types.TextMessage) {
                    // クリップボードにメッセージを登録
                    final data = ClipboardData(text: message.text);
                    Clipboard.setData(data);
                  }
                },
                style: OutlinedButton.styleFrom(fixedSize: editMenuLabelSize),
                icon: const Icon(
                  Icons.copy,
                  color: Color(0xFF000000),
                ),
                label: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'コピー',
                    style: editMenuTextStyle,
                  ),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  //メッセージを削除
                  dellMessage(context, message);
                },
                style: OutlinedButton.styleFrom(fixedSize: editMenuLabelSize),
                icon: const Icon(
                  Icons.delete,
                  color: Color(0xFF000000),
                ),
                label: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    '削除',
                    style: editMenuTextStyle,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  //  添付ファイル追加Widget
  void _handleAtachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: chatBackGroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: 64,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Icon(
                    Icons.close,
                    color: atachmentFileIconColor,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleImageSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Icon(
                    Icons.add_photo_alternate,
                    color: atachmentFileIconColor,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleFileSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Icon(
                    Icons.insert_drive_file_outlined,
                    color: atachmentFileIconColor,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );

      //  ここにサーバーへの処理追記

      _addMessage(message);
    }
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );
    }
  }

  //  メッセージ編集
  void _handleMessageEddting(types.Message message) async {
    if (message is types.TextMessage) {
      isTextEdit = true;
      editMessage = message.copyWith();
      chatTextController.text = message.text;
      FocusScope.of(context).requestFocus(chatInputFocusNode);
    }
  }
}

/// Japanese l10n which extends [ChatL10n]
@immutable
class ChatL10nJa extends ChatL10n {
  /// Creates Japanese l10n. Use this constructor if you want to
  /// override only a couple of properties, otherwise create a new class
  /// which extends [ChatL10n]
  const ChatL10nJa({
    String attachmentButtonAccessibilityLabel = 'メディアファイル送信',
    String emptyChatPlaceholder = 'まだメッセージがありません',
    String fileButtonAccessibilityLabel = 'ファイル',
    String inputPlaceholder = 'メッセージ',
    String sendButtonAccessibilityLabel = '送信',
  }) : super(
          and: attachmentButtonAccessibilityLabel,
          attachmentButtonAccessibilityLabel:
              attachmentButtonAccessibilityLabel,
          emptyChatPlaceholder: emptyChatPlaceholder,
          fileButtonAccessibilityLabel: fileButtonAccessibilityLabel,
          inputPlaceholder: inputPlaceholder,
          isTyping: '',
          others: '',
          sendButtonAccessibilityLabel: sendButtonAccessibilityLabel,
          unreadMessagesLabel: '',
        );
}
