import 'package:admin_dashboard_e__commerce/core/functions/buid_custom_appbar.dart';
import 'package:admin_dashboard_e__commerce/features/Home/presentation/widgets/commentCard.dart';
import 'package:flutter/material.dart';
class CommentsView extends StatelessWidget {
  const CommentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Comments"),
      body: ListView.builder(
        itemBuilder: (context, index) => CommentCard(),
        itemCount: 10,
      ),
    );
  }
}
