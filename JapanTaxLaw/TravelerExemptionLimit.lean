import JapanTaxLaw.TaxFinance

/-!
# TravelerExemptionLimit — 関税法施行令 art.40（特定旅客携帯品の関税免除上限）bounded L4 モデル

Sources (pinned):
  Law id: 335CO0000000069
  Revision: 335CO0000000069_20260401_508CO0000000085
  Raw snapshot: data/raw/data/raw/335CO0000000069_20260401_508CO0000000085.law.json
  Article Num 40, flat/normalized leaf text 64 chars, U+3000 count 0.

原文逐語:
  「法第十四条第一項に規定する政令で定める金額は、二十万円とする。」

Computation（原文逐語から導出、金額定数のみ）:
  limitYen = 200,000（二十万円）
  isAtOrBelowLimit(amount) = amount <= 200,000

Scope / NOT MODELLED:
  - 「特定旅客」の認定、携帯品の範囲、免除の適用手続は NOT MODELLED。
  - 法14条1項の他の要件は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.TravelerExemptionLimit

open JapanTaxLaw.TaxFinance

/-- 関税免除の金額上限 = 二十万円。 -/
def limitYen : Money := 200_000

/-- 上限額以下か（境界: 200,000 は含む）。 -/
def isAtOrBelowLimit (amount : Money) : Bool :=
  amount <= limitYen

example : limitYen = 200_000 := by decide
example : isAtOrBelowLimit 0 = true := by decide
example : isAtOrBelowLimit 199_999 = true := by decide
example : isAtOrBelowLimit 200_000 = true := by decide
example : isAtOrBelowLimit 200_001 = false := by decide

end JapanTaxLaw.TravelerExemptionLimit
