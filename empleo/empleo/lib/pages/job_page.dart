import 'package:flutter/material.dart';

class JobPage extends StatefulWidget {
  JobPage({Key? key}) : super(key: key);

  @override
  _JobPageState createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          arguments["company"],
          style: TextStyle(
            color: Colors.white60,
            fontSize: 25,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 90,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        arguments["company"],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Posición: " +
                            arguments["position"] +
                            " - " +
                            arguments["category"],
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 90,
                  child: Icon(
                    Icons.work_rounded,
                    size: 100,
                    color: Colors.cyan.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            Text(
              "Ubicación: " + arguments["ubication"],
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            Text(
              arguments["description"],
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 19,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Contacto: " + arguments["email"],
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Envianos tu CV al correo.",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 40),
            Row(
              children: [
                ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "Aplicar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green.withOpacity(0.6),
                  ),
                  onPressed: () {},
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "Reportar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red.withOpacity(0.6),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
