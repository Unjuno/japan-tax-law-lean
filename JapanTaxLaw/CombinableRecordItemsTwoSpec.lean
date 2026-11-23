import JapanTaxLaw.CombinableRecordItemsTwo

/-
# CombinableRecordItemsTwoSpec — independent spec for 電子帳簿保存法施行規則 第五条

Pinned source:
  Law id: 410M50000040043
  Official title: 電子計算機を使用して作成する国税関係帳簿書類の保存方法等の特例に関する法律施行規則（電子帳簿保存法施行規則）
  Revision: 410M50000040043_20250401_507M60000040028
  Raw snapshot: data/raw/410M50000040043_20250401_507M60000040028.law.json
  SHA-256: 15786f1ae7140c2a1841e02f195246e42f437574b4a20d9f6573dba841899f44
  Article: 第五条 (raw JSON Article attr.Num = "5").
  原文: 「二以上の任意の記録項目を組み合わせて条件を設定することができること。」

INDEPENDENT FORMULATION. This module carries its OWN statutory constant
`specMin : Nat := 2` (二) and its OWN trigger `specCombine n :=
decide (specMin <= n)`. No implementation identifier occurs inside any
independent `spec*` definition.

The ONLY bridges are the universal, kernel-checked pure
`unfold ... ; rfl` theorems `agreeMin` and `agreeCombine`.

Variable contract: n = 組み合わせる記録項目の数 (Nat, unit 項目); 二以上 = n >= 2
INCLUSIVE. Not modelled: the record-item types, combination semantics, the
conditions being set, other paragraphs and other articles.
-/

namespace JapanTaxLaw.CombinableRecordItemsTwo

/-- Spec-local statutory count: 二 = 2 (項目, Nat). Independent of the impl. -/
def specMin : Nat := 2

/-- Independent 「二以上」: n >= specMin, INCLUSIVE. -/
def specCombine (n : Nat) : Bool :=
  decide (specMin <= n)

/-- Universal, kernel-checked floor bridge. Pure `unfold ... ; rfl`. -/
theorem agreeMin : minItems = specMin := by unfold minItems specMin; rfl

/-- Universal, kernel-checked combine bridge. Pure `unfold ... ; rfl`. -/
theorem agreeCombine (n : Nat) : canCombine n = specCombine n := by
  unfold canCombine specCombine minItems specMin
  rfl

example : specCombine 0 = false := by decide
example : specCombine 1 = false := by decide
example : specCombine 2 = true := by decide
example : specCombine 3 = true := by decide
example : specCombine 10 = true := by decide
example : specMin = 2 := rfl

end JapanTaxLaw.CombinableRecordItemsTwo
