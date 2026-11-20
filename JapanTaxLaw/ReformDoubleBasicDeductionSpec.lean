import JapanTaxLaw.ReformDoubleBasicDeduction

/-!
# ReformDoubleBasicDeduction spec — 税制改革関連法 art.9 の独立整数定式
Sources (pinned): law 363AC0000000107, revision 363AC0000000107_19881230_000000000000000.
Independent restatement: 「二倍に引き上げる」= base × 2.
-/

namespace JapanTaxLaw.ReformDoubleBasicDeduction

def specDouble (base : Nat) : Nat := base * 2
example : specDouble 500 = 1000 := by decide

def agreeReformDoubleBasicDeduction : Bool :=
  [0, 1, 500, 1_000_000].all fun b => doubled b == specDouble b
example : agreeReformDoubleBasicDeduction = true := by decide

end JapanTaxLaw.ReformDoubleBasicDeduction
