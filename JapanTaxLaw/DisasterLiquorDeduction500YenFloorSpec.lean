import JapanTaxLaw.DisasterLiquorDeduction500YenFloor

/-!
# DisasterLiquorDeduction500YenFloor spec — 五百円未満控除除外の独立定式

Sources (pinned): law 322AC0000000175, revision 322AC0000000175_20220101_503AC0000000011.
Independent restatement: 「五百円以上か」を `specFloor <= amount` として
書き、実装の否定形 `<` とは異なる比較を用いる。実装識別子は再利用しない。
有限領域の kernel-decided 検査であり普遍的な定理ではない。
-/

namespace JapanTaxLaw.DisasterLiquorDeduction500YenFloor

def specMinYen : Nat := 500

def specDeductible (amount : Nat) : Bool := decide (specMinYen <= amount)

def specEffective (amount : Nat) : Nat :=
  if specDeductible amount then amount else 0

example : specDeductible 499 = false := by decide
example : specDeductible 500 = true := by decide
example : specEffective 499 = 0 := by decide

def agreeDisasterLiquorDeduction500YenFloor : Bool :=
  [0, 1, 499, 500, 501, 999, 1200].all (fun a =>
    (deductionApplied a == specDeductible a) &&
    (effectiveDeduction a == specEffective a))

example : agreeDisasterLiquorDeduction500YenFloor = true := by decide

end JapanTaxLaw.DisasterLiquorDeduction500YenFloor
