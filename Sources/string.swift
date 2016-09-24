extension String{
  public func lengthenString(len:Int) -> String {
    if self.characters.count == len { return self }
    return (self + " ").lengthenString(len:len)
  }
}
