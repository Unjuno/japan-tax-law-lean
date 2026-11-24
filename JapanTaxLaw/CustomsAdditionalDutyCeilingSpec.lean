import JapanTaxLaw.CustomsAdditionalDutyCeiling

/-!
# CustomsAdditionalDutyCeiling spec — independent restatement of the art. 9 duty ceiling
Sources (pinned): law 143AC0000000054, revision 143AC0000000054_20260601_508AC0000000005, art. 9(1)(1), law 143AC0000000054.
Normative id: NORM|6f539e8731e012eed30b16cceef593768d521afcc1dbef314ac47b5b7929dbb3
Independent restatement: the ceiling is the residual of the price gap after
the tariff, computed with an explicit non-positive guard and subtraction;
the duty condition is the negation of "ceiling is strictly below the duty".
This is a different formulation from the implementation's conditional
saturating subtraction and direct <= comparison. Agreement is kernel-decided.
-/

namespace JapanTaxLaw.CustomsAdditionalDutyCeiling

def specGap (taxableValue : Nat) (fairWholesale : Nat) : Nat :=
  if taxableValue <= fairWholesale then 0 else taxableValue - fairWholesale

def specCeiling (taxableValue : Nat) (fairWholesale : Nat) (tariff : Nat) : Nat :=
  let gap := specGap taxableValue fairWholesale
  if gap <= tariff then 0 else gap - tariff

def specWithinCeiling (additional : Nat) (taxableValue : Nat) (fairWholesale : Nat)
    (tariff : Nat) : Bool :=
  not (specCeiling taxableValue fairWholesale tariff < additional)

example : specCeiling 100 50 10 = 40 := by decide
example : specWithinCeiling 41 100 50 10 = false := by decide

def agreeCustomsAdditionalDutyCeiling : Bool :=
  [(0,100,50,10), (1,100,50,10), (39,100,50,10), (40,100,50,10),
   (41,100,50,10), (0,50,100,0), (1,50,100,0), (10,50,100,0)].all fun x =>
    withinCeiling x.1 x.2.1 x.2.2.1 x.2.2.2 == specWithinCeiling x.1 x.2.1 x.2.2.1 x.2.2.2

example : agreeCustomsAdditionalDutyCeiling = true := by decide

end JapanTaxLaw.CustomsAdditionalDutyCeiling
