/// flip :: (a -> b -> c) -> b -> a -> c

public func flip <A, B, C> (f: (A, B) -> C) -> B -> A -> C {
  return { b in { a in f(a, b) } }
}
