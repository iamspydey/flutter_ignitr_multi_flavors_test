import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/views/layouts/master_layout.dart';
import '../../../shared/views/widgets/widgets.dart';
import '../controllers/article_controller.dart';

class ArticlePage extends StatelessWidget {
  ArticlePage({super.key});

  final ArticleController controller = ArticleController.instance;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isBusy
          ? LoadingIconWidget(message: "Please wait...")
          : MasterLayout(
              title: "Article",
              body: SafeArea(
                child: Center(
                  child: Text("Build awesome page here."),
                ),
              ),
            ),
    );
  }
}
