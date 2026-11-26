import JapanTaxLaw.TaxFinance

/-!
# OverseasMarketPriceCeiling — 関税定率法施行令 art.2の4(2) 海外市価三万円以下（bounded slice）

Sources (pinned):
  Law id: 344M50000040016
  Revision: 344M50000040016_20260401_508M60000040016
  Raw snapshot: data/raw/344M50000040016_20260401_508M60000040016.law.json
  Normative id: NORM|00bb2915da9151a74e59bcebb3940b8cb7f27ba3b99efdfb8bcef1576f1a097c
  Article Num 2_4, paragraph 2.

原文逐語（pinned clause, extracted from the raw snapshot）:
  「一個（現に使用中のもので海外市価（外国においてその物品を購入する際に支払われた又は支払われるべき価格をいう。以下この条において同じ。）三万円以下のものに限る。次号において同じ。）」

Computation（単位: 円）:
  withinCeiling(overseasPrice) = overseasPrice <= 30000

Scope / NOT MODELLED:
  - 「現に使用中のもの」の認定、物品の特定、海外市価の算定、
    次号の適用は NOT MODELLED。
  - 本モデルは三万円の上限判定スライスのみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.OverseasMarketPriceCeiling

/-- 海外市価が三万円以下か。 -/
def withinCeiling (overseasPrice : Nat) : Bool :=
  overseasPrice <= 30000

example : withinCeiling 0 = true := by decide
example : withinCeiling 29999 = true := by decide
example : withinCeiling 30000 = true := by decide
example : withinCeiling 30001 = false := by decide

end JapanTaxLaw.OverseasMarketPriceCeiling
