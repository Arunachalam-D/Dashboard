import 'package:flutter/material.dart';
import '../../../../constants/constant_colors.dart';
import '../../../../constants/constant_strings.dart';
import '../../../../models/concepts_list.dart';

SizedBox conceptsCovered() {
  return SizedBox(
    width: double.infinity,
    child: DataTable(
        columns: const [
           DataColumn(
              label: Text(
                StringConstants.concepts,
            style: TextStyle(
                color: textOrange, fontWeight: FontWeight.bold),
          )),
        ],
        rows: List.generate(
            myConcepts.length,
            (index) => coursesDataRow(
                  myConcepts[index],
                ))),
  );
}

DataRow coursesDataRow(ConceptsList conceptsInfo) {
  return DataRow(cells: [
    DataCell(Text(conceptsInfo.title)),
  ]);
}
