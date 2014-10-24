/// class Functor f where
///   fmap :: (a -> b) -> f a -> f b


// Optional

public func fmap <A, B> (f: A -> B, a: A?) -> B? {
  return map(a, f)
}


// Array

public func fmap <A, B> (f: A -> B, a: [A]) -> [B] {
  return map(a, f)
}


// Dictionary

public func fmap <A, B, K> (f: A -> B, source: [K: A]) -> [K: B] {
  return reduce(source, [K: B]()) { (var result, entry: (key: K, value: A)) in
    result[entry.key] = f(entry.value)
    return result
  }
}


// ((->) r)

public func fmap <A, B, R> (f: A -> B, g: R -> A) -> R -> B {
  return f • g
}
