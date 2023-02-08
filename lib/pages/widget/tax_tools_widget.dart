import 'package:flutter/material.dart';
import 'package:new_ukm_desk/constants/theme.dart';

class TaxToolWidget extends StatelessWidget {
  const TaxToolWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: Card(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.13,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tax Tools',
                  style: darkTextStyle.copyWith(fontSize: 18, fontWeight: bold),
                ),
                GestureDetector(
                  onTap: () {},
                  child: DropdownButton(
                    isExpanded: true,
                    items: const [],
                    hint: const Text('Pilih jenis data'),
                    onChanged: (value) {
                      // print(value);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
