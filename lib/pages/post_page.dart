import '../database/db.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  PostPage({Key? key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController _controllerCompany = TextEditingController();
  TextEditingController _controllerPosition = TextEditingController();
  TextEditingController _controllerUbication = TextEditingController();
  TextEditingController _controllerDescription = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  DBFirebase db = DBFirebase();
  String? radioGroup;
  String? selectGroup;

  @override
  void initState() {
    radioGroup = "1";
    selectGroup = "Desing";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Divider(height: 30),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Publicar Trabajo",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 20),
                      Flexible(
                        flex: 1,
                        child: Divider(height: 30),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      Text(
                        "Company",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 30),
                      Expanded(
                        child: TextField(
                          controller: _controllerCompany,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Category",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 90),
                      Expanded(
                        child: DropdownButton<String>(
                          value: selectGroup,
                          items: <String>[
                            'Desing',
                            'Developer Senior',
                            'Developer Junior',
                            'Analisty',
                            'Product Manager'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectGroup = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Type",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 40),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              "Op1",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            Radio(
                              value: "1",
                              groupValue: radioGroup,
                              onChanged: (value) {
                                radioGroup = value.toString();
                                setState(() {});
                              },
                            ),
                            Text(
                              "Op2",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            Radio(
                              value: "2",
                              groupValue: radioGroup,
                              onChanged: (value) {
                                radioGroup = value.toString();
                                setState(() {});
                              },
                            ),
                            Text(
                              "Op3",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            Radio(
                              value: "3",
                              groupValue: radioGroup,
                              onChanged: (value) {
                                radioGroup = value.toString();
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Position",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 30),
                      Expanded(
                        child: TextField(
                          controller: _controllerPosition,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Ubication",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 30),
                      Expanded(
                        child: TextField(
                          controller: _controllerUbication,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "Description",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 30),
                      Expanded(
                        child: TextField(
                          controller: _controllerDescription,
                          maxLines: 5,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: Colors.red),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 30),
                      Expanded(
                        child: TextField(
                          controller: _controllerEmail,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: OutlinedButton(
                      child: Text(
                        "Entrar",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        db.set(
                          "jobs",
                          "-",
                          _controllerCompany.text,
                          radioGroup.toString(),
                          _controllerPosition.text,
                          _controllerUbication.text,
                          selectGroup.toString(),
                          _controllerDescription.text,
                          _controllerEmail.text,
                        );
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
