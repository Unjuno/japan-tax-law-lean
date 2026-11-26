import JapanTaxLaw.TaxFinance

/-!
# SalaryIncreaseRate5Or15 — 租税特別措置法 art.10の5の4
「百分の五（継続雇用者給与等支給増加割合が百分の六以上である場合には、百分の十五）」

Sources (pinned): law `332AC0000000026`, revision `332AC0000000026_20261101_507AC0000000013`,
raw `data/raw/332AC0000000026_20261101_507AC0000000013.law.json`.
Computation（割合の選択のみ。入力は100分率の分子）:
  threshold(continuing) = if continuing then 15 else 5
  「継続雇用者…が百分の六以上」が elevated 条件（原文の 6 を明示的に保持）。
Scope / NOT MODELLED: 割合の算定・税額計算は NOT MODELLED。本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.SalaryIncreaseRate5Or15

open JapanTaxLaw.TaxFinance

def normalNum : Nat := 5
def altNum : Nat := 6
def elevatedNum : Nat := 15

def threshold (elevated : Bool) : Nat :=
  if elevated then elevatedNum else normalNum

def qualifies (rate : Nat) (elevated : Bool) : Bool :=
  rate >= threshold elevated

example : threshold false = 5 := by decide
example : threshold true = 15 := by decide
example : qualifies 5 false = true := by decide
example : qualifies 14 true = false := by decide
example : qualifies 15 true = true := by decide

end JapanTaxLaw.SalaryIncreaseRate5Or15
