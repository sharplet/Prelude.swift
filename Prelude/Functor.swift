/// class Functor f where
///   fmap :: (a -> b) -> f a -> f b

infix operator <^> {
  associativity right
}


// Optional

public func fmap <A, B> (f: A -> B, a: A?) -> B? {
  return map(a, f)
}

public func <^> <A, B> (f: A -> B, a: A?) -> B? {
  return fmap(f, a)
}


// Array

public func fmap <A, B> (f: A -> B, a: [A]) -> [B] {
  return map(a, f)
}

public func <^> <A, B> (f: A -> B, a: [A]) -> [B] {
  return fmap(f, a)
}


// Dictionary

public func fmap <A, B, K> (f: A -> B, source: [K: A]) -> [K: B] {
  return reduce(source, [K: B]()) { (var result, entry: (key: K, value: A)) in
    result[entry.key] = f(entry.value)
    return result
  }
}

public func <^> <A, B, K> (f: A -> B, source: [K: A]) -> [K: B] {
  return fmap(f, source)
}


// ((->) r)

public func fmap <A, B, R> (f: A -> B, g: R -> A) -> R -> B {
  return f • g
}

public func <^> <A, B, R> (f: A -> B, g: R -> A) -> R -> B {
  return fmap(f, g)
}
