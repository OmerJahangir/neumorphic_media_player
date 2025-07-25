import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_player/res/constants.dart';
import 'package:media_player/view/audio_list/widget/app_bar.dart';
import 'package:media_player/view/folders/widget/folder_list.dart';
import '../../view_model/controller/folder_controller.dart';

class FolderList extends StatefulWidget {
  const FolderList({super.key});

  @override
  State<FolderList> createState() => _FolderListState();
}

class _FolderListState extends State<FolderList> {
  @override
  void initState() {
    super.initState();
    controller.getList();
  }

  final controller = Get.put(FolderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: const SafeArea(
        child: Column(
          children: [CustomAppBar(), Folders()],
        ),
      ),
    );
  }
}
