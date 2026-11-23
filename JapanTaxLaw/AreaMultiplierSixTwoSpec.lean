import JapanTaxLaw.AreaMultiplierSixTwo

/-
# AreaMultiplierSixTwoSpec — 第三十一条（面積六倍・特例二倍）の独立整数定式

Pinned: law 423CO0000000112, revision 423CO0000000112_20260401_508CO0000000102,
source data/raw/423CO0000000112_20260401_508CO0000000102.law.json,
SHA-256 d1e8cc26fcec663e706cec8859f4175d1c282f5670bd21a9649d786836db6964.
独立再抽出: 六 = 6, 二 = 2; needle verbatim in scoped Article 31 (384 chars).
impl の識別子は spec* 定義では一切使わない（数値・構造を独立に書き下す）。
spec_literals = {6, 2}; source_literals_verified True; parse_statutory_rate None.
橋渡しは三つの定理で、いずれも unfold 後の純粋 rfl（算術タクティックを使用しない）。
BY-DESIGN: Bool は 前条第三項第一号の建物 の有無のみを表し、
しきい値・比率・端数処理・段階モデルではない。
-/

namespace JapanTaxLaw.AreaMultiplierSixTwo

/-- 独立定式: 六 = 6。 -/
def specGeneral : Nat := 6

/-- 独立定式: 二 = 2（前条第三項第一号の建物）。 -/
def specSpecial : Nat := 2

/-- 独立定式: 計算した面積に六（特例は二）を乗じる。 -/
def specMultiply (area : Nat) (isSpecial : Bool) : Nat :=
  (if isSpecial then specSpecial else specGeneral) * area

theorem agreeGeneral : generalMultiplier = specGeneral := by unfold generalMultiplier specGeneral; rfl

theorem agreeSpecial : specialMultiplier = specSpecial := by unfold specialMultiplier specSpecial; rfl

theorem agreeMultiply (area : Nat) (isSpecial : Bool) : multipliedArea area isSpecial = specMultiply area isSpecial := by
  unfold multipliedArea specMultiply generalMultiplier specialMultiplier specGeneral specSpecial
  rfl

end JapanTaxLaw.AreaMultiplierSixTwo
