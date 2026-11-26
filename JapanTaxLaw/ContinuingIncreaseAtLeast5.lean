import JapanTaxLaw.TaxFinance

/-!
# ContinuingIncreaseAtLeast5 — 租税特別措置法 art.10の5の4「継続雇用者給与等支給増加割合が百分の五以上」

Sources (pinned): law `332AC0000000026`, revision `332AC0000000026_20261101_507AC0000000013`,
raw `data/raw/332AC0000000026_20261101_507AC0000000013.law.json`.
原文逐語: 「継続雇用者給与等支給増加割合が百分の五以上であること」
Computation（境界判定のみ。入力は100分率の分子）:
  atLeast5(rate) = rate >= 5   （「以上」なので境界値 5 を含む）
Scope / NOT MODELLED: 割合の算定・適用範囲は NOT MODELLED。本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.ContinuingIncreaseAtLeast5

open JapanTaxLaw.TaxFinance

def thresholdNum : Nat := 5
def rateDen : Nat := 100

def atLeast5 (rate : Nat) : Bool :=
  rate >= thresholdNum

example : atLeast5 4 = false := by decide
example : atLeast5 5 = true := by decide
example : atLeast5 6 = true := by decide

end JapanTaxLaw.ContinuingIncreaseAtLeast5
