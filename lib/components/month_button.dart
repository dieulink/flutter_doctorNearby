import 'package:flutter/material.dart';
import 'package:flutter_doctor_nearby/ui_values.dart';

class MonthHeader extends StatefulWidget {
  final Function(int) onTapValue;
  final String? currentMonth;
  const MonthHeader({super.key, required this.onTapValue, this.currentMonth});

  @override
  State<MonthHeader> createState() => _MonthHeaderState();
}

class _MonthHeaderState extends State<MonthHeader> {
  int? selectedButtonIndex;
  final ScrollController scrollController = ScrollController();

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     scrollController.jumpTo(months[0]);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        itemCount: months.length,
        itemBuilder: (context, index) => MonthButton(
          month: months[index],
          onTap: () {
            setState(() {
              selectedButtonIndex = index;
              widget.onTapValue(index + 1);
            });
          },
          isSelected: selectedButtonIndex == null
              ? (widget.currentMonth == months[index])
              : selectedButtonIndex == index,
        ),
      ),
    );
  }
}

class MonthButton extends StatelessWidget {
  final String month;
  final Function()? onTap;
  final bool isSelected;

  MonthButton({
    super.key,
    required this.month,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: defaultMargin,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          border: isSelected ? Border.all(color: primaryColor) : null,
          borderRadius: isSelected ? BorderRadius.circular(10) : null,
        ),
        child: Center(
          child: Text(
            month,
            style: TextStyle(
              color: isSelected ? primaryColor : greyContent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
