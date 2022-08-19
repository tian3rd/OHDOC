import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:test/test.dart';

import '../lib/poj2386.dart';

void main() async {
  List land1 = await readLand('assets/poj2386/land01.txt');
  List land2 = await readLand('assets/poj2386/land02.txt');
  List land3 = await readLand('assets/poj2386/land03.txt');

  // refer to https://pub.dev/packages/test#writing-tests for writing tests
  group('Test number of lakes: \n', () {
    test('description', () {
      expect(11.remainder(3), equals(2));
    });

    test('test land01.txt', () {
      var land = new Land(land1[0], land1[1], land1[2]);
      expect(land.countPools(), equals(3));
    });

    test('test land02.txt', () {
      var land = new Land(land2[0], land2[1], land2[2]);
      expect(land.countPools(), equals(0));
    });

    test('test land03.txt', () {
      var land = new Land(land3[0], land3[1], land3[2]);
      expect(land.countPools(), equals(1));
    });
  });
}

Future<List> readLand(String filename) async {
  final file = new File(filename);
  int nr, nc;
  List<List<int>> land = [];
  Stream<String> lines = file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(LineSplitter()); // ncnvert stream to individual lines.
  try {
    int i = 0;
    await for (var line in lines) {
      if (i == 0) {
        var info = line.split(' ').map((e) => int.parse(e)).toList();
        nr = info[0];
        nc = info[1];
        // print('First line: $nr nrws, $nc nclumns');
      } else {
        land.add(line.split('').map((e) {
          if (e == 'W')
            return 1;
          else
            return 0;
        }).toList());
      }
      i++;
      // print('$line: ${line.length} characters');
    }
    print('File is now closed.');
  } catch (e) {
    print('Error: $e');
  }
  print([nr, nc, land]);
  return [nr, nc, land];
}
