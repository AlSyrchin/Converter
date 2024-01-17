part of 'theme.dart';

ThemeData createTheme() {
  return ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.mainColor, 
          ),
        dropdownMenuTheme: const DropdownMenuThemeData(
          textStyle: dropmenuText
        ),
        iconTheme: const IconThemeData(
          color: AppColors.mainColor
        )
        
        );
}