// curry :: ((a, b) -> c) -> a -> b -> c
// uncurry :: (a -> b -> c) -> (a, b) -> c

public func curry <A, B, C> (f: (A, B) -> C) -> A -> B -> C {
  return { a in { b in f(a, b) } }
}

public func uncurry <A, B, C> (f: A -> B -> C) -> (A, B) -> C {
  return { a, b in f(a)(b) }
}
