import JapanTaxLaw.TaxFinance

/-!
# NursingCareBand5_10 — 地方税法施行規則 art. 10_7_3（介護医療院入所者の割合 百分の五以上百分の十未満）

Sources (pinned):

  Law id: 329M50000002023
  Revision: 329M50000002023_20261101_508M60000008045
  Raw snapshot: data/raw/329M50000002023_20261101_508M60000008045.law.json

Pinned 原文: 「無料又は低額利用に係る介護医療院入所者の割合が百分の五以上百分の十未満である事業の用に供する固定資産（無料又は低額利用に係る介護医療院入所者の割合から百分の五を減じた割合に五を乗じた割合に百分の七十五を加えて得た割合に相当する部分に限る。）」

Scoped claim: only the 介護医療院入所者の割合 百分の五以上百分の十未満 percentage band (in percent, `[lo, hi)`);
the associated assessment-base reduction factor is caller-established.
-/

namespace JapanTaxLaw.NursingCareBand5_10

def lowerPercent : Nat := 5
def upperPercent : Nat := 10

def inBand (x : Nat) : Bool :=
  decide (lowerPercent <= x ∧ x < upperPercent)

theorem bounds_value : lowerPercent = 5 ∧ upperPercent = 10 := by
  constructor <;> rfl

end JapanTaxLaw.NursingCareBand5_10
