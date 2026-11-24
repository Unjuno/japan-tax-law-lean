import JapanTaxLaw.TaxFinance

/-!
# LightMotorVehicleTaxShortfallSurcharge35 — 地方税法 art.30の2 軽自動車税 不足額加算 35%（bounded L4 モデル）

Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
raw data/raw/325AC0000000226_20261101_508AC0000000002.law.json.
原文逐語: 「同項の不足額に、これに百分の三十五の割合を乗じて計算した金額を加算した金額とする。」
Computation（加算額のみ、単位: 円、Nat の下限切り捨て）:
  shortfallSurcharge(shortage) = shortage * 35 / 100
Scope / NOT MODELLED: 前項の不足額そのものの算定、納付税額の合計、端数処理、
自動車税側（art.12の5）は NOT MODELLED。本モデルは 35/100 の加算額のみを扱い、
法的レビューを提供しない。
-/

namespace JapanTaxLaw.LightMotorVehicleTaxShortfallSurcharge35

open JapanTaxLaw.TaxFinance

def surchargeNum : Nat := 35
def surchargeDen : Nat := 100

def shortfallSurcharge (shortage : Money) : Money :=
  shortage * surchargeNum / surchargeDen

example : shortfallSurcharge 0 = 0 := by decide
example : shortfallSurcharge 1 = 0 := by decide
example : shortfallSurcharge 100 = 35 := by decide
example : shortfallSurcharge 1_000 = 350 := by decide

end JapanTaxLaw.LightMotorVehicleTaxShortfallSurcharge35
