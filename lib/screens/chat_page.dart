import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app_ui/models/chat_users_model.dart';
import 'package:flutter_chat_app_ui/widgets/conversation_list_item.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  List<ChatUser> chatUsers = [
    ChatUser(name: "Jane Russel", messageText: "Awesome Setup", imageUrl: "1.jpg", time: "Now"),
    ChatUser(name: "Glady's Murphy", messageText: "That's Great", imageUrl: "2.jpg", time: "Yesterday"),
    ChatUser(name: "Jorge Henry", messageText: "Hey where are you?", imageUrl: "3.jpg", time: "31 Mar"),
    ChatUser(name: "Philip Fox", messageText: "Busy! Call me in 20 mins", imageUrl: "4.jpg", time: "28 Mar"),
    ChatUser(name: "Debra Hawkins", messageText: "Thankyou, It's awesome", imageUrl: "5.jpg", time: "23 Mar"),
    ChatUser(name: "Jacob Pena", messageText: "will update you in evening", imageUrl: "6.jpg", time: "17 Mar"),
    ChatUser(name: "Andrey Jones", messageText: "Can you please share the file?", imageUrl: "7.jpg", time: "24 Feb"),
    ChatUser(name: "John Wick", messageText: "How are you?", imageUrl: "8.jpg", time: "18 Feb"),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SafeArea(
              child: Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Conversations",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.pink[50]),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.pink,
                        size: 20,
                      ),
                      SizedBox(width: 2,),
                      Text("Add New", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ],
            ),
          )),
          Container(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search......",
                hintStyle: TextStyle(color: Colors.grey.shade600),
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade600, size: 20),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: EdgeInsets.all(8),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey.shade100)
                )
              ),
            ),
          ),
          ListView.builder(
            itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ConversationListItem(chatUser: chatUsers[index], isMessageRead: (index == 0 || index == 3) ? true : false);
              })
        ],
      ),
    );
  }
}
