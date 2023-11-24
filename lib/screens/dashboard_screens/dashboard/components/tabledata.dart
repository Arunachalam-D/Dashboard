import 'package:dashboard/constants/constant_strings.dart';
import 'package:flutter/material.dart';
import '../../../../constants/constant_colors.dart';
import '../../../../models/course_list.dart';
import '../../../../responsive/responsive.dart';

Widget courseTable(bool mobile) {
  return mobile ?
  Row(
    children: [
      Expanded(
      //width: double.infinity ,
        child: FittedBox(
          child: DataTable(
              columns: const [
                DataColumn(
                    label: Text(
                      StringConstants.id,
                      style: TextStyle(
                          color: deepOrange, fontWeight: FontWeight.bold),
                    )),
                DataColumn(
                    label: Text(
                      StringConstants.course,
                      style: TextStyle(
                          color: deepOrange, fontWeight: FontWeight.bold),
                    )),
                DataColumn(
                    label: Text(StringConstants.startDate,
                        style: TextStyle(
                            color: deepOrange, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text(StringConstants.endDate,
                        style: TextStyle(
                            color: deepOrange, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text(StringConstants.status,
                        style: TextStyle(
                            color:deepOrange, fontWeight: FontWeight.bold))),
              ],
              rows: List.generate(
                  myCourses.length,
                      (index) => coursesDataRow(
                    myCourses[index],
                  ))),
        ),
      ),
    ],
  )
      :
  SizedBox(

    width: double.infinity ,
    child: DataTable(
        columns: const [
          DataColumn(
              label: Text(
            StringConstants.id,
            style: TextStyle(
                color: deepOrange, fontWeight: FontWeight.bold),
          )),
          DataColumn(
              label: Text(
            StringConstants.course,
            style: TextStyle(
                color: deepOrange, fontWeight: FontWeight.bold),
          )),
          DataColumn(
              label: Text(StringConstants.startDate,
                  style: TextStyle(
                      color: deepOrange, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text(StringConstants.endDate,
                  style: TextStyle(
                      color: deepOrange, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text(StringConstants.status,
                  style: TextStyle(
                      color:deepOrange, fontWeight: FontWeight.bold))),
        ],
        rows: List.generate(
            myCourses.length,
            (index) => coursesDataRow(
                  myCourses[index],
                ))),
  );
}

DataRow coursesDataRow(CourseList courseInfo) {
  return DataRow(cells: [
    DataCell(Text(courseInfo.id)),
    DataCell(Text(courseInfo.title)),
    DataCell(Text(courseInfo.startDate)),
    DataCell(Text(courseInfo.endDate)),
    DataCell(Text(courseInfo.status,
        style: TextStyle(
          color:
              courseInfo.status == StringConstants.completed ?green : purple,
        ))),
  ]);
}
