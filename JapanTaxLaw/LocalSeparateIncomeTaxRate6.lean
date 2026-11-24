import JapanTaxLaw.TaxFinance

/-!
# LocalSeparateIncomeTaxRate6 — 地方税法 art.328の3 分離課税所得割 6%（bounded L4 モデル）

Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
raw data/raw/325AC0000000226_20261101_508AC0000000002.law.json.
原文逐語: 「分離課税に係る所得割の税率は、百分の六とする。」
Computation: separateIncomeTax(base) = base * 6 / 100（Nat の下限切り捨て）。
Scope / NOT MODELLED: 市町村民税側の対象所得・課税標準・端数・申告徴収は NOT MODELLED。
本モデルは税率 6/100 のみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalSeparateIncomeTaxRate6

open JapanTaxLaw.TaxFinance

def separateRateNum : Nat := 6
def separateRateDen : Nat := 100

def separateIncomeTax (base : Money) : Money :=
  base * separateRateNum / separateRateDen

example : separateIncomeTax 0 = 0 := by decide
example : separateIncomeTax 1 = 0 := by decide
example : separateIncomeTax 100 = 6 := by decide
example : separateIncomeTax 1_000 = 60 := by decide

end JapanTaxLaw.LocalSeparateIncomeTaxRate6
