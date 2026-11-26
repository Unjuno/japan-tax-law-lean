import JapanTaxLaw.TaxFinance

/-!
# EmploymentSubsidyAge55to65 — 地方税法施行規則 art. 24_2（雇入れ日の年齢 五十五歳以上六十五歳未満）

Sources (pinned):

  Law id: 329M50000002023
  Revision: 329M50000002023_20261101_508M60000008045
  Raw snapshot: data/raw/329M50000002023_20261101_508M60000008045.law.json

Pinned 原文: 「政令第五十六条の十七の二第三号に掲げる者で同号に掲げる雇用奨励金の支給に係る雇入れの日において年齢五十五歳以上六十五歳未満のもの」

Scoped claim: only the 雇入れ日の年齢 五十五歳以上六十五歳未満 numeric condition; other conditions are caller-established.
-/

namespace JapanTaxLaw.EmploymentSubsidyAge55to65

def lowerBound : Nat := 55
def upperBound : Nat := 65

def inBand (x : Nat) : Bool := decide (lowerBound <= x ∧ x < upperBound)

theorem bounds_value : lowerBound = 55 ∧ upperBound = 65 := by
  constructor <;> rfl

end JapanTaxLaw.EmploymentSubsidyAge55to65
