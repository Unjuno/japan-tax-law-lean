import JapanTaxLaw.TaxFinance

/-!
# SpecialUseExemption — 特定用途免税の範囲（政令 art.7）bounded L4 モデル

Sources (pinned):
  Law id: 341CO0000000005
  Revision: 341CO0000000005_20250401_507CO0000000006
  Raw snapshot: data/raw/341CO0000000005_20250401_507CO0000000006.law.json
  Article Num 7, flat/normalized leaf text 49 chars, U+3000 count 0.

原文逐語:
  「法第十二条第一項に規定する政令で定める用途は、原料用又は熱源用とする。」

Computation（原文逐語から導出、用途の列挙のみ）:
  指定用途 = {原料用, 熱源用}（2 つのみ）
  用途を Nat 列挙で表現: 原料用=0, 熱源用=1, その他=2
  isSpecifiedUse(u) = (u == 0 || u == 1)

Scope / NOT MODELLED:
  - 石油ガスの種類・免税の適用要件（法12条1項）は NOT MODELLED。
  - 原料用・熱源用の具体的認定手続は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.SpecialUseExemption

open JapanTaxLaw.TaxFinance

/-- 原料用 = 0。 -/
def rawMaterialUse : Nat := 0
/-- 熱源用 = 1。 -/
def heatSourceUse : Nat := 1
/-- その他 = 2。 -/
def otherUse : Nat := 2

/-- 指定用途（原料用または熱源用）か。 -/
def isSpecifiedUse (use : Nat) : Bool :=
  use == rawMaterialUse || use == heatSourceUse

example : isSpecifiedUse rawMaterialUse = true := by decide
example : isSpecifiedUse heatSourceUse = true := by decide
example : isSpecifiedUse otherUse = false := by decide

end JapanTaxLaw.SpecialUseExemption
