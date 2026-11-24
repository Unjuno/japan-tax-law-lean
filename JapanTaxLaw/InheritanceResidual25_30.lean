import JapanTaxLaw.TaxFinance

/-!
# InheritanceResidual25_30 — 相続税法 art. 23（地上権の残存期間 二十五年超三十年以下）

Sources (pinned):

  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json

Pinned 原文: 「残存期間が二十五年を超え三十年以下のもの及び地上権で存続期間の定めのないもの」

Scoped claim: only the 地上権の残存期間 二十五年超三十年以下 interval; other conditions are caller-established.
-/

namespace JapanTaxLaw.InheritanceResidual25_30

def lowerBound : Nat := 25
def upperBound : Nat := 30

def inBand (x : Nat) : Bool :=
  decide (lowerBound < x ∧ x <= upperBound)

theorem bounds_value : lowerBound = 25 ∧ upperBound = 30 := by
  constructor <;> rfl

end JapanTaxLaw.InheritanceResidual25_30
