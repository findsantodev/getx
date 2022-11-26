// /**
//  * Expected print result:
//  * b
//  * be
//  * bee
//  * beev
//  * beeve
//  */
void main() {
  Asterix().run();
}

class Asterix {
  String word = "beever";
  void run() {
    for (var i = 0; i < word.length; i++) {
      print(word.substring(0, i));
    }
  }
}
