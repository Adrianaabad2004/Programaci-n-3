import 'package:flutter/foundation.dart';

class Job {
  String _id;
  String _company;
  String _type;
  String _position;
  String _ubication;
  String _category;
  String _description;
  String _email;

  Job(
    this._id,
    this._company,
    this._type,
    this._position,
    this._ubication,
    this._category,
    this._description,
    this._email,
  );

  set Id(String value) {
    _id = value;
  }

  String get Id => _id;

  set Company(String value) {
    _company = value;
  }

  String get Company => _company;

  set Type(String value) {
    _type = value;
  }

  String get Type => _type;

  set Position(String value) {
    _position = value;
  }

  String get Position => _position;

  set Ubication(String value) {
    _ubication = value;
  }

  String get Ubication => _ubication;

  set Category(String value) {
    _category = value;
  }

  String get Category => _category;

  set Description(String value) {
    _description = value;
  }

  String get Description => _description;

  set Email(String value) {
    _email = value;
  }

  String get Email => _email;
}
