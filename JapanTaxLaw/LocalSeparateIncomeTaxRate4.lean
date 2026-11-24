import JapanTaxLaw.TaxFinance

/-!
# LocalSeparateIncomeTaxRate4 — 地方税法 art.50の4 分離課税所得割 4%（bounded L4 モデル）

Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
raw data/raw/325AC0000000226_20261101_508AC0000000002.law.json.
原文逐語: 「分離課税に係る所得割の税率は、百分の四とする。」
Computation: separateIncomeTax(base) = base * 4 / 100（Nat の下限切り捨て）。
Scope / NOT MODELLED: 分離課税の対象所得・課税標準の算定、他の税率条項、端数処理、
申告・徴収は NOT MODELLED。本モデルは税率 4/100 のみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalSeparateIncomeTaxRate4

open JapanTaxLaw.TaxFinance

def separateRateNum : Nat := 4
def separateRateDen : Nat := 100

def separateIncomeTax (base : Money) : Money :=
  base * separateRateNum / separateRateDen

example : separateIncomeTax 0 = 0 := by decide
example : separateIncomeTax 1 = 0 := by decide
example : separateIncomeTax 100 = 4 := by decide
example : separateIncomeTax 1_000 = 40 := by decide

end JapanTaxLaw.LocalSeparateIncomeTaxRate4
