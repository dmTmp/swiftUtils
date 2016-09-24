public enum Result<OK,Err:Error> { //railway programming type, inspired by the rust equivalent
  case success(OK)
  case error(Err)

  public func flatMap<New>(f:(OK) -> Result<New, Err>) -> Result<New,Err> {
    switch self {
      case .error(let a): return Result<New,Err>.error(a)
      case .success(let original):
        switch f(original) {
          case .success(let transformed): return Result<New,Err>.success(transformed)
          case      .error(let newError): return Result<New,Err>.error(  newError   )
        }
    }
  }
  public func map<New>( f:@escaping (OK) -> New) -> Result<New,Err> {
    let f1 : (OK) -> Result<New,Err> = {.success(f($0))}
    return self.flatMap(f:f1)
  }
  public func onValue(e:(Err) -> (), s:(OK) -> ()) {
    switch self {
      case .success(let a): s(a)
      case .error(let a)  : e(a)
    }
  }
  public static func fromFunction<In, Out, Err>(nonFailing f:@escaping (In) -> Out) -> (In) -> Result<Out,Err> {
    return {.success(f($0))}
  }
}
