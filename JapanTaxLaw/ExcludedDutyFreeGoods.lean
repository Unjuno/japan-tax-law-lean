import JapanTaxLaw.TaxFinance

/-!
# ExcludedDutyFreeGoods — 免税対象物品から除かれる物品（規則 art.6）bounded L4 モデル

Sources (pinned):
  Law id: 363M50000040053
  Revision: 363M50000040053_20261101_507M60000040022
  Raw snapshot: data/raw/363M50000040053_20261101_507M60000040022.law.json
  Article Num 6, flat/normalized leaf text 68 chars, U+3000 count 0.

原文逐語:
  「法第八条第一項に規定する財務省令で定める物品は、金及び白金の地金並びに金貨及び
   白金貨とする。」

Computation（原文逐語から導出、物品の列挙のみ）:
  除外物品 = {金の地金, 白金の地金, 金貨, 白金貨}（4 つのみ）
  物品を Nat 列挙で表現: 金地金=0, 白金地金=1, 金貨=2, 白金貨=3, その他=4
  isExcludedGood(g) = (g <= 3)

Scope / NOT MODELLED:
  - 法8条1項の免税対象物品の定義・他の除外規定は NOT MODELLED。
  - 「地金」「貨」の物理的認定（純度・形状等）は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.ExcludedDutyFreeGoods

open JapanTaxLaw.TaxFinance

/-- 金の地金 = 0。 -/
def goldBullion : Nat := 0
/-- 白金の地金 = 1。 -/
def platinumBullion : Nat := 1
/-- 金貨 = 2。 -/
def goldCoin : Nat := 2
/-- 白金貨 = 3。 -/
def platinumCoin : Nat := 3
/-- その他 = 4。 -/
def otherGood : Nat := 4

/-- 免税対象から除かれる物品（4 種類）か。 -/
def isExcludedGood (good : Nat) : Bool :=
  good <= platinumCoin

example : isExcludedGood goldBullion = true := by decide
example : isExcludedGood platinumBullion = true := by decide
example : isExcludedGood goldCoin = true := by decide
example : isExcludedGood platinumCoin = true := by decide
example : isExcludedGood otherGood = false := by decide

end JapanTaxLaw.ExcludedDutyFreeGoods
