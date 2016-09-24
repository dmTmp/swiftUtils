extension String{
  func lengthenString(len:Int) -> String {
    if self.characters.count == len { return self }
    return (self + " ").lengthenString(len:len)
  }
  public var description : String { return self }
}
