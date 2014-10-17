/// ($) :: (a -> b) -> a -> b

public func applyTo <A, B> (f: A -> B, a: A) -> B {
  return f(a)
}

// applicationTo :: a -> (a -> B) -> b
// applicationTo y = ($ y)
//
public func applicationTo <A, B> (a: A) -> (A -> B) -> B {
  return flip(applyTo)(a)
}
