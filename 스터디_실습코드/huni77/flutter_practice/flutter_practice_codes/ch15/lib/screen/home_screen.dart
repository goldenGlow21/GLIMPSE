import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_editor/component/emoticon_sticker.dart';
import 'package:image_editor/component/footer.dart';
import 'package:image_editor/component/main_app_bar.dart';
import 'package:image_editor/model/sticker_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  XFile? image; // 선택한 이미지를 저장할 변수
  Set<StickerModel> stickers = {}; // 화면에 추가된 스티커를 저장할 변수
  String? selectedId; // 현재 선택된 스티커의 ID
  GlobalKey imgKey = GlobalKey(); // 이미지로 전환할 위젯에 입력해줄 키 값

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // 스크린에 Body, AppBar, Footer 순서로 쌓을 준비
        fit: StackFit.expand, // 1. 자식 위젯들 최대 크기로 펼치기
        children: [
          renderBody(), // Body 위치
          // MainAppBar 을 좌, 우, 위 끝에 정렬
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: MainAppBar(
              // AppBar 위치
              onPickImage: onPickImage,
              onDeleteItem: onDeleteItem,
              onSaveImage: onSaveImage,
            ),
          ),
          // image 선택 시 Footer 위치
          if (image != null)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Footer(
                onEmoticonTap: onEmoticonTap,
              ),
            ),
        ],
      ),
    );
  }

  Widget renderBody() {
    if (image != null) {
      // 이미지 선택한 경우
      return RepaintBoundary(
        key: imgKey,
        child: Positioned.fill(
          child: InteractiveViewer(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.file(
                  File(image!.path),
                  fit: BoxFit.cover, // 이미지가 최대한 공간 차지하게 하기
                ),
                ...stickers.map(
                  (sticker) => Center(
                    // 최초 스티커 선택 시 중앙에 배치
                    child: EmoticonSticker(
                      key: ObjectKey(sticker.id), // 위젯을 구분하는 키 값
                      onTransform: () {
                        onTransform(sticker.id); // 스티커의 ID 값을 함수의 매개변수로 전달
                      },
                      imgPath: sticker.imgPath,
                      isSelected: selectedId == sticker.id,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      // 이미지 선택이 안된 경우 이미지 선택 버튼 표시
      return Center(
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.grey,
          ),
          onPressed: onPickImage,
          child: Text('이미지 선택하기'),
        ),
      );
    }
  }

  // 스티커가 변형될 때 마다 변형 중인 스티커를 현재 선택한 스티커로 지정
  void onTransform(String id) {
    setState(() {
      selectedId = id;
    });
  }

  void onEmoticonTap(int index) async {
    setState(() {
      stickers = {
        ...stickers,
        StickerModel(
          id: Uuid().v4(), // 스티커의 고유 ID
          imgPath: 'asset/img/emoticon_$index.png',
        ),
      };
    });
  }

  void onPickImage() async {
    final image = await ImagePicker()
        .pickImage(source: ImageSource.gallery); // 갤러리에서 이미지 선택하기
    setState(() {
      this.image = image; // 선택한 이미지 저장하기
    });
  }

  void onSaveImage() async {
    RenderRepaintBoundary boundary = imgKey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(); // ➊ 바운더리를 이미지로 변경
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png); // ➋ byte data 형태로 형태 변경
    Uint8List pngBytes = byteData!.buffer.asUint8List(); // ➌ Unit8List 형태로 형태 변경

    await ImageGallerySaver.saveImage(pngBytes, quality: 100);

    ScaffoldMessenger.of(context).showSnackBar(  // ➋ 저장 후 Snackbar 보여주기
      SnackBar(
        content: Text('저장되었습니다!'),
      ),
    );
  }

  void onDeleteItem() async {
    setState(() {
      // 현재 선택된 스티커 삭제 후 Set 으로 변환
      stickers = stickers.where((sticker) => sticker.id != selectedId).toSet();
    });
  }
}
