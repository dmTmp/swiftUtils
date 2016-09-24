func doUntilSuccess<T>(f:() throws->T) -> T {
  let g = try? f()
  if let success = g {
    return success
  }
  return doUntilSuccess(f:f)
}
