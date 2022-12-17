import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sample_store/core/res/theme/colors.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key, required this.onChange, this.file}) : super(key: key);
  final XFile? file;
  final void Function() onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Expanded(
            child: Text(
              file?.path??'upload_image'
            ),
          ),
          IconButton(onPressed: onChange, icon: const Icon(
            Icons.camera_alt_outlined,
            color: primaryColor,
          ))
          ],
        ),
      ),
    );
  }
}
