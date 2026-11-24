import JapanTaxLaw.TaxFinance

/-!
# NursingCareBand2_5 — 地方税法施行規則 art. 10_7_3（介護医療院入所者の割合 百分の二以上百分の五未満）

Sources (pinned):

  Law id: 329M50000002023
  Revision: 329M50000002023_20261101_508M60000008045
  Raw snapshot: data/raw/329M50000002023_20261101_508M60000008045.law.json

Pinned 原文: 「無料又は低額利用に係る介護医療院入所者の割合が百分の二以上百分の五未満である事業の用に供する固定資産（無料又は低額利用に係る介護医療院入所者の割合から百分の二を減じた割合に十五を乗じた割合に百分の三十を加えて得た割合に相当する部分に限る。）」

Scoped claim: only the 介護医療院入所者の割合 百分の二以上百分の五未満 percentage band (in percent, `[lo, hi)`);
the associated assessment-base reduction factor is caller-established.
-/

namespace JapanTaxLaw.NursingCareBand2_5

def lowerPercent : Nat := 2
def upperPercent : Nat := 5

def inBand (x : Nat) : Bool :=
  decide (lowerPercent <= x ∧ x < upperPercent)

theorem bounds_value : lowerPercent = 2 ∧ upperPercent = 5 := by
  constructor <;> rfl

end JapanTaxLaw.NursingCareBand2_5
