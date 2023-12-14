import 'package:flutter/material.dart';
import 'package:note_app52/theme/themes_cubit.dart';
import 'package:sizer/sizer.dart';

import '../widgets/default_text.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DefaultText(text: "Theme",
        fontSize: 15.sp,
        )
      ),
      body: Column(
        children: [
          Switch(
              value: ThemesCubit.get(context).isDark,
              onChanged: (onChanged){
                ThemesCubit.get(context).changeTheme();
              }
          )

        ],
      ),
    );
  }
}
