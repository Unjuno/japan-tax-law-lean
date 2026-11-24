import JapanTaxLaw.TaxFinance

/-!
# RndSurchargeRate — 租税特別措置法 art. 10(3)(3) 控除割増率（bounded computational slice）

Sources (pinned):
  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Raw snapshot: data/raw/332AC0000000026_20261101_507AC0000000013.law.json
  Normative id: NORM|b1aa09eb096d7d23f144edb485e04f1792ac94e62641d6b3a1f14cf170de0250
  Article Num 10, paragraph 3, item 3, column 2, sentence 1.

原文逐語（pinned clause, extracted from the raw snapshot）:
  「当該試験研究費割合から百分の十を控除した割合に二を乗じて計算した割合（当該割合に小数点以下三位未満の端数があるときはこれを切り捨てた割合とし、当該計算した割合が百分の十を超えるときは百分の十とする。）」

Computation（单位: 1パーセントの10万分之一。10% = 1,000,000）:
  excess  = if r > 1000000 then r - 1000000 else 0
  doubled = excess + excess                    （二を乗じて）
  floored = doubled - doubled % 100            （小数点以下三位未満の端数を切り捨て）
  rate    = if floored > 1000000 then 1000000 else floored  （百分の十を上限）

Scope / NOT MODELLED:
  - 試験研究費割合・控除対象試験研究費の額の算定は NOT MODELLED。
  - 他の号・項の割合、法人税額への乗算、適用年度・認定要件は NOT MODELLED。
  - 本モデルは有限の整数-grid 上の計算スライスのみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.RndSurchargeRate

/-- 控除割増率: (割合 - 10%) * 2 を三位未満切り捨て、10% を上限とする。 -/
def surchargeRate (r : Nat) : Nat :=
  let threshold : Nat := 1000000
  let excess : Nat := if threshold < r then r - threshold else 0
  let doubled : Nat := excess + excess
  let floored : Nat := doubled - doubled % 100
  if threshold < floored then threshold else floored

example : surchargeRate 0 = 0 := by decide
example : surchargeRate 1000000 = 0 := by decide
example : surchargeRate 1000050 = 100 := by decide
example : surchargeRate 2000000 = 1000000 := by decide
example : surchargeRate 3000000 = 1000000 := by decide

end JapanTaxLaw.RndSurchargeRate
