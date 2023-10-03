import Debug "mo:base/Debug"; // Import the Debug module
import Time "mo:base/Time"; // Import the Time module
import Float "mo:base/Float"; // Import the Float module

actor Bank {
  let id = 543435;   // let is a constant and it's immutable
  stable var currentBalance:Float = 300; // It's a variable that can be changed
  currentBalance := 100;  // Replaces the value of currentBalance with 100
  Debug.print("Current balance is: "); // Prints "Current balance is:"
  // Debug.print only allows strings to be printed, to handle type mismatch, use debug_show inside it.
  Debug.print(debug_show(id)); // Prints "543435"
  stable var then = Time.now(); //Time when the user deposits money


/* Orthogonal persistence is used to store the state of the canister. It is a feature of the Motoko language.
   The state of the canister is stored in the blockchain and is not lost even if the canister is deleted.
   A variable can be made persistent by using the keyword stable. */


// Defining the parameters as name:data type
  public func topUp(amount: Float) {
     currentBalance += amount;
     Debug.print(debug_show(currentBalance));
  };  // semicolon is required to end a function

  // Call a function from the terminal through the following syntax,provided that the function is public
  // dfx canister call [canister name] [function name]
  // Or you could just register the canister in the candid Id.


  public func withdraw(amount: Float) {
    if (amount > currentBalance) {
      Debug.print("Insufficient funds");
    } else {
      currentBalance -= amount;
      Debug.print(debug_show(currentBalance));
    };
  };


// This function is a query function or a read-only function. It doesn't change the state of the canister and is much
// faster and cheaper to call than the update methods which changes states by writing to the blockchain.
// Async is used so that the faster functions are not slowed by the slower ones and render independently.
  public query func getBalance() : async Float {
    return currentBalance;
  };

  public func compoundInterest() {
  let now = Time.now();
    let timeElapsed = now - then;
    let timeS = timeElapsed / 1000000000;
    currentBalance := currentBalance * (1.01 ** Float.fromInt(timeS));
    Debug.print(debug_show(currentBalance));
    then := now;
  };

}




