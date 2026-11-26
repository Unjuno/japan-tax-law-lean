import JapanTaxLaw.CustomsTariffUndertakingValidity5Years

/-!
# CustomsTariffUndertakingValidity5Years spec — 五年以内の独立定式

Sources (pinned): law 143AC0000000054, revision 143AC0000000054_20260601_508AC0000000005.
Independent restatement: 「五年を超えない」を否定形 `!(specMax < years)` として
書く。実装識別子を再利用しない。有限領域の kernel-decided 検査であり
普遍的な定理ではない。
-/

namespace JapanTaxLaw.CustomsTariffUndertakingValidity5Years

def specMaxYears : Nat := 5

def specWithinValidity (years : Nat) : Bool := ! (specMaxYears < years)

example : specWithinValidity 5 = true := by decide
example : specWithinValidity 6 = false := by decide

def agreeCustomsTariffUndertakingValidity5Years : Bool :=
  [0, 1, 4, 5, 6, 10].all (fun y =>
    undertakingAcceptable y == specWithinValidity y)

example : agreeCustomsTariffUndertakingValidity5Years = true := by decide

end JapanTaxLaw.CustomsTariffUndertakingValidity5Years
