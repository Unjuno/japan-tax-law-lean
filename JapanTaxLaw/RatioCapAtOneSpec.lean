import JapanTaxLaw.RatioCapAtOne

/-
# RatioCapAtOne spec — 阪神・淡路大震災…法律施行令 第八条の三 の独立条件定式

Pinned: law 407CO0000000029,
revision 407CO0000000029_20110101_422CO0000000058,
raw data/raw/407CO0000000029_20110101_422CO0000000058.law.json, Article Num 8_3.

Independent restatement: 「割合が一を超える場合には、一とする」を
「一 = 1 を上限とする」として直接書き、impl の識別子 (capValue / cappedRatio)
は一切使わない。数値リテラルは静的リテラル 1（一）のみ; 境界は
num > den（一を超える）で、実効分子は min num den、等号は包含（num = den は 1 のまま）。
橋渡しは二つの普遍定理で、いずれも unfold 後の純粋 rfl（公理なし、算術タクティックなし）。
BY-DESIGN: den > 0 は比 num/den が定義されるための scoping 仮定であり、
モデルは除算を持たないため Nat 前提として明示的に文書化するのみ。
-/

namespace JapanTaxLaw.RatioCapAtOne

/-- 独立定式: 一 = 1 を上限値とする（impl 識別子不使用）。 -/
def specCap : Nat := 1

/-- 独立定式: 一を超える割合の実効分子 = min num den（impl 識別子不使用）。 -/
def specCapped (num : Nat) (den : Nat) : Nat := min num den

/-- spec-local の kernel-decided 確認（骨組みであり静的定式ではない）。 -/
example : specCap = 1 := by decide
example : specCapped 5 3 = 3 := by decide
example : specCapped 3 5 = 3 := by decide
example : specCapped 3 3 = 3 := by decide
example : specCapped 0 5 = 0 := by decide

/-- 橋渡し 1: 静的キャップ値が一致する（unfold 後 rfl）。 -/
theorem agreeCap : capValue = specCap := by unfold capValue specCap; rfl

/-- 橋渡し 2: 実効分子が全 (num, den) で一致する（unfold 後 rfl）。 -/
theorem agreeCapped (num : Nat) (den : Nat) : cappedRatio num den = specCapped num den := by
  unfold cappedRatio specCapped
  rfl

end JapanTaxLaw.RatioCapAtOne
