import 'package:chat_application_iub_cse464/const_config/color_config.dart';
import 'package:chat_application_iub_cse464/const_config/text_config.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatefulWidget {
  final Color color;
  final bool isOwner;
  final String userName;

  const ChatBubble({Key? key, required this.color, required this.isOwner, required this.userName}) : super(key: key);
  // const ChatBubble({super.key, required this.color, required bool isOwner});

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  get isOwner => null;

  String get message => 'Hello';

  @override
  Widget build(BuildContext context) {
    return
      Row(
        mainAxisAlignment: widget.isOwner ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          if (!widget.isOwner)
            CircleAvatar(
              backgroundColor: Colors.grey,
              child: Text(widget.userName[0].toUpperCase()),
            ),
          Flexible(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              decoration: BoxDecoration(
                color: widget.isOwner ? MyColor.white : MyColor.primary,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                message,
                style: TextDesign().bodyTextSmall.copyWith(color: widget.isOwner ? MyColor.black : MyColor.white),
              ),
            ),
          ),
          if (widget.isOwner)
            CircleAvatar(
              backgroundColor: Colors.grey,
              child: Text(widget.userName[0].toUpperCase()),
            ),
          Material(
            alignment: isOwner ? Alignment.centerRight : Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 4,
                  bottom: 4,
                  right: isOwner? 8 : 25,
                  left: isOwner? 25 : 0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: isOwner ? MyColor.white : MyColor.primary,
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    message,
                    style: TextDesign().bodyTextSmall.copyWith(color: isOwner ? MyColor.black : MyColor.white),
                  ),
                ),
              ),
          );

        ],
      );
  }
}
