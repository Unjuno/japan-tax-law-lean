import JapanTaxLaw.TaxFinance

/-!
# StandingTimberDeferredRate30 — 相続税法施行令 art.28 §1 立木の価額に対応する延納税額の割合 30%（bounded L4 モデル）

Sources (pinned):
  Law id: 325CO0000000071
  Revision: 325CO0000000071_20260401_506CO0000000143
  Raw snapshot: data/raw/325CO0000000071_20260401_506CO0000000143.law.json

原文逐語:
  「法第五十二条第一項第一号ロに規定する政令で定める割合は、百分の三十とする。」

Computation（この割合の適用のみ、単位: 円、Nat の下限切り捨て）:
  timberDeferredTax(tax) = tax * 30 / 100

Scope / NOT MODELLED:
  - 同条第二項の「立木の価額が占める割合を乗じて算定した税額と延納税額のいずれか少ない額」は NOT MODELLED。
  - 同条第三項の準用、相続税法第52条・第38条・第44条の延納許可、物納、申告手続、端数処理は NOT MODELLED。
  - 本モデルは政令で定める割合 30/100 のみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.StandingTimberDeferredRate30

open JapanTaxLaw.TaxFinance

/-- 政令で定める割合（百分の三十）。 -/
def prescribedRateNum : Nat := 30

/-- 割合の分母（百）。 -/
def prescribedRateDen : Nat := 100

/-- 所与の税額に 30/100 を適用した額（同条第二項の比較計算は行わない）。 -/
def timberDeferredTax (tax : Money) : Money :=
  tax * prescribedRateNum / prescribedRateDen

example : timberDeferredTax 0 = 0 := by decide
example : timberDeferredTax 1 = 0 := by decide
example : timberDeferredTax 29 = 8 := by decide
example : timberDeferredTax 30 = 9 := by decide
example : timberDeferredTax 100 = 30 := by decide
example : timberDeferredTax 1_000 = 300 := by decide

end JapanTaxLaw.StandingTimberDeferredRate30
