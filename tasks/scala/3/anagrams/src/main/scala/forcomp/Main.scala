package Main


  object Main extends App {

    import forcomp._

    println(Anagrams.sentenceAnagrams(List("Real", "fun")))
    println(Anagrams.sentenceOccurrencesMap(List("The", "eyes")) == Anagrams.sentenceOccurrencesMap(List("They", "see")))
  }

