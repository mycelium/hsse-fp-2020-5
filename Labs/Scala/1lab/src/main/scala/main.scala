pascal(5, 6)

balance("(((((()))(((()))))()))".toList)
balance("( ()))35)".toList)

countChange(10, List(1, 2, 5))

def pascal(c: Int, r: Int): Int = {
    if (c == 0 || r == 0) 1
    else pascal(c - 1, r - 1) + pascal(c - 1, r)
}


def balance(chars: List[Char]): Boolean = {
 def scopes(chars: List[Char], s: Int = 0): Boolean = chars match {
   case Nil => s == 0
   case _ if s < 0 => false
   case '(' :: tail => scopes(tail, s+1)
   case ')' :: tail => scopes(tail, s-1)
   case _ :: tail => scopes(tail, s)
 }
      scopes(chars, 0)
    }


def countChange(money: Int, coins: List[Int]): Int = {

    def loop(money: Int, coins: List[Int]): Int = {
      if (money < 0 || coins.isEmpty ) 0
      else if (money == 0 ) 1
      else loop(money, coins.tail) + loop(money - coins.head, coins)
    }

    loop(money, coins)
  }

