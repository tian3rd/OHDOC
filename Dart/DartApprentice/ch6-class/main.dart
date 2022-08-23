import 'user.dart';

void main(List<String> args) {
  var user1 = User.anonymous();

  var user2 = User(id: 1, name: 'ceo');

  user2.nickname = 'anon';
  print(user2.nickname);

  print(Actor.rey().debut);
  var user3 = User();
  print(user3);

  var bert = Student(firstName: 'bert', grade: 95, lastName: 'B');
  var ernie = Student(firstName: 'ernie', grade: 85, lastName: 'E');
  print('$bert\n$ernie');

  var s1 = Sphere(radius: 12);
  print(s1);
}
