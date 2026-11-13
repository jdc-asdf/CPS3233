

package rv;

import fits.*;






public aspect Properties {
static void setupVerification() {
}

before (): call(* UserInfo.makeFrozen(..)) &&
    args() &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!Verification.hasTriggerede5a5 && Verification.statee5a5.equals("Unfrozen") && (true)) {{}Verification.statee5a5 = "Frozen";Verification.hasTriggerede5a5 = true;}
  }

before (): call(* UserInfo.makeUnFrozen(..)) &&
    args() &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!Verification.hasTriggerede5a5 && Verification.statee5a5.equals("Frozen") && (true)) {{}Verification.statee5a5 = "Unfrozen";Verification.hasTriggerede5a5 = true;}
  }

before (): call(* BankAccount.withdraw(..)) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!Verification.hasTriggerede5a5 && Verification.statee5a5.equals("Frozen") && (true)) {{}Verification.statee5a5 = "BAD";Verification.hasTriggerede5a5 = true; System.out.println("Withdrawal while frozen");}
  }

before (): call(* *.*(..)) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (true) { Verification.hasTriggerede5a5 = false;}
  }

after (): call(* *.*(..)) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (true) { Verification.hasTriggerede5a5 = false; }
  }

}