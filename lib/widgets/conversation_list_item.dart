import 'package:flutter/material.dart';
import 'package:flutter_chat_app_ui/constants/strings.dart';
import 'package:flutter_chat_app_ui/models/chat_users_model.dart';
import 'package:flutter_chat_app_ui/screens/chat_detail_page.dart';

class ConversationListItem extends StatefulWidget {
  final bool isMessageRead;
  final ChatUser chatUser;

  ConversationListItem(
      {
        @required this.chatUser,
      @required this.isMessageRead});

  @override
  _ConversationListItemState createState() => _ConversationListItemState();
}

class _ConversationListItemState extends State<ConversationListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => ChatDetailPage(chatUser: widget.chatUser,)));
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Row(
            children: [
              Expanded(
                  child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        randomUserBaseUrl + widget.chatUser.imageUrl),
                    maxRadius: 30,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Container(
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.chatUser.name,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          widget.chatUser.messageText,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                              fontWeight: widget.isMessageRead
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                      ],
                    ),
                  ))
                ],
              ))
            ],
          ),
        ));
  }
}
