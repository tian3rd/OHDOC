import 'dart:math';

class User {
  int _id;
  String _name;
  String? nickname;

  User({int id = 0, String name = 'anonymous'})
      : _id = id,
        _name = name;

  User.anonymous() : this();

  @override
  String toString() {
    return 'User(id: $_id, name: $_name)';
  }
}

class Actor {
  String name;
  var filmography = <String>[];

  Actor(this.name, this.filmography);

  Actor.rey({this.name = 'Daisy Ridley'}) {
    filmography = ['The Force Awankens', 'Murder on the Orient Express'];
  }

  String get debut => '$name debuted in ${filmography.first}';
}

class Student {
  final String firstName;
  final String lastName;
  int grade;

  Student({
    firstName,
    lastName,
    grade,
  })  : this.firstName = firstName,
        this.lastName = lastName,
        this.grade = grade;

  @override
  String toString() {
    return 'Student: $firstName $lastName with grade $grade';
  }
}

class Sphere {
  // _radius is package private not class private
  final num _radius;
  static const num pi = 3.14159265358979;

  const Sphere({required num radius})
      : assert(radius > 0),
        this._radius = radius;

  num get volume => 4 * pi / 3 * pow(_radius, 3);
  num get surface => 4 * pi * pow(_radius, 2);

  @override
  String toString() =>
      'Sphere with radius $_radius has volume $volume and surface $surface';
}

void main(List<String> args) {
  print(Actor.rey().debut);
  var user1 = User();
  print(user1);

  var bert = Student(firstName: 'bert', grade: 95, lastName: 'B');
  var ernie = Student(firstName: 'ernie', grade: 85, lastName: 'E');
  print('$bert\n$ernie');

  var s1 = Sphere(radius: 12);
  print(s1);
}
