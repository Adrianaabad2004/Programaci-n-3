import 'dart:async';

import '../class/job_class.dart';
import '../database/db.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.restart_alt_rounded,
              size: 35,
            ),
            onPressed: () {
              setState(() {});
            },
          ),
          SizedBox(width: 20),
          IconButton(
            icon: Icon(
              Icons.delete_forever,
              size: 35,
            ),
            onPressed: () {
              db.deleteAll("jobs");
              Timer(Duration(seconds: 1), () {
                setState(() {});
              });
            },
          ),
          SizedBox(width: 30),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(30),
        child: ListView(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 300,
                    ),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        prefixIcon: Icon(
                          Icons.search_sharp,
                          size: 25,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.grey[700],
                        hintText: "Buscar",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 50),
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
                  SizedBox(width: 50),
                  ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Publicar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/Postpage');
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 40,
              child: Row(
                children: [
                  Text(
                    "Programación",
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
              margin: EdgeInsets.only(
                top: 5,
              ),
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
                      rows: Listadewidget(snapshot.data),
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
            SizedBox(height: 15),
            Container(
              height: 40,
              child: Row(
                children: [
                  Text(
                    "Diseño",
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
                      rows: Listadewidget(snapshot.data),
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

  DBFirebase db = DBFirebase();

  late Key key;

  List<DataRow> Listadewidget(List<Job>? list) {
    List<DataRow> Lista = [];

    for (int i = 0; (i < list!.length && i < 5); i++) {
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

      Lista.add(dato);
    }

    return Lista;
  }
}
