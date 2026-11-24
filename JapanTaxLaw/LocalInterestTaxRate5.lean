import JapanTaxLaw.TaxFinance

/-!
# LocalInterestTaxRate5 — 地方税法 art.71の6 利子割の税率 5%（bounded L4 モデル）

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

原文逐語: 「利子割の税率は、百分の五とする。」

Computation（税率の適用のみ、単位: 円、Nat の下限切り捨て）:
  interestShareTax(base) = base * 5 / 100

Scope / NOT MODELLED:
  - 利子等の定義（地方税法 art.71の5）、課税標準・納税義務者・申告・徴収は NOT MODELLED。
  - 端数処理、他の特定税目（配当割・株式等譲渡所得割）の税率は NOT MODELLED。
  - 本モデルは税率 5/100 のみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalInterestTaxRate5

open JapanTaxLaw.TaxFinance

/-- 原文の税率（百分の五）。 -/
def interestRateNum : Nat := 5

/-- 税率の分母（百）。 -/
def interestRateDen : Nat := 100

/-- 所与の課税標準に 5/100 を適用した税額。 -/
def interestShareTax (base : Money) : Money :=
  base * interestRateNum / interestRateDen

example : interestShareTax 0 = 0 := by decide
example : interestShareTax 1 = 0 := by decide
example : interestShareTax 100 = 5 := by decide
example : interestShareTax 1_000 = 50 := by decide

end JapanTaxLaw.LocalInterestTaxRate5
