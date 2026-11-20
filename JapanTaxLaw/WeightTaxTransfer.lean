import JapanTaxLaw.TaxFinance

/-!
# WeightTaxTransfer — 自動車重量譲与税法 art.2（市町村に対する自動車重量譲与税の譲与の基準）bounded L4 モデル

Sources (pinned):
  Law id: 346AC0000000090
  Revision: 346AC0000000090_20260401_508AC0000000002
  Raw snapshot: data/raw/346AC0000000090_20260401_508AC0000000002.law.json
  Article Num 2, flat/normalized leaf text 333 chars, U+3000 count 0.

原文逐語:
  §1 「自動車重量譲与税の三百五十七分の三百三十三に相当する額は、市町村に対し、
       ...市町村道...の延長及び面積に按あん分して譲与するものとする。」
  §2 「同項の額の二分の一の額を同項の道路の延長で、他の二分の一の額を
       同項の道路の面積で按分するものとする。」

Computation（原文逐語から導出。coordinator の数式は信じていない）:
  base = totalTax × 333 / 357
  allocation = (base / 2) × entityLength / totalLength
             + (base / 2) × entityArea / totalArea
  （各分母 0 は安全版で 0）

Scope: 税額・各市町村の延長/面積・合計は caller-established。
道路の算定・補正（総務省令）・対象外道路の除外は NOT MODELLED。
-/

namespace JapanTaxLaw.WeightTaxTransfer

open JapanTaxLaw.TaxFinance

/-- 譲与対象額 = 税額 × 333 / 357。 -/
def transferBase (totalTax : Money) : Money := totalTax * 333 / 357

/-- 按分額 = (対象額/2)×延長按分 + (対象額/2)×面積按分。 -/
def allocation (totalTax : Money) (entityLength totalLength entityArea totalArea : Money) : Money :=
  let half := transferBase totalTax / 2
  (if totalLength = 0 then 0 else half * entityLength / totalLength) +
  (if totalArea = 0 then 0 else half * entityArea / totalArea)

example : transferBase 357 = 333 := by decide
example : transferBase 0 = 0 := by decide
-- 対象額=333, 半分=166。延長 1/2 → 83、面積 1/2 → 83、合計 166
example : allocation 357 1 2 1 2 = 166 := by decide
-- 分母 0 安全版
example : allocation 357 0 0 1 1 = 166 := by decide
example : allocation 357 1 1 0 0 = 166 := by decide
example : allocation 357 0 0 0 0 = 0 := by decide

end JapanTaxLaw.WeightTaxTransfer
