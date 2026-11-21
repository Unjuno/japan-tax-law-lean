import JapanTaxLaw.TaxExaminerCount

/-!
# TaxExaminerCount spec — 国税審査官定数 の独立整数定式
Sources (pinned): law 345M50000040017, revision 345M50000040017_20260710_508M60000040048.
Independent restatement: 上限 174 人以下（境界含む）。
-/

namespace JapanTaxLaw.TaxExaminerCount

def specCap (n : Nat) : Bool := n <= 174

example : specCap 174 = true := by decide
example : specCap 175 = false := by decide

def agreeTaxExaminerCount : Bool :=
  [0, 1, 173, 174, 175, 200].all fun n => isWithinCap n == specCap n

example : agreeTaxExaminerCount = true := by decide

end JapanTaxLaw.TaxExaminerCount
