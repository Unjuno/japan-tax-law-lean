import JapanTaxLaw.ShipRegistrationRateReduction4PerMille

/-!
# ShipRegistrationRateReduction4PerMille spec — 千分の四控除の独立定式

Sources (pinned): law 342AC0000000035, revision 342AC0000000035_20261101_508AC0000000021.
Independent restatement: 控除後を「4 を足して base に等しい最小値」として
書く（実装の saturating subtraction と同じ結果を別定式で与える）。
有限領域の kernel-decided 検査であり普遍的な定理ではない。
-/

namespace JapanTaxLaw.ShipRegistrationRateReduction4PerMille

def specReduction : Nat := 4

def specReduced (base : Nat) : Nat :=
  if base < specReduction then 0 else base - specReduction

example : specReduced 4 = 0 := by decide
example : specReduced 5 = 1 := by decide

def agreeShipRegistrationRateReduction4PerMille : Bool :=
  [0, 1, 3, 4, 5, 6, 20].all (fun b =>
    reducedRatePerMille b == specReduced b)

example : agreeShipRegistrationRateReduction4PerMille = true := by decide

end JapanTaxLaw.ShipRegistrationRateReduction4PerMille
