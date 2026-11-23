import JapanTaxLaw.JointHeirThreshold2

/-
# JointHeirThreshold2Spec — independent spec for 相続税法施行規則 第十一条

Pinned source:
  Law id: 360CO0000000005
  Revision: 360CO0000000005_20250401_507CO0000000006
  Raw snapshot: data/raw/360CO0000000005_20250401_507CO0000000006.law.json
  SHA-256: 228e54ca458c5192fbb3c1b3a6063d09f3fd66f8c5a6d3958d5389a0d6b38eb1
  Article: 第十一条 (raw JSON Article attr.Num = "11").
  原文: 「相続人が二人以上ある場合には、前項の申告書は、各相続人が連署して提出するものとする。」

INDEPENDENT FORMULATION. This module carries its OWN statutory constant
`specFloor : Nat := 2` (二人) and its OWN trigger `specJoint n :=
decide (specFloor <= n)`. No implementation identifier occurs inside any
independent `spec*` definition.

The ONLY bridges are the universal, kernel-checked pure
`unfold ... ; rfl` theorems `agreeFloor` and `agreeJoint`.

Variable contract: n = 相続人の数 (Nat, unit 人); 二人以上 = n >= 2 INCLUSIVE.
Not modelled: 前項の申告書, 各相続人, the act of 連署して提出する, procedural
details, other paragraphs and other articles.
-/

namespace JapanTaxLaw.JointHeirThreshold2

/-- Spec-local statutory count: 二人 = 2 (人, Nat). Independent of the impl. -/
def specFloor : Nat := 2

/-- Independent 「二人以上」: n >= specFloor, INCLUSIVE. -/
def specJoint (n : Nat) : Bool :=
  decide (specFloor <= n)

/-- Universal, kernel-checked floor bridge. Pure `unfold ... ; rfl`. -/
theorem agreeFloor : heirFloor = specFloor := by unfold heirFloor specFloor; rfl

/-- Universal, kernel-checked joint-declaration bridge. Pure `unfold ... ; rfl`. -/
theorem agreeJoint (n : Nat) : needsJointDeclaration n = specJoint n := by
  unfold needsJointDeclaration specJoint heirFloor specFloor
  rfl

example : specJoint 0 = false := by decide
example : specJoint 1 = false := by decide
example : specJoint 2 = true := by decide
example : specJoint 3 = true := by decide
example : specFloor = 2 := rfl

end JapanTaxLaw.JointHeirThreshold2
