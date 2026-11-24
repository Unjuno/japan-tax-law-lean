import JapanTaxLaw.TaxFinance

/-!
# PropertyAcquisitionSpecialRate3 — 地方税法 附則 art.11の2 不動産取得税標準税率 3%（bounded L4 モデル）

Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
raw data/raw/325AC0000000226_20261101_508AC0000000002.law.json.
原文逐語: 「平成十八年四月一日から令和九年三月三十一日までの間に住宅又は土地の取得が行われた
場合における不動産取得税の標準税率は、第七十三条の十五の規定にかかわらず、百分の三とする。」
Computation（税率の適用のみ、単位: 円、Nat の下限切り捨て）:
  specialTax(base) = base * 3 / 100
Scope / NOT MODELLED: 適用期間の判定・住宅又は土地の認定・課税標準・端数・申告徴収は
NOT MODELLED。本モデルは税率 3/100 のみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.PropertyAcquisitionSpecialRate3

open JapanTaxLaw.TaxFinance

/-- 特例税率（百分の三）。 -/
def specialRateNum : Nat := 3
def specialRateDen : Nat := 100

/-- 所与の課税標準に 3/100 を適用した税額。 -/
def specialTax (base : Money) : Money :=
  base * specialRateNum / specialRateDen

example : specialTax 0 = 0 := by decide
example : specialTax 1 = 0 := by decide
example : specialTax 100 = 3 := by decide
example : specialTax 1_000 = 30 := by decide

end JapanTaxLaw.PropertyAcquisitionSpecialRate3
