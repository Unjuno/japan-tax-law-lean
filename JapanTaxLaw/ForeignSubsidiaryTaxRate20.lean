import JapanTaxLaw.TaxFinance

/-!
# ForeignSubsidiaryTaxRate20 — 租税特別措置法「租税負担割合が百分の二十以上」

Sources (pinned): law `332AC0000000026`, revision `332AC0000000026_20261101_507AC0000000013`,
raw `data/raw/332AC0000000026_20261101_507AC0000000013.law.json`.
原文逐語: 「対象外国関係会社の各事業年度の租税負担割合が百分の二十以上である場合」 /
「各事業年度の租税負担割合が百分の二十以上であること。」
Computation（境界判定のみ。入力は100分率の分子）:
  atLeast20(rate) = rate >= 20   （「以上」なので境界値 20 を含む）
Scope / NOT MODELLED: 租税負担割合の算定・外国関係会社の認定は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.ForeignSubsidiaryTaxRate20

open JapanTaxLaw.TaxFinance

def thresholdNum : Nat := 20
def rateDen : Nat := 100

def atLeast20 (rate : Nat) : Bool :=
  rate >= thresholdNum

example : atLeast20 19 = false := by decide
example : atLeast20 20 = true := by decide
example : atLeast20 21 = true := by decide

end JapanTaxLaw.ForeignSubsidiaryTaxRate20
