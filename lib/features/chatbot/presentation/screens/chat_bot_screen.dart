import 'package:flutter/material.dart';
import '../../../../core/routing/app_routes.dart';
import '../../data/models/chat_message_model.dart';
import '../../data/services/chat_service.dart';
import 'package:intl/intl.dart';
class Message {
  final String text;
  final bool isUser;

  Message({required this.text, required this.isUser});
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController scrollController =
  ScrollController();
  final TextEditingController messageController =
  TextEditingController();

  final List<ChatMessageModel> messages = [

    ChatMessageModel(
      text:
      "Hello! I'm your AI Cyber Assistant.\nPhishing often starts with a deceptive link. Would you like to dive into a specific concept?",
      isUser: false,
    ),

    ChatMessageModel(
      text:
      "URL Spoofing is a common technique where attackers create a web address that looks legitimate but leads to a malicious site.",
      isUser: false,
    ),
  ];

  final ChatService chatService = ChatService();

  String conversationId = "";

  bool isLoading = false;

  Future<void> sendMessage() async {
    if (messageController.text.trim().isEmpty) return;

    final userMessage = messageController.text;

    setState(() {
      messages.add(
        ChatMessageModel(
          text: userMessage,
          isUser: true,
        ),
      );

      isLoading = true;
    });

    messageController.clear();

    try {
      final response = await chatService.sendMessage(
        message: userMessage,
        conversationId: conversationId,
      );

      conversationId = response["conversationId"];

      final botReply = response["reply"];

      setState(() {
        messages.add(
          ChatMessageModel(
            text: botReply,
            isUser: false,
          ),
        );
        Future.delayed(
          const Duration(milliseconds: 100),
              () {
            scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          },
        );
      });
    } catch (e) {
      setState(() {
        messages.add(
          ChatMessageModel(
            text: "Something went wrong",
            isUser: false,
          ),
        );
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  void sendQuickMessage(String text) {
    messageController.text = text;
    sendMessage();
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;
    final scale = w / 375;

    return Scaffold(
        backgroundColor: const Color(0xFF081826),

      appBar: AppBar(
        backgroundColor: const Color(0xFF081826),
        elevation: 0,
        toolbarHeight: h * 0.09,
        automaticallyImplyLeading: false,

        flexibleSpace: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.05),
            child: Row(
              children: [

                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      } else {
                        Navigator.pushReplacementNamed(context, AppRoutes.main);
                      }
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.blue,
                    ),
                  ),
                ),

                SizedBox(width: w * 0.03),

                Expanded(
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 42,
                            width: 42,
                            decoration: const BoxDecoration(
                              color: Color(0xFF2F80ED),
                              shape: BoxShape.circle,
                            ),
                            child:
                            const Icon(Icons.shield, color: Colors.white),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: w * 0.03),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Cyber Guard AI",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14 * scale,
                                  fontWeight: FontWeight.w700)),
                          Text("Online & Ready",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 11 * scale)),
                        ],
                      ),
                    ],
                  ),
                ),

                const Icon(Icons.verified_user, color: Colors.grey),
                const SizedBox(width: 12),
                const Icon(Icons.info, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),


      body: Column(
          children: [


            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];

                  return Align(
                    alignment:
                    message.isUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,

                    child: Column(
                      crossAxisAlignment:
                      message.isUser
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,

                      children: [


                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.all(14),

                          decoration: BoxDecoration(
                            color: message.isUser
                                ? const Color(0xFF2F80ED)
                                : const Color(0xFF1F2937),

                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: Text(
                            message.text,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),



                        Padding(
                          padding: const EdgeInsets.only(
                            right: 6,
                            top: 2,
                          ),

                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [

                              Text(
                                DateFormat('hh:mm a').format(DateTime.now()),
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 10,
                                ),
                              ),

                              const SizedBox(width: 4),

                              if (message.isUser)
                                const Icon(
                                  Icons.done_all,
                                  color: Color(0xFF5EA2F6),
                                  size: 14,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            if (isLoading)
              const Padding(
                padding: EdgeInsets.all(10),
                child: CircularProgressIndicator(
                  color: Color(0xFF2F80ED),
                ),
              ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.04),
              child: Row(
                children: [


                  GestureDetector(
                    onTap: () {
                      sendQuickMessage("Explain URL Spoofing");
                    },
                    child: _quickBtn(
                      Icons.search,
                      "Explain URL Spoofing",
                      const Color(0xFF0F1C35),
                      const Color(0xFF5EA2F6),
                    ),
                  ),

                  const SizedBox(width: 10),


                  GestureDetector(
                    onTap: () {
                      sendQuickMessage("Check this suspicious link");
                    },
                    child: _quickBtn(
                      Icons.link,
                      "Check link",
                      const Color(0xFF1D2839),
                      const Color(0xffEAEEF2),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),


            Container(
              margin: EdgeInsets.all(w * 0.04),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 55,
              decoration: BoxDecoration(
                color: const Color(0xFF16202D),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  const Icon(Icons.add_circle, color: Colors.grey),
                  const SizedBox(width: 8),

                  Expanded(
                    child: TextField(
                      controller: messageController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Type your question...",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  const Icon(Icons.emoji_emotions_outlined,
                      color: Colors.grey),

                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () async {
                      await sendMessage();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        color: Color(0xFF2F80ED),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
      ),
    );
  }

  Widget _quickBtn(
      IconData icon,
      String text,
      Color bgColor,
      Color textIconColor,
      ) {
    final w = MediaQuery.of(context).size.width;

    return Container(
      width: w * 0.42,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: textIconColor,
            size: 18,
          ),

          const SizedBox(width: 6),

          Flexible(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: textIconColor,
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
  }
