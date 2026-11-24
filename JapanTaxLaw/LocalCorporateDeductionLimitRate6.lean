import JapanTaxLaw.TaxFinance

/-!
# LocalCorporateDeductionLimitRate6 — 地方税法施行令 art.48の13 法人税控除限度額の6%（bounded L4 モデル）

Sources (pinned): law 325CO0000000245, revision 325CO0000000245_20261101_508CO0000000083,
raw data/raw/325CO0000000245_20261101_508CO0000000083.law.json.
原文逐語: 「法人税の控除限度額に百分の六を乗じて計算した額とする。」
Computation: corporateDeductionLimit(limit) = limit * 6 / 100（Nat の下限切り捨て）。
Scope / NOT MODELLED: 法第321条の8第38項の控除限度額そのものの算定、端数処理、
他の号・項の控除額は NOT MODELLED。本モデルは 6/100 の適用のみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalCorporateDeductionLimitRate6

open JapanTaxLaw.TaxFinance

def deductionRateNum : Nat := 6
def deductionRateDen : Nat := 100

def corporateDeductionLimit (corporateTaxLimit : Money) : Money :=
  corporateTaxLimit * deductionRateNum / deductionRateDen

example : corporateDeductionLimit 0 = 0 := by decide
example : corporateDeductionLimit 1 = 0 := by decide
example : corporateDeductionLimit 100 = 6 := by decide
example : corporateDeductionLimit 1_000 = 60 := by decide

end JapanTaxLaw.LocalCorporateDeductionLimitRate6
