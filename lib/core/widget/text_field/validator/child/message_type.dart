import 'package:flutter/material.dart';

import '../../../../global_bloc/app_bloc.dart';

class MessageType extends StatelessWidget {
  const MessageType(
      {Key? key, required this.items, required this.selectedItem, required this.onChange})
      : super(key: key);
  final List<String> items;
  final String? selectedItem;
  final void Function(String? item) onChange;

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
        child: DropdownButton<String>(
          iconEnabledColor: Colors.white,
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: tr(value),
              child: Text(
                tr(value),
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
            );
          }).toList(),
          onChanged: (v) {
            onChange(v);
          },
          icon: const Icon(
            Icons.arrow_drop_down_outlined,
            color: Colors.black,
            size: 30,
          ),
          underline: const SizedBox(),
          value: tr(selectedItem??'message_type'),
          isExpanded: true,
          hint: Text(
            tr('message_type'),
            style: const TextStyle(
                fontSize: 16,  fontWeight: FontWeight.w400, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
