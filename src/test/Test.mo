import Greet "canister:greet";

persistent actor Test {

  public func call_greet() : async Text {
    let r : Text = await Greet.greet("World");
    return "Said: '" # r # "'";
  };

};
