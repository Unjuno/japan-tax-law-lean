import JapanTaxLaw.TaxFinance

/-!
# LocalStockTransferTaxRate5 — 地方税法 art.71の49 株式等譲渡所得割の税率 5%（bounded L4 モデル）

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

原文逐語: 「株式等譲渡所得割の税率は、百分の五とする。」

Computation（税率の適用のみ、単位: 円、Nat の下限切り捨て）:
  stockTransferShareTax(base) = base * 5 / 100

Scope / NOT MODELLED:
  - 「株式等」の定義、譲渡所得金額の算定、申告・徴収・端数処理は NOT MODELLED。
  - 上場株式等の軽減税率（租税特別措置法）・配当割・利子割は NOT MODELLED。
  - 本モデルは税率 5/100 のみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalStockTransferTaxRate5

open JapanTaxLaw.TaxFinance

/-- 原文の税率（百分の五）。 -/
def stockTransferRateNum : Nat := 5

/-- 税率の分母（百）。 -/
def stockTransferRateDen : Nat := 100

/-- 所与の課税標準に 5/100 を適用した税額。 -/
def stockTransferShareTax (base : Money) : Money :=
  base * stockTransferRateNum / stockTransferRateDen

example : stockTransferShareTax 0 = 0 := by decide
example : stockTransferShareTax 1 = 0 := by decide
example : stockTransferShareTax 100 = 5 := by decide
example : stockTransferShareTax 1_000 = 50 := by decide

end JapanTaxLaw.LocalStockTransferTaxRate5
