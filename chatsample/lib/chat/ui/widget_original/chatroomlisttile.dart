import 'package:flutter/material.dart';

class ChatRoomListTile extends StatelessWidget {
  const ChatRoomListTile({
    Key? key,
    this.leading,
    required this.title,
    this.subtitle,
    this.detailInfo,
    this.trailing1,
    this.trailing2,
    this.height,
    this.onTap,
  }) : super(key: key);

  final Widget? leading;
  final Text title;
  final Text? subtitle;
  final Text? detailInfo;
  final Widget? trailing1;
  final Widget? trailing2;
  final double? height;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final _subtitle = subtitle ?? const SizedBox.shrink();
    final _height = height ?? 80.0;

    Widget _leading;
    if (null != leading) {
      _leading = Container(
        alignment: Alignment.center,
        width: 40,
        child: leading,
      );
    } else {
      _leading = const SizedBox.shrink();
    }
    Widget _detailInfo;
    if (null != detailInfo) {
      _detailInfo = Expanded(
        child: Container(
          alignment: Alignment.center,
          child: detailInfo,
        ),
      );
    } else {
      _detailInfo = const SizedBox.shrink();
    }
    Widget _trailing1;
    if (null != trailing1) {
      _trailing1 = Container(
        alignment: Alignment.center,
        width: 40,
        child: trailing1,
      );
    } else {
      _trailing1 = const SizedBox.shrink();
    }
    Widget _trailing2;
    if (null != trailing2) {
      _trailing2 = Container(
        alignment: Alignment.topRight,
        width: 30,
        child: trailing2,
      );
    } else {
      _trailing2 = const SizedBox.shrink();
    }

    return InkWell(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: _height),
        child: Container(
          height: _height,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.black12),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: Row(
              children: [
                _leading,
                Container(
                  alignment:  Alignment.topCenter,
                  width: 30,
                  child: title,
                ),
                const SizedBox(
                  width: 10,
                ),
                _subtitle,
                _detailInfo,
                _trailing1,
                _trailing2,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
