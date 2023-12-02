import 'package:ecommerce_kit_store/view/widgets/admin/admin_body.dart';
import 'package:flutter/material.dart';


class AdminView extends StatelessWidget {
  const AdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: const AdminBody(),
    );
  }
}