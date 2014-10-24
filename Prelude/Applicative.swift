/// class Functor f => Applicative f where
///   pure  :: a -> f a
///   (<*>) :: f (a -> b) -> f a -> f b

infix operator <*> {
  associativity left
  precedence 100
}


// Optional

public func pure <A> (a: A) -> A? {
  return .Some(a)
}

public func <*> <A, B> (f: (A -> B)?, a: A?) -> B? {
  switch (f, a) {
  case (.Some(let f), .Some(let a)):
    return f(a)
  default:
    return nil
  }
}


// Array

public func pure <A> (a: A) -> [A] {
  return [a]
}

public func <*> <A, B> (fs: [(A -> B)], xs: [A]) -> [B] {
  return reduce(fs, []) { res, f in
    res + (f <^> xs)
  }
}

// TODO ziplist...
