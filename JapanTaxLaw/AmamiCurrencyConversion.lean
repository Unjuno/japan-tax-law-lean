import JapanTaxLaw.TaxFinance

/-!
# AmamiCurrencyConversion — 奄美群島税法施行令 art.6（通貨の換算）bounded L4 モデル

Sources (pinned):
  Law id: 328CO0000000407
  Revision: 328CO0000000407_19660331_341CO0000000078
  Raw snapshot: data/raw/328CO0000000407_19660331_341CO0000000078.law.json
  Article Num 6, flat/normalized leaf text 78 chars, U+3000 count 0.

原文逐語:
  「奄美群島税法及びこれに基く規則の適用については、当該法令の規定に定められている金額は、
    当該金額一円につき三円の割合で換算した金額とする。」

Computation（原文逐語から導出）:
  converted = amount × 3（一円につき三円）。

Scope: 換算の対象となる「当該法令の規定に定められている金額」は caller-established。
-/

namespace JapanTaxLaw.AmamiCurrencyConversion

open JapanTaxLaw.TaxFinance

/-- 換算割合: 一円につき三円 = 3。 -/
def conversionFactor : Money := 3

/-- 換算後の金額 = 金額 × 3。 -/
def convert (amount : Money) : Money := amount * conversionFactor

example : conversionFactor = 3 := by decide
example : convert 1 = 3 := by decide
example : convert 1000 = 3000 := by decide
example : convert 0 = 0 := by decide

theorem convert_mono : ∀ {a b : Money}, a ≤ b → convert a ≤ convert b := by
  intro a b h; unfold convert; exact Nat.mul_le_mul_right 3 h

end JapanTaxLaw.AmamiCurrencyConversion
