import 'package:flutter/material.dart';
import '../../../../core/routing/app_routes.dart';

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
  final TextEditingController controller = TextEditingController();

  List<Message> messages = [
    Message(
      text:
      "Hello! I'm your AI Cyber Assistant.\nPhishing often starts with a deceptive link. Would you like to dive into a specific concept?",
      isUser: false,
    ),
    Message(
      text:
      "URL Spoofing is a common technique where attackers create a web address that looks legitimate but leads to a malicious site.",
      isUser: false,
    ),
  ];

  void sendMessage() {
    if (controller.text.trim().isEmpty) return;

    final text = controller.text;

    setState(() {
      messages.add(Message(text: text, isUser: true));
    });

    controller.clear();

    /// 🔹 Fake AI (هتشيلها لما تربطي API)
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        messages.add(
          Message(
            text: "This is a demo AI response.",
            isUser: false,
          ),
        );
      });
    });
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

                /// 🔙 BACK BUTTON (نفس الشكل بالظبط)
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

      /// 🔹 BODY
      body: Column(
          children: [

      /// 📨 MESSAGES
      Expanded(
      child: ListView.builder(
      padding: EdgeInsets.all(w * 0.05),
      itemCount: messages.length + 1,
      itemBuilder: (context, index) {

        /// TODAY LABEL
        if (index == 0) {
          return Center(
            child: Text(
              "Today",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12 * scale,
              ),
            ),
          );
        }

        final msg = messages[index - 1];

        return Column(
          crossAxisAlignment: msg.isUser
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [

            /// MESSAGE
         Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
        crossAxisAlignment:
        msg.isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [

        /// 📨 MESSAGE
        msg.isUser
        ? Container(
        padding: const EdgeInsets.all(14),
        constraints: BoxConstraints(maxWidth: w * 0.7),
        decoration: BoxDecoration(
        color: const Color(0xFF2F80ED),
        borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
        msg.text,
        style: TextStyle(
        color: Colors.white,
        fontSize: 13 * scale),
        ),
        )
            : Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
        const CircleAvatar(
        backgroundColor: Color(0xFF2F80ED),
        child: Icon(Icons.shield, color: Colors.white),
        ),
        const SizedBox(width: 10),

        Expanded(
        child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
        msg.text,
        style: TextStyle(
        color: Colors.white,
        fontSize: 13 * scale),
        ),
        ),
        ),
        ],
        ),

        const SizedBox(height: 4),

        /// ⏱️ TIME (تحت الرسالة)
        Padding(
        padding: EdgeInsets.only(
        left: msg.isUser ? 0 : 52, // 👈 علشان يعدي تحت البابل مش تحت الايقون
        ),
        child: Text(
        msg.isUser ? "10:44 AM  ✓✓" : "10:42 AM",
        style: TextStyle(
        color: Colors.grey,
        fontSize: 10 * scale,
        ),
        ),
        ),
        ],
        ),
        ),
          ],
        );
      },
    ),
    ),
            /// QUICK ACTIONS
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.04),
              child: Row(
                children: [
                  _quickBtn(Icons.search, "Explain URL Spoofing",Color(0xFF0F1C35),Color(0xFF5EA2F6)),
                  const SizedBox(width: 10),
                  _quickBtn(Icons.link, "Check link",Color(0xFF1D2839),Color(0xffEAEEF2)),
                ],
              ),
            ),

            const SizedBox(height: 10),

            /// INPUT
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
                      controller: controller,
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
                    onTap: sendMessage,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        color: Color(0xFF2F80ED),
                        shape: BoxShape.circle,
                      ),
                      child:
                      const Icon(Icons.send, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
      ),
    );
  }

  Widget _quickBtn(IconData icon, String text,Color bgColor,Color textIconColor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: textIconColor, size: 18),
             SizedBox(width: 6),
            Text(text, style:  TextStyle(color:textIconColor ,fontWeight: FontWeight.w700,fontSize: 13)),
          ],
        ),
      ),
    );
  }
}