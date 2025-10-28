import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/data/enums/language.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/BottomSheetHandle.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

void showLanguageBottomSheet(
  BuildContext context,
  Language currentLanguage,
  Function(Language) onLanguageSelected,
) {
  Dimensions.init(context);
  Get.bottomSheet(
    _LanguageBottomSheetContent(
      currentLanguage: currentLanguage,
      onLanguageSelected: onLanguageSelected,
    ),
    isScrollControlled: true,
  );
}

class _LanguageBottomSheetContent extends StatefulWidget {
  final Language currentLanguage;
  final Function(Language) onLanguageSelected;

  const _LanguageBottomSheetContent({
    required this.currentLanguage,
    required this.onLanguageSelected,
  });

  @override
  State<_LanguageBottomSheetContent> createState() => _LanguageBottomSheetContentState();
}

class _LanguageBottomSheetContentState extends State<_LanguageBottomSheetContent> {
  late Language _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = widget.currentLanguage;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(Dimensions.padding(20)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(Dimensions.width(30)),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Bottomsheethandle(),
            AppText(
              text: 'Select Language',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: Dimensions.height(20)),
            ...Language.values.map((lang) => ListTile(
                  title: Text(lang.toDisplayName()),
                  trailing: lang == _selectedLanguage
                      ? Icon(Icons.check, color: primaryColor)
                      : null,
                  onTap: () {
                    setState(() {
                      _selectedLanguage = lang;
                    });
                    widget.onLanguageSelected(lang);
                    // Using a short delay to show selection before closing.
                    Future.delayed(const Duration(milliseconds: 300), () {

                    });
                  },
                )),
            SizedBox(height: Dimensions.height(30)),
          ],
        ),
      ),
    );
  }
}
