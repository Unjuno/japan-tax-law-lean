import JapanTaxLaw.TaxFinance

/-!
# PowerDevelopmentTaxPenalty — 電源開発促進税法 art.12(4)（罰金の上限）

Sources (pinned): law `349AC0000000079`,
raw `data/raw/349AC0000000079_20250601_504AC0000000068.law.json`, Article 12(4).

原文逐語:
  「前項の犯罪に係る販売電気に対する電源開発促進税に相当する金額が
   五十万円を超える場合には、情状により、同項の罰金は、五十万円を超え
   当該電源開発促進税に相当する金額以下とすることができる。」

Computation: upper = max(500000, equivalentTax). Unit 円, domain Nat.
NOTE: an earlier draft read "三倍" from a neighbouring paragraph; the pinned
article text has NO multiplier here. The adversarial source check caught it.
Criminal elements and sentencing discretion are NOT MODELLED.
-/

namespace JapanTaxLaw.PowerDevelopmentTaxPenalty

open JapanTaxLaw.TaxFinance

def standardMinYen : Money := 500_000

/-- 罰金の上限 = max(五十万円, 相当金額)。 -/
def upperFine (equivalentTax : Money) : Money :=
  if standardMinYen < equivalentTax then equivalentTax else standardMinYen

example : upperFine 0 = 500_000 := by decide
example : upperFine 499_999 = 500_000 := by decide
example : upperFine 500_000 = 500_000 := by decide
example : upperFine 500_001 = 500_001 := by decide
example : upperFine 1_000_000 = 1_000_000 := by decide

end JapanTaxLaw.PowerDevelopmentTaxPenalty
