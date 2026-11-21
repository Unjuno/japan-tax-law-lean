import JapanTaxLaw.TaxFinance

/-!
# ConsumptionTaxSpecialDate — 消費税特例の政令で定める日（政令 art.7）bounded L4 モデル

Sources (pinned):
  Law id: 502CO0000000160
  Revision: 502CO0000000160_20260401_508CO0000000104
  Raw snapshot: data/raw/502CO0000000160_20260401_508CO0000000104.law.json
  Article Num 7, flat/normalized leaf text 56 chars, U+3000 count 0.

原文逐語:
  「法第十条第一項に規定する政令で定める日は、令和三年一月三十一日とする。」

Computation（原文逐語から導出、日付定数のみ）:
  日付 = 令和3年1月31日 = 西暦 2021-01-31（元号換算: 令和元年=2019 → 令和3年=2021）
  eraYear = 3, month = 1, day = 31

Scope / NOT MODELLED:
  - 法10条1項の特例の内容・適用条件は NOT MODELLED。
  - 日付の曜日判定・期間算術は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.ConsumptionTaxSpecialDate

open JapanTaxLaw.TaxFinance

/-- 令和3年 = 西暦 2021 年（元号換算）。 -/
def westernYear : Nat := 2019 + 3 - 1
/-- 月 = 1。 -/
def month : Nat := 1
/-- 日 = 31。 -/
def day : Nat := 31

example : westernYear = 2021 := by decide
example : month = 1 := by decide
example : day = 31 := by decide

end JapanTaxLaw.ConsumptionTaxSpecialDate
