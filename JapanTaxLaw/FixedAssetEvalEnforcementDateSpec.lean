import JapanTaxLaw.FixedAssetEvalEnforcementDate

/-!
# FixedAssetEvalEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 328M50000002091, revision 328M50000002091_20240425_506M60000008045.
-/

namespace JapanTaxLaw.FixedAssetEvalEnforcementDate

def specDate : Nat × Nat × Nat := (1982, 4, 1)

/-- 独立定式: 辞書順の成分比較（実装の dateKey 符号化とは異なる定式）。 -/
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 1982) ||
  (d.1 == 1982 && decide (d.2.1 > 4)) ||
  (d.1 == 1982 && d.2.1 == 4 && decide (d.2.2 >= 1))

example : specDate = (1982, 4, 1) := by decide

def agreeFixedAssetEvalEnforcementDate : Bool :=
  [(1980,1,1), (1982,3,31), (1982,4,1), (1982,4,2), (2000,1,1)].all fun d => inForce d == specInForce d

example : agreeFixedAssetEvalEnforcementDate = true := by decide

end JapanTaxLaw.FixedAssetEvalEnforcementDate
