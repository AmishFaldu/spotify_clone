import 'package:flutter/material.dart';
import 'package:spotify_clone/utils/country_code_map.dart';

class CountryCode extends StatefulWidget {
  static const route = '/signup-with-phone-number-country-code-screen';

  const CountryCode({Key? key}) : super(key: key);

  @override
  State<CountryCode> createState() => _CountryCodeState();
}

class _CountryCodeState extends State<CountryCode> {
  List<List<String>> filteredCountryCodes = countryCodes;
  bool hasFilterValue = false;
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('Choose your country'),
    );

    final topOverlay = MediaQuery.of(context).padding.top;
    final appBarHeight = appBar.preferredSize.height;
    final keyboardOverlayHeight = MediaQuery.of(context).viewInsets.bottom;
    final containerHeight = MediaQuery.of(context).size.height -
        topOverlay -
        appBarHeight -
        50 -
        keyboardOverlayHeight;

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.grey,
            ),
            child: TextFormField(
              controller: textEditingController,
              onChanged: (filterValue) {
                if (filterValue.isNotEmpty) {
                  filteredCountryCodes = countryCodes.where((countryCode) {
                    return countryCode[0]
                        .toLowerCase()
                        .contains(filterValue.toLowerCase());
                  }).toList();
                  hasFilterValue = true;
                  setState(() {});
                  return;
                }
                hasFilterValue = false;
                filteredCountryCodes = countryCodes;
                setState(() {});
              },
              enableSuggestions: true,
              autofocus: true,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryIconTheme.color,
                ),
                suffixIcon: hasFilterValue
                    ? IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        icon: Icon(
                          Icons.clear,
                          color: Theme.of(context).primaryIconTheme.color,
                        ),
                        onPressed: () {
                          textEditingController.clear();
                          filteredCountryCodes = countryCodes;
                          hasFilterValue = false;
                          setState(() {});
                        },
                      )
                    : null,
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2!.color,
                ),
              ),
            ),
          ),
          SizedBox(
            height: containerHeight,
            child: ListView.builder(
              itemBuilder: (ctx, index) => GestureDetector(
                onTap: () {
                  Navigator.of(context).pop([...filteredCountryCodes[index]]);
                },
                child: ListTile(
                  leading: Text(
                    filteredCountryCodes[index][0],
                  ),
                  trailing: Text(
                    filteredCountryCodes[index][1],
                  ),
                ),
              ),
              itemCount: filteredCountryCodes.length,
            ),
          ),
        ],
      ),
    );
  }
}
