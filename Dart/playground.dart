import 'dart:convert';

String? x;

void main(List<String> args) {
  // int? age;
  // age!.toString();
  // String a = f();
  // print(a);
  // if (x == null) {
  //   print('x is null');
  // } else {
  //   print('x is not null');
  // }
  // print(x?.toLowerCase());
  // var numbers = [1, 2, 3, 4];
  // print(numbers);
  // var squares = numbers.map((n) => n * n);
  // print(squares);
  var products = jsonDecode('''
[
  {"name": "Screwdriver", "price": 42.00},
  {"name": "Wingnut", "price": 0.50}
]
''');
  print(products);
  print(products.runtimeType);
  print(products[0].runtimeType);
  print(products[0]['name'].runtimeType);
  var values = products.map((product) => product['price'] as double);
  var totalPrice = values.fold(0.0, (a, b) => a + b); // 42.5.
  print(totalPrice);
}

String f() {
  int? x;
  if (x == null) {
    return 'x is null';
  } else {
    return 'x is not null';
  }
}
