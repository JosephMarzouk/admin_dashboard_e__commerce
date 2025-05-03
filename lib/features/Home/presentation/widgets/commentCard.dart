import 'package:admin_dashboard_e__commerce/core/components/customElevatedButton.dart';
import 'package:admin_dashboard_e__commerce/core/components/customTextField.dart';
import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  CommentCard({
    super.key,
  });
  final TextEditingController replyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        child: Column(
          children: [
            const Text(
              "Comment : This Is User Comment",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Reply : This Is Replay",
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomField(
                labelText: "Reply",
                controller: replyController,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomElevatedButton(
              child: const Text("Reply"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}