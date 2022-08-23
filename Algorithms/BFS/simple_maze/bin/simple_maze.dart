import 'dart:collection';

/**
 * see readme for more info about this problem
 */

class Maze {
  List<int> startPnt;
  List<int> endPnt;
  List<int> mazeSize;
  List<List<String>> maze;

  Maze(
      {mazeSize,
      required this.startPnt,
      required this.endPnt,
      required this.maze})
      : mazeSize = [maze.length, maze[0].length]; // maze size can be inferred

  int bfs() {
    // generate 2D distance list to record shortest distance from start point
    var dist = List.generate(
        mazeSize[0], (index) => List.filled(mazeSize[1], -1, growable: false));
    var q = Queue<List<int>>();
    q.add(startPnt);
    dist[startPnt[0]][startPnt[1]] = 0;
    var dx = [-1, 0, 1]; // extend from top to bottom row
    var dy = [-1, 0, 1]; // extend from left to right col
    while (q.isNotEmpty) {
      var pnt = q.removeFirst();
      if (pnt[0] == endPnt[0] && pnt[1] == endPnt)
        break;
      else {
        for (int i in dx) {
          for (int j in dy) {
            var nbr = [pnt[0] + i, pnt[1] + j];
            if (0 <= nbr[0] &&
                nbr[0] < mazeSize[0] &&
                0 <= nbr[1] &&
                nbr[1] < mazeSize[1] &&
                (i + j).isOdd && // up, down, left, right (not all 8 directions)
                dist[nbr[0]][nbr[1]] == -1) {
              if (maze[nbr[0]][nbr[1]] == '.') {
                dist[nbr[0]][nbr[1]] = dist[pnt[0]][pnt[1]] + 1;
                q.add(nbr);
              }
            }
          }
        }
      }
    }
    // print('final dist: $dist');
    return dist[endPnt[0]][endPnt[1]];
  }
}

void main(List<String> args) {
  var m1 = Maze(startPnt: [
    0,
    0
  ], endPnt: [
    4,
    1
  ], maze: [
    '.###'.split(''),
    '.###'.split(''),
    '....'.split(''),
    '.##.'.split(''),
    '....'.split(''),
  ]);
  print(
      'Shortest steps from point ${m1.startPnt} to ${m1.endPnt} is ${m1.bfs()}');

  var m2 = Maze(startPnt: [
    3,
    3,
  ], endPnt: [
    4,
    1
  ], maze: [
    '.###'.split(''),
    '.###'.split(''),
    '....'.split(''),
    '.##.'.split(''),
    '....'.split(''),
  ]);
  print(
      'Shortest steps from point ${m2.startPnt} to ${m2.endPnt} is ${m2.bfs()}');
}
