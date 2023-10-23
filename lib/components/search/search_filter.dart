/*
import 'package:flutter/material.dart';
import '../../theme/color/colors.dart';
import '../../utills/const_string.dart';
import '../common_size/nk_general_size.dart';
import '../widgets/my_form_field.dart';

class SearchFilter extends StatefulWidget {
  final void Function(dynamic)? onChanged;
  const SearchFilter({Key? key, this.onChanged}) : super(key: key);

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  final TextEditingController _searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: MyFormField(
        controller: _searchTextController,
        labelText: search,
        onChanged: widget.onChanged,
        focusedColor: cursorColor.withOpacity(0.5),
        disabledColor: cursorColor.withOpacity(0.5),
        enableColor: cursorColor.withOpacity(0.5),
        borderRadius:
            BorderRadius.circular(NkGeneralSize.nkCommonBorderRadius()),
        suffixIcon: const Icon(Icons.search),
      ),
    );
  }
}
*/
