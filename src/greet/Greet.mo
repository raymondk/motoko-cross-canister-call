persistent actor Greet {
  public func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };
};
