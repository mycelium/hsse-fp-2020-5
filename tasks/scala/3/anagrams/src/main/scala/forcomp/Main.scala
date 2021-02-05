
object Main extends App {
  val w: String = "hEvvgkljlllo";
  val s: Sentence = List("dsfasffa", "fadfaDJ")

  val occ: Occurrences = List(('a', 2), ('b', 2))

  val x: Occurrences = List(('a',2), ('a',1), ('b',2), ('b',1))
  val y: Occurrences = List(('a',2), ('a',1))

  val sent: Sentence = List("yes", "man")


  println(wordAnagrams("abel"))

  println(dictionaryByOccurrences)

  println(dictionaryByOccurrences(wordOccurrences("eat")))

  println(combinations(occ))

  println(subtract(x, y))

  println(sentenceAnagrams(sent))
}
