// Imports
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:number_lookup_web/app/constans/app_constants.dart';

class SearchField extends StatefulWidget {
  const SearchField({this.onSearch, Key? key}) : super(key: key);

  final Function(String value)? onSearch;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final controller = TextEditingController();

  // Triggers when _SearchFieldState get destroyed
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLength: 10,
      decoration: InputDecoration(
          counterText: '',
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          prefixIcon: const Icon(EvaIcons.search),
          hintText: "Search 10 digit number..",
          isDense: true,
          fillColor: Theme.of(context).cardColor),
      onEditingComplete: () {
        FocusScope.of(context).unfocus();
        if (widget.onSearch != null) widget.onSearch!(controller.text);
      },
      textInputAction: TextInputAction.search,
      style: TextStyle(color: kFontColorPallets[1]),
    );
  }
}
