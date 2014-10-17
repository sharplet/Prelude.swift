/// class Functor f => Applicative f where
///   pure  :: a -> f a
///   (<*>) :: f (a -> b) -> f a -> f b

infix operator <*> {
  associativity left
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
