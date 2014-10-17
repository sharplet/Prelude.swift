// Test helper functions

func double(x: Int) -> Int { return x * 2 }
func triple(x: Int) -> Int { return x * 3 }
func square(x: Int) -> Int { return x * x }

func show<T: Printable>(t: T) -> String { return t.description }
