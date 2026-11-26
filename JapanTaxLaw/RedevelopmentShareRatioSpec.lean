import JapanTaxLaw.RedevelopmentShareRatio

/-!
# RedevelopmentShareRatioSpec — 独立定式（施行令 42の3(2)一）

Sources (pinned; identical to impl): law 332CO0000000043,
revision 332CO0000000043_20261101_507CO0000000127.

Independent restatement: explicit branch on `oldShare ≤ landShare` and on the
solo-right flag, instead of relying on Nat saturating subtraction.

  spec a b false = if b ≤ a then (a - b) / a else 0
  spec a b true  = 0

各 agree* は decide による有限点の一致確認であり、法的意味の等価証明ではない。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

def specShareRatio (landShare oldShare : Money) (soloOldRight : Bool) : Money :=
  if soloOldRight then 0
  else if oldShare ≤ landShare then (landShare - oldShare) / landShare
  else 0

def rsrAgreeZero : Bool := redevelopmentShareRatio 0 7 false == specShareRatio 0 7 false
def rsrAgreeHalf : Bool := redevelopmentShareRatio 100 50 false == specShareRatio 100 50 false
def rsrAgreeOdd : Bool := redevelopmentShareRatio 999 333 false == specShareRatio 999 333 false
def rsrAgreeExceed : Bool := redevelopmentShareRatio 50 80 false == specShareRatio 50 80 false
def rsrAgreeSolo : Bool := redevelopmentShareRatio 100 20 true == specShareRatio 100 20 true

example : rsrAgreeZero = true := by decide
example : rsrAgreeHalf = true := by decide
example : rsrAgreeOdd = true := by decide
example : rsrAgreeExceed = true := by decide
example : rsrAgreeSolo = true := by decide

end JapanTaxLaw
