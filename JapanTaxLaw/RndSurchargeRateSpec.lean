import JapanTaxLaw.RndSurchargeRate

/-!
# RndSurchargeRate spec — independent restatement of the art. 10 surcharge rate
Sources (pinned): law 332AC0000000026, revision 332AC0000000026_20261101_507AC0000000013, art. 10 paragraph 3 item 3.
Normative id: NORM|b1aa09eb096d7d23f144edb485e04f1792ac94e62641d6b3a1f14cf170de0250
Independent restatement: 百分の十 = 10/100, which is 10 * 100 * 1000 units of
1/100000 percent. The surcharge is (r - threshold) * 2, truncated down to a
three-decimal grid by division by 100, then capped with min at the threshold.
The implementation instead uses addition, modulo subtraction and a conditional
cap; the agreement grid is kernel-decided, not assumed.
-/

namespace JapanTaxLaw.RndSurchargeRate

def specSurchargeRate (r : Nat) : Nat :=
  let threshold : Nat := 10 * 100 * 1000
  let excess : Nat := if threshold < r then r - threshold else 0
  let doubled : Nat := excess * 2
  let floored : Nat := (doubled / 100) * 100
  min floored threshold

example : specSurchargeRate 1000000 = 0 := by decide
example : specSurchargeRate 2000000 = 1000000 := by decide

def agreeRndSurchargeRate : Bool :=
  [0, 1, 999999, 1000000, 1000001, 1000050, 1000099, 1000100,
   1500000, 2000000, 3000000].all fun r =>
    surchargeRate r == specSurchargeRate r

example : agreeRndSurchargeRate = true := by decide

end JapanTaxLaw.RndSurchargeRate
