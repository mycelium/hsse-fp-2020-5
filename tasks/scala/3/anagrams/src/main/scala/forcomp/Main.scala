package forcomp
import scala.collection.mutable

object Main extends App {
  import Anagrams._

  println("Word anagrams for word 'Sometimes'")
  println(wordAnagrams("Sometimes"))

  println("Sentence anagrams for sentence 'To the Moon'")
  println(sentenceAnagrams(List("To", "the", "Moon")))
}
