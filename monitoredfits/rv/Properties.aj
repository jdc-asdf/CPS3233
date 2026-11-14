

package rv;

import fits.*;
import java.util.HashMap;






public aspect Properties {
static void setupVerification() {
initialisehasTriggerede5a5();initialisestatee5a5();
}

static HashMap<UserInfo, Boolean> hasTriggerede5a5 = new HashMap<UserInfo, Boolean>();
static void initialisehasTriggerede5a5(){hasTriggerede5a5= new HashMap<UserInfo, Boolean>(); }


static HashMap<UserInfo, String> statee5a5 = new HashMap<UserInfo, String>();
static void initialisestatee5a5(){statee5a5= new HashMap<UserInfo, String>(); }



before (UserInfo u): call(* UserInfo.makeFrozen(..)) &&
    args() &&
    target(u) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!hasTriggerede5a5.computeIfAbsent(u, (k) -> false) && statee5a5.computeIfAbsent(u, (k) -> "Unfrozen").equals("Unfrozen") && (true)) {
{}statee5a5.put(u,"Frozen");hasTriggerede5a5.put(u,true);}
  }


before (UserInfo u): call(* UserInfo.makeUnFrozen(..)) &&
    args() &&
    target(u) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!hasTriggerede5a5.computeIfAbsent(u, (k) -> false) && statee5a5.computeIfAbsent(u, (k) -> "Unfrozen").equals("Frozen") && (true)) {
{}statee5a5.put(u,"Unfrozen");hasTriggerede5a5.put(u,true);}
  }


before (UserInfo u): call(* UserInfo.withdrawFrom(..)) &&
    target(u) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!hasTriggerede5a5.computeIfAbsent(u, (k) -> false) && statee5a5.computeIfAbsent(u, (k) -> "Unfrozen").equals("Frozen") && (true)) {
{}statee5a5.put(u,"BAD");hasTriggerede5a5.put(u,true);System.out.println("Withdrawal while frozen");}
  }


before (): call(* *.*(..)) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (true) { hasTriggerede5a5 = new HashMap<UserInfo,Boolean> ();}
  }

after (): call(* *.*(..)) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (true) { hasTriggerede5a5 = new HashMap<UserInfo,Boolean> (); }
  }

}