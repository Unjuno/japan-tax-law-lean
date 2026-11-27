import JapanTaxLaw.TaxFinance

/-!
# FacilityCostAtLeast100M — 地方税法施行令 art.16の2の8（施設取得価額1億円以上）
Sources (pinned): law `325CO0000000245` / rev `325CO0000000245_20261101_508CO0000000083`.
原文: 「当該施設に係る建物及びその附属設備の取得価額の合計額が一億円以上であること。」
Computation: atLeast100M(cost) = cost >= 100_000_000（「以上」なので境界値を含む）。
Scope: 取得価額の算定・施設の認定は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.FacilityCostAtLeast100M

def thresholdYen : Nat := 100_000_000

def atLeast100M (cost : Nat) : Bool := cost >= thresholdYen

example : atLeast100M 99_999_999 = false := by decide
example : atLeast100M 100_000_000 = true := by decide
example : atLeast100M 100_000_001 = true := by decide

end JapanTaxLaw.FacilityCostAtLeast100M
