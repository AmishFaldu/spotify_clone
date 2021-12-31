import 'package:flutter/material.dart';
import 'package:spotify_clone/utils/date_picker.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_material_picker.dart';

class CustomDatePickerWidget extends StatefulWidget {
  final DateTime? maxDate;
  final DateTime? minDate;

  const CustomDatePickerWidget({
    Key? key,
    this.maxDate,
    this.minDate,
  }) : super(key: key);

  @override
  _CustomDatePickerWidgetState createState() => _CustomDatePickerWidgetState();
}

class _CustomDatePickerWidgetState extends State<CustomDatePickerWidget> {
  bool isScrolling = false;
  DateTime _datePicked = DateTime.now();
  int _currentYear = 0;
  int _dayOfMonthPicked = 0;
  int _monthPicked = 0;
  final int _initialYear = 1900;
  int _yearPicked = 1900;
  FixedExtentScrollController? dayController;
  FixedExtentScrollController? monthController;
  FixedExtentScrollController? yearController;
  List<int> listOfYearsToShow = [];

  @override
  void initState() {
    _currentYear = _datePicked.year;
    _dayOfMonthPicked = _datePicked.day;
    _monthPicked = _datePicked.month;
    _yearPicked = _datePicked.year;

    listOfYearsToShow = [for (var i = _initialYear; i <= _currentYear; i++) i];

    dayController =
        FixedExtentScrollController(initialItem: _dayOfMonthPicked - 1);
    monthController =
        FixedExtentScrollController(initialItem: _monthPicked - 1);
    yearController =
        FixedExtentScrollController(initialItem: listOfYearsToShow.length - 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final noOfDaysInMonth = DateTimeRange(
            start: DateTime(_yearPicked, _monthPicked),
            end: DateTime(_yearPicked, _monthPicked + 1))
        .duration
        .inDays;

    final List<Widget> listOfDayWidgets = [];
    final List<Widget> listOfMonthWidgets = [];
    final List<Widget> listOfYearWidgets = [];

    /// Getting list of widgets for day of month to show in wheel scroll view
    for (var i = 1; i <= noOfDaysInMonth; i++) {
      final textString = i < 10 ? '0$i' : '$i';
      listOfDayWidgets.add(
        Text(
          textString,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      );
    }

    /// Getting list of widgets for months in year to show in wheel scroll view
    for (var i = 0; i < monthNames.length; i++) {
      final textString = monthNames[i];
      listOfMonthWidgets.add(Text(
        textString,
        style: Theme.of(context).textTheme.bodyText2,
      ));
    }

    /// Getting list of widgets for years to show in wheel scroll view
    for (var i = _initialYear; i <= _currentYear; i++) {
      final textString = '$i';
      listOfYearWidgets.add(Text(
        textString,
        style: Theme.of(context).textTheme.bodyText2,
      ));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomMaterialPicker(
          scrollController: dayController,
          onSelectedItemChanged: (index) {
            _dayOfMonthPicked = index + 1;
            _datePicked =
                DateTime(_yearPicked, _monthPicked, _dayOfMonthPicked);
            print("Date picked : $_datePicked");
            setState(() {});
          },
          listOfWidgets: listOfDayWidgets,
        ),
        CustomMaterialPicker(
          scrollController: monthController,
          onSelectedItemChanged: (index) {
            _monthPicked = index + 1;
            _datePicked =
                DateTime(_yearPicked, _monthPicked, _dayOfMonthPicked);
            print("Date picked : $_datePicked");
            setState(() {});
          },
          listOfWidgets: listOfMonthWidgets,
        ),
        CustomMaterialPicker(
          scrollController: yearController,
          onSelectedItemChanged: (index) {
            _yearPicked = listOfYearsToShow[index];
            _datePicked =
                DateTime(_yearPicked, _monthPicked, _dayOfMonthPicked);
            print("Date picked : $_datePicked");
            setState(() {});
          },
          listOfWidgets: listOfYearWidgets,
        ),
      ],
    );
  }
}
