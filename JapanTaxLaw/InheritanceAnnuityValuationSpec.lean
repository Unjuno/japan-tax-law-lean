import JapanTaxLaw.InheritanceAnnuityValuation

/-!
# InheritanceAnnuityValuation spec — 相続税法 art. 25

Sources (pinned): Law id 325AC0000000073 /
  revision 325AC0000000073_20260401_506AC0000000008 / enforcement 2026-04-01.

Independent restatement: 第1号は金額×90/100（floor）、第2号は解約返戻金そのまま。
複利計算の基礎額は caller-established。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

def specAnnuityRightValue (noSurrenderClause : Bool) (base : Money) : Money :=
  if noSurrenderClause then base * 90 / 100 else base

example : specAnnuityRightValue true 1_000_000 = 900_000 := by decide
example : specAnnuityRightValue false 1_000_000 = 1_000_000 := by decide

def agreeInheritanceAnnuityValuation : Bool :=
  [0, 1, 99, 100, 1_000, 1_000_000].all fun base =>
    annuityRightValue true base == specAnnuityRightValue true base
    && annuityRightValue false base == specAnnuityRightValue false base

example : agreeInheritanceAnnuityValuation = true := by decide

end JapanTaxLaw
