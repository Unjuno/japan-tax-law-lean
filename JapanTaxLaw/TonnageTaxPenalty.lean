import JapanTaxLaw.TaxFinance

/-!
# TonnageTaxPenalty — 特別とん税法 art.10（罰則）bounded L4 モデル

Sources (pinned):
  Law id: 332AC0000000038
  Revision: 332AC0000000038_20250601_504AC0000000068
  Raw snapshot: data/raw/332AC0000000038_20250601_504AC0000000068.law.json
  Article Num 10, flat/normalized leaf text 178 chars, U+3000 count 0.

原文逐語:
  §1 「偽りその他不正の行為により、特別とん税を免れ、又は納付すべき特別とん税を
       納付しなかつた者は、三年以下の拘禁刑若しくは五十万円以下の罰金に処し、
       又はこれを併科する。」
  §2 「前項の犯罪の実行に着手してこれを遂げない者についても、同項の例による。」

Computation（原文逐語から導出）:
  maxImprisonmentYears = 3（三年以下）
  maxFineYen = 500,000（五十万円以下）

Scope: 本スライスは罰則の数値上限と「併科可能性」の規定のみを扱う。
犯罪の成立要件（不正行為の具体的認定）、未遂の範囲、§3 の徴収手続は NOT MODELLED。
実際の科刑は司法判断に委ねられ、本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.TonnageTaxPenalty

open JapanTaxLaw.TaxFinance

/-- 拘禁刑の上限 = 三年以下。 -/
def maxImprisonmentYears : Nat := 3
/-- 罰金の上限 = 五十万円以下。 -/
def maxFineYen : Money := 500_000

/-- 刑が原文の上限内か（境界: 3年/50万円は合法、4年/500001円は超過）。 -/
def withinLimits (years fine : Nat) : Bool :=
  years ≤ maxImprisonmentYears && fine ≤ maxFineYen

example : maxImprisonmentYears = 3 := by decide
example : maxFineYen = 500_000 := by decide
example : withinLimits 3 500_000 = true := by decide
example : withinLimits 0 0 = true := by decide
example : withinLimits 4 500_000 = false := by decide
example : withinLimits 3 500_001 = false := by decide

end JapanTaxLaw.TonnageTaxPenalty
