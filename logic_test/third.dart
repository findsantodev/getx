/// ===============
/// Element Counter
/// ===============
///
/// [Instruction]
/// buat sebuah function untuk menghitung jumlah masing-masing elemen yang muncul dari array input yang diberikan
///
/// [Description]
/// 1. function menerima sebuah array sebagai input
/// 2. function Mengembalikan sebuah object sebagai output yang berisikan elemen yang muncul
///    dan jumlah kemunculannya dari input yang diberikan.
///
/// [Example]
/// @input = [1, 2, 3, 4, 5, 4, 3, 2, 4]
///
/// @process
/// angka 1 muncul 1 kali
/// angka 2 muncul 2 kali
/// angka 3 muncul 2 kali
/// angka 4 muncul 3 kali
/// angka 5 muncul 1 kali
///
/// @output
/// {
///    1: 1,
///    2: 2,
///    3: 2,
///    4: 3,
///    5: 1,
/// }
///
/// [Rules]
/// 1. `Wajib dikerjakan dengan pseudocode`.

void main() {
  Counter().count();
}

class Counter {
  List case1 = [
    'Joyful',
    'Infinite',
    'Humble',
    'Joyful',
    'Glory',
    'King',
    'Humble',
    'Infinite'
  ];
  List case2 = [
    true,
    true,
    false,
    true,
    false,
    true,
    false,
    false,
    true,
    false
  ];
  List case3 = [
    1,
    2,
    3,
    4,
    5,
    6,
    4,
    3,
    2,
    5,
    6,
    8,
    7,
    6,
    9,
    8,
    7,
    0,
    8,
    7,
    6,
    5,
    4,
    3
  ];

  count() {
    var elements = case1;
    var map = {};

    for (var element in elements) {
      if (!map.containsKey(element)) {
        map[element] = 1;
      } else {
        map[element] += 1;
      }
    }

    print(map);
  }
}


/// =======PSEUDOCODE
/// Counting frequencies of array elements
/// 
/// Begin
/// Declare and input Array
/// Declare map as temp
/// 
/// 
/// Start Looping to check element in array
/// 
///   If map doesn't have the same key as element
///     Set new key to map and add value 1
///   
///   Else map has the same key as element
///     add 1 value of the key
/// 
/// End of Loop
/// 
/// Print map as output