def pascal(c: Int, r: Int): Int = {
  if (c == 0 || r == 0) 1
  else pascal(c - 1, r - 1) + pascal(c - 1, r)
}

pascal(0, 0)