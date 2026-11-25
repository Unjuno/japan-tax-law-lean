import JapanTaxLaw.InheritanceTaxFalseReportFineCap500k

/-!
# InheritanceTaxFalseReportFineCap500k spec — 50万円上限の独立定式
Sources (pinned): law 325AC0000000073, revision 325AC0000000073_20260401_506AC0000000008,
art. 70 (第七十条). Independent restatement: fine <= 500000（境界値を含む）。
-/

namespace JapanTaxLaw.InheritanceTaxFalseReportFineCap500k

def specFineCap : Nat := 500000

def specWithinCap (fine : Nat) : Bool :=
  fine <= 500000

example : specWithinCap 500000 = true := by decide
example : specWithinCap 500001 = false := by decide

def agreeInheritanceTaxFalseReportFineCap500k : Bool :=
  [0, 1, 499999, 500000, 500001, 1000000].all fun f =>
    withinCap f == specWithinCap f

example : agreeInheritanceTaxFalseReportFineCap500k = true := by decide

end JapanTaxLaw.InheritanceTaxFalseReportFineCap500k
