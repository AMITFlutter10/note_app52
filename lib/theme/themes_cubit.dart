import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_app52/utilities/enums.dart';

import '../cash_helper.dart';

part 'themes_state.dart';

class ThemesCubit extends Cubit<ThemesState> {
  ThemesCubit() : super(ThemesInitial());
  static ThemesCubit get(context)=>BlocProvider.of(context);
  bool isDark = false;

  changeTheme(){
    isDark = !isDark ;
    CashHelper.putBool(key: SharedKey.theme, value: isDark);
    emit(ChangeThemeState());
  }

   getTheme(){
   isDark= CashHelper.getBool(key: SharedKey.theme);
     emit(GetThemeState());
   }

}
