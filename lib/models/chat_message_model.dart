import 'package:flutter/material.dart';
import 'package:flutter_chat_app_ui/constants/enums.dart';

class ChatMessage {
  String messageContent;
  MessageType messageType;

  ChatMessage({@required this.messageContent, @required this.messageType});
}