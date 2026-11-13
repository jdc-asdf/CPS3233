# CPS3233 Assignment Part A
## Julian David Cassar

<div style="page-break-before: always;"></div>

## The Property

> Once a user freezes their profile, none of their money accounts may be withdrawn from until they unfreeze it.

Based on the information given in Section 3.1 Usermode:
"frozen users may not perform money transfers"

## The Formalism

<p align="center">
  <img src="partAAutomaton.svg" alt="State diagram" width="400">
</p>

The property was formalised using an Automaton. An automaton was chosen because the property defines an order of events that should occur. The order in this case is: if a profile goes from unfrozen to frozen it then may not have withdraws on its accounts, but if it is unfrozen then it can allow withdraws again. The account can be represented as states in the automaton while the freezing/unfreezing and withdrawl can be represented as transitions in the automaton.

## The Monitor (Results)

```
Running scenario 1.
This scenario should violate property 1.
Withdrawal while frozen

Running scenario 2.
This scenario should not violate property 1.
```

Scenario 1:
Freeze the profile and then make an external payment of 10. The resulting withdrawal occurs while frozen, the monitor returns BAD.

Scenario 2:
Freeze and Unfreeze the profile and make an external payment of 10. The resulting withdrawal occurs while not frozen so not violation occurs.

The results match the expected outcome.

## Iteration History

Initially considered the property to be debited and credited, (i.e. no money goes in or out of the account) but the wording of apendix seems to  point towards the user themsevles **performing* a transfer not someone else sending them money.

Changed from checking the front end  for freezes to checking user info. This is a  more appropriate place to check as if freezing is extended to be done through other features it would require the monitor to be modified.

