//
// Identity
//

// id :: a -> a
//
public func id <A> (a: A) -> A {
  return a
}



//
//  Function composition and application
//

// (.) :: (b -> c) -> (a -> b) -> a -> c
//
// • is easily typed with Option-8
//
infix operator • {
  associativity right
}

public func • <A, B, C> (f: B -> C, g: A -> B) -> A -> C {
  return { x in f(g(x)) }
}

// ($) :: (a -> b) -> a -> b
//
infix operator § {
  associativity left
  precedence 10
}

public func § <A, B> (f: A -> B, a: A) -> B {
  return f(a)
}



//
// Currying
//

// curry :: ((a, b) -> c) -> a -> b -> c
//
public func curry <A, B, C> (f: (A, B) -> C) -> A -> B -> C {
  return { a in { b in f(a, b) } }
}

// uncurry :: (a -> b -> c) -> (a, b) -> c
//
public func uncurry <A, B, C> (f: A -> B -> C) -> (A, B) -> C {
  return { a, b in f(a)(b) }
}

// flip :: (a -> b -> c) -> b -> a -> c
//
public func flip <A, B, C> (f: (A, B) -> C) -> B -> A -> C {
  return { b in { a in f(a, b) } }
}
