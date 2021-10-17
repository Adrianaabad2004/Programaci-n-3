import '../class/job_class.dart';

import '../database/db.dart';
import 'package:flutter/material.dart';

class ViewAll extends StatefulWidget {
  const ViewAll({Key? key}) : super(key: key);

  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    DBFirebase db = DBFirebase();
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(30),
        child: ListView(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(height: 30),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Trabajos",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Divider(height: 30),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              child: Row(
                children: [
                  Text(
                    arguments["type"],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Divider(height: 30),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: FutureBuilder(
                future: db.get("jobs"),
                builder: (context, AsyncSnapshot<List<Job>> snapshot) {
                  if (snapshot.hasData) {
                    return DataTable(
                      showCheckboxColumn: false,
                      columns: [
                        DataColumn(
                          label: Text(
                            "Compañía",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Tipo",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Posición",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Ubicación",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                      rows: Listadewidget(snapshot.data, arguments["value"]),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "Error",
                        style: TextStyle(fontSize: 30),
                      ),
                    );
                  }
                  return Container(
                    margin: EdgeInsets.all(100),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Divider(height: 30),
                ),
                SizedBox(width: 10),
                Text(
                  "© - All rights reserved",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Divider(height: 30),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<DataRow> Listadewidget(List<Job>? list, String value) {
    List<DataRow> Lista = [];

    for (int i = 0; (i < list!.length); i++) {
      final dato = DataRow(
        onSelectChanged: (value) {
          Navigator.pushNamed(context, "/Jobpage", arguments: {
            "company": list[i].Company,
            "type": list[i].Type,
            "position": list[i].Position,
            "ubication": list[i].Ubication,
            "category": list[i].Category,
            "description": list[i].Description,
            "email": list[i].Email,
          });
        },
        cells: [
          DataCell(
            Text(list[i].Company),
          ),
          DataCell(
            Text(list[i].Type),
          ),
          DataCell(
            Text(list[i].Position),
          ),
          DataCell(
            Text(list[i].Ubication),
          ),
        ],
      );

      if (list[i].Company.toLowerCase().contains(value.toLowerCase()) ||
          list[i].Category.toLowerCase().contains(value.toLowerCase()) ||
          list[i].Position.toLowerCase().contains(value.toLowerCase()) ||
          list[i].Ubication.toLowerCase().contains(value.toLowerCase()) ||
          list[i].Type.toLowerCase().contains(value.toLowerCase())) {
        Lista.add(dato);
      }
    }

    return Lista;
  }
}
