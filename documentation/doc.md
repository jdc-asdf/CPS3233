# CPS3233 Assignment Part A

## The Property

Once a user freezes their profile, none of their money accounts may be withdrawn from until they unfreeze it.

Based on the information given in Section 3.1 Usermode:
> "frozen users may not perform money transfers"

## The Formalism

<p align="center">
  <img src="partAAutomaton.svg" alt="State diagram" width="400">
</p>

The property was formalised using an Automaton. An automaton was chosen because the property defines an order of events that should occur. The order in this case is: if a profile goes from unfrozen to frozen it then may not have withdraws on its accounts, but if it is unfrozen then it can allow withdraws again. The account can be represented as states in the automaton while the freezing/unfreezing and withdrawl can be represented as transitions in the automaton.
