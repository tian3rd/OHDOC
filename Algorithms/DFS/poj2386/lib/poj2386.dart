/**
 * http://poj.org/problem?id=2386 for more information about this problem.
 */

class Land {
  int nr, nc;
  List<List<int>> land;
  Land(this.nr, this.nc, this.land);

  /**
   * DFS for changing all connected water (1) to land (0).
   * @param r row index
   * @param c column index
   * @return void
   */
  void dfs(int r, int c) {
    // mark this spot as land
    land[r][c] = 0;
    // check all 8 directions and turn them to land if they are water
    for (var dr = -1; dr <= 1; dr++) {
      for (var dc = -1; dc <= 1; dc++) {
        if (r + dr >= 0 &&
            r + dr < nr &&
            c + dc >= 0 &&
            c + dc < nc &&
            land[r + dr][c + dc] == 1) {
          dfs(r + dr, c + dc);
        }
      }
    }
  }

  /**
   * Count the number of lakes in the land.
   * @return int
   */
  int countPools() {
    int numPools = 0;
    for (var r = 0; r < nr; r++) {
      for (var c = 0; c < nc; c++) {
        // start from water, and fill with all connected pools
        if (land[r][c] == 1) {
          dfs(r, c);
          numPools++;
        }
      }
    }
    return numPools;
  }

  @override
  String toString() {
    return 'Land{nr: $nr, nc: $nc, land: $land}';
  }
}

void main(List<String> args) async {
  print("Hello World!".split('').toList());
}
