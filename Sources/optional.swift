extension Optional {
  func onNil<E>(error:E) -> Result<Wrapped,E> {
    switch self {
      case .some(let s): return .success(s)
      case .none       : return .error(error)
    }
  }
}
