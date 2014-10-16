// (.) :: (b -> c) -> (a -> b) -> a -> c

// • is easily typed with Option-8
infix operator • {
  associativity right
}

public func • <A, B, C> (f: B -> C, g: A -> B) -> A -> C {
  return { x in f(g(x)) }
}
