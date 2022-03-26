<?php

// use quick sort to sor the list from index start to end. use & to update array in place
function quick_sort(&$arr, $start, $end) {
    
    if($start >= $end) {
        return;
    }
    // pivot is last element
    $pivot = $arr[$end];
    // scan to the right
    $left = $start;
    // scan to the left
    $right = $end - 1;
    while($left <= $right) {
        // scan until it reaches a value equal or larger than the pivot
        while($left <= $right && $arr[$left] < $pivot) {
            $left++;
        }
        // scan until it reaches a value equal or smaller than the pivot
        while($left <= $right && $arr[$right] > $pivot) {
            $right--;
        }
        if($left <= $right) {
            swap($arr, $left, $right);
            $left++;
            $right--;
        }
    }
    // put pivot into its correct position
    swap($arr, $left, $end);
    // recursively sort left and right part
    quick_sort($arr, $start, $left - 1);
    quick_sort($arr, $left + 1, $end);

}

function swap(&$arr, $i, $j) {
    $temp = $arr[$i];
    $arr[$i] = $arr[$j];
    $arr[$j] = $temp;
}

$test_array = array(100, 54, 7, 2, 5, 4, 1, -100, 0, 3);
echo "Original: ";
echo implode(', ',$test_array);
echo "\nSorted: ";
// sort the array in place
quick_sort($test_array, 0, count($test_array) - 1);
echo implode(', ',$test_array);

?>