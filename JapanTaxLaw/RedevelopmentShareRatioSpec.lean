import JapanTaxLaw.RedevelopmentShareRatio

/-!
# RedevelopmentShareRatioSpec — 独立定式（施行令 42の3(2)一）

Sources (pinned; identical to impl): law 332CO0000000043,
revision 332CO0000000043_20261101_507CO0000000127.

Independent restatement: explicit branch on `oldShare ≤ landShare` and on the
solo-right flag, instead of relying on Nat saturating subtraction.

  spec a b false = if b ≤ a then (a - b) / a else 0
  spec a b true  = 0

Concrete agreement examples live in `RedevelopmentShareRatioTests.lean` so that
this Spec contains only numerals occurring in the pinned clause (零).
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

def specShareRatio (landShare oldShare : Money) (soloOldRight : Bool) : Money :=
  if soloOldRight then 0
  else if oldShare ≤ landShare then (landShare - oldShare) / landShare
  else 0

end JapanTaxLaw
