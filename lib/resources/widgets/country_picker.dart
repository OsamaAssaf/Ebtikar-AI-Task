import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class CountryPicker extends StatelessWidget {
  const CountryPicker({
    super.key,
    required this.selectedCountryFlag,
    required this.onSelect,
    this.backgroundColor,
  });

  final String selectedCountryFlag;
  final void Function(Country) onSelect;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor ?? customTheme.filled,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: customTheme.grey,
            width: 0.1,
          ),
        ),
        fixedSize: const Size.fromHeight(48.0),
      ),
      onPressed: () {
        showCountryPicker(
          context: context,
          showPhoneCode: true,
          favorite: ['JO', 'SA'],
          exclude: ['IL'],
          onSelect: (Country country) {
            onSelect(country);
          },
          countryListTheme: CountryListThemeData(
            backgroundColor: theme.colorScheme.surface,
            inputDecoration: InputDecoration(
              hintStyle: theme.textTheme.titleLarge!.copyWith(
                color: customTheme.grey,
                fontWeight: FontWeight.normal,
              ),
              hintText: localizations.search,
              prefixIcon: Icon(
                Icons.search,
                size: ConstantsManager.iconSize,
              ),
              prefixIconColor: customTheme.grey,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: customTheme.grey,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: customTheme.grey,
                ),
              ),
            ),
            searchTextStyle: theme.textTheme.titleLarge!.copyWith(
              color: customTheme.black,
              fontWeight: FontWeight.normal,
            ),
            textStyle: theme.textTheme.titleLarge!.copyWith(
              color: customTheme.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        );
      },
      child: Row(
        children: [
          ScaleText(
            selectedCountryFlag,
            style: theme.textTheme.titleLarge,
          ),
          Icon(
            Icons.arrow_drop_down_outlined,
            size: ConstantsManager.iconSize,
          )
        ],
      ),
    );
  }
}
