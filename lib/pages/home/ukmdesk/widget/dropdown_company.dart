import 'package:flutter/material.dart';
import 'package:new_ukm_desk/constants/theme.dart';

class DropDownCompany extends StatefulWidget {
  const DropDownCompany({super.key});

  @override
  State<DropDownCompany> createState() => _DropDownCompanyState();
}

class _DropDownCompanyState extends State<DropDownCompany> {
  List dropList = ['PT. ABC', 'PT. DEF', 'PT. XYZ'];
  String? isValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'UKM Report',
            style: darkTextStyle.copyWith(fontSize: 16, fontWeight: bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: DropdownButton(
            items: dropList.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                isValue = value as String?;
              });
            },
            value: isValue,
            isExpanded: true,
          ),
        ),
      ],
    );
  }
}
