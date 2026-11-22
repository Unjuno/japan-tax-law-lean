import JapanTaxLaw.TaxFinance

/-!
# AircraftScope — 航空機の範囲（航空機燃料税法施行令 art.2）bounded L4 モデル

Sources (pinned):
  Law id: 347CO0000000057
  Revision: 347CO0000000057_20250401_507CO0000000006
  Raw snapshot: data/raw/347CO0000000057_20250401_507CO0000000006.law.json
  Article Num 2, flat/normalized leaf text 61 chars, U+3000 count 0.

原文逐語:
  「法第二条第一号に規定する政令で定める航空の用に供することができる機器は、
   発動機を有する滑空機とする。」

Computation（原文逐語から導出、機器の列挙のみ）:
  指定機器 = {発動機を有する滑空機}（ただ 1 つのみ）
  機器を Nat 列挙: 発動機付滑空機=0, その他=1
  isDesignatedAircraft(m) = (m == 0)

Scope / NOT MODELLED:
  - 法2条1号の「航空の用に供することができる機器」の定義は NOT MODELLED。
  - 発動機・滑空機の技術的認定は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.AircraftScope

open JapanTaxLaw.TaxFinance

/-- 発動機を有する滑空機 = 0。 -/
def motorizedGlider : Nat := 0
/-- その他 = 1。 -/
def otherAircraft : Nat := 1

/-- 政令で定める航空機（発動機付滑空機）か。 -/
def isDesignatedAircraft (machine : Nat) : Bool :=
  machine == motorizedGlider

example : isDesignatedAircraft motorizedGlider = true := by decide
example : isDesignatedAircraft otherAircraft = false := by decide

end JapanTaxLaw.AircraftScope
