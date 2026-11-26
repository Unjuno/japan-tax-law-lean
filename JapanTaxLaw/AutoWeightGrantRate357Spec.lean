import JapanTaxLaw.AutoWeightGrantRate357

/-!
# AutoWeightGrantRate357 spec — independent restatement of the art. 1 per-mille grant
Sources (pinned): law 346AC0000000090, revision 346AC0000000090_20260401_508AC0000000002, art. 1(1).
Normative id: NORM|4b3f2123925910ae0cbf27eb99163228afeeb7961f5c09335fc9957585ba6a7a
Independent restatement: decompose the revenue into whole thousands and the
remainder, apply 357 to each part, then add. This is a different expression
from the implementation's single multiplication/division. Agreement is
kernel-decided on the listed grid, never assumed.
-/

namespace JapanTaxLaw.AutoWeightGrantRate357

def specGrantAmount (revenue : Nat) : Nat :=
  let whole := (revenue / 1000) * 357
  let fraction := (revenue % 1000) * 357 / 1000
  whole + fraction

example : specGrantAmount 1001 = 357 := by decide
example : specGrantAmount 123456 = 44073 := by decide

def agreeAutoWeightGrantRate357 : Bool :=
  [0, 1, 356, 357, 358, 999, 1000, 1001, 10000, 123456].all fun n =>
    grantAmount n == specGrantAmount n

example : agreeAutoWeightGrantRate357 = true := by decide

end JapanTaxLaw.AutoWeightGrantRate357
