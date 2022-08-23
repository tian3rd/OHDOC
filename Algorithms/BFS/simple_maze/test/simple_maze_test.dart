import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:test/test.dart';

import '../bin/simple_maze.dart';

void main() async {
  var mazeFileNames =
      ['maze01.txt', 'maze02.txt'].map((e) => 'assets/' + e).toList();
  var mazeData0 = await maze(mazeFileNames[0]);
  var mazeData1 = await maze(mazeFileNames[1]);
  // print(maze1);
  var maze0 =
      Maze(startPnt: mazeData0[1], endPnt: mazeData0[2], maze: mazeData0[3]);
  var maze1 =
      Maze(startPnt: mazeData1[1], endPnt: mazeData1[2], maze: mazeData1[3]);

  group('Test shortest paths: \n', () {
    test('test ${mazeFileNames[0]}', () {
      expect(maze0.bfs(), equals(22));
    });

    test('test ${mazeFileNames[1]}', () {
      expect(maze1.bfs(), equals(7));
    });
  });
}

Future<List> maze(String fname) async {
  final file = File(fname);
  late List<int> mazeSize;
  late List<int> startPnt;
  late List<int> endPnt;
  List<List<String>> maze = [];

  Stream<String> lines =
      file.openRead().transform(utf8.decoder).transform(LineSplitter());
  try {
    int i = 0;
    await for (var line in lines) {
      if (i == 0) {
        mazeSize = pointFrom(line);
        print('maze size: $mazeSize');
      } else if (i == 1) {
        startPnt = pointFrom(line);
      } else if (i == 2) {
        endPnt = pointFrom(line);
      } else {
        maze.add(line.split('').toList());
      }
      i++;
    }
    print('File processed');
  } catch (e) {
    print('Error while reading file $fname');
  }
  // return [mazeSize, startPnt, endPnt, maze];
  return [mazeSize, startPnt, endPnt, maze];
}

// helper func to read 2 numbers in str to a point list [x, y]
var pointFrom =
    (String line) => line.split(' ').map((e) => int.parse(e)).toList();
