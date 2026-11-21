import JapanTaxLaw.TaxFinance

/-!
# MortgageRegistrationCapital — 登録免許税法施行令 art.26（抵当権登記が課税される法人の資本金）bounded L4 モデル

Sources (pinned):
  Law id: 342CO0000000146
  Revision: 342CO0000000146_20261001_507CO0000000124
  Raw snapshot: data/raw/data/raw/342CO0000000146_20261001_507CO0000000124.law.json
  Article Num 26, flat/normalized leaf text 76 chars, U+3000 count 0.

原文逐語:
  「法別表第三の一の四の項及び一の五の項に規定する政令で定める金額は、五億円とする。」

Computation（原文逐語から導出、金額定数のみ）:
  capitalThresholdYen = 500,000,000（五億円）
  isAtOrBelowThreshold(capital) = capital <= 500,000,000

Scope / NOT MODELLED:
  - 「普通法人」「抵当権等の設定等の登記」の認定、別表の項の適用は NOT MODELLED。
  - 資本金等の額の算定手続は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.MortgageRegistrationCapital

open JapanTaxLaw.TaxFinance

/-- 閾値 = 五億円。 -/
def capitalThresholdYen : Money := 500_000_000

/-- 閾値以下か（境界: 500,000,000 は含む）。 -/
def isAtOrBelowThreshold (capital : Money) : Bool :=
  capital <= capitalThresholdYen

example : capitalThresholdYen = 500_000_000 := by decide
example : isAtOrBelowThreshold 0 = true := by decide
example : isAtOrBelowThreshold 499_999_999 = true := by decide
example : isAtOrBelowThreshold 500_000_000 = true := by decide
example : isAtOrBelowThreshold 500_000_001 = false := by decide

end JapanTaxLaw.MortgageRegistrationCapital
