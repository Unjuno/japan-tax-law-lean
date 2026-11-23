import JapanTaxLaw.TaxFinance

/-
# JointHeirThreshold2 — 相続税法施行規則 第十一条（相続人が二人以上の連署申告）

Pinned source:
  Law id: 360CO0000000005
  Official title: 相続税法施行規則
  Revision: 360CO0000000005_20250401_507CO0000000006
  Raw snapshot: data/raw/360CO0000000005_20250401_507CO0000000006.law.json
  SHA-256: 228e54ca458c5192fbb3c1b3a6063d09f3fd66f8c5a6d3958d5389a0d6b38eb1
  Statutory article: 第十一条 (art. 11; raw JSON Article attr.Num = "11").
  Source path: law_full_text -> Article[Num=11] (verified by independent
  re-extraction: 1 structural hit, needle occurs verbatim once in the whole
  document).

原文逐語（pinned, 一字一句改変なし）:
  「相続人が二人以上ある場合には、前項の申告書は、各相続人が連署して提出するものとする。」

Variable contract:
  `n : Nat` = 相続人の数 (number of heirs), unit 人 (whole persons).
  `heirFloor : Nat := 2` = 二人 (two heirs).
  「二人以上」 is INCLUSIVE (>= 2): exactly 2 heirs qualifies; 0 and 1 do not.
  `needsJointDeclaration n := decide (heirFloor <= n)` is the Bool TRIGGER flag:
  true ⟺ 二人以上, i.e. the joint declaration (連署申告) is required.

Scope: ONLY the explicit numeric count threshold is modelled — 二人 = 2 and
以上 = inclusive `>=`. The declaration itself (前項の申告書), the signatories
(各相続人), the act of 連署して提出する, procedural details, other paragraphs
and other articles are NOT MODELLED.
-/

namespace JapanTaxLaw.JointHeirThreshold2

/-- 二人 = 2 人. Unit 人; domain Nat. -/
def heirFloor : Nat := 2

/-- 「相続人が二人以上」: joint declaration required iff n >= 2 (以上 inclusive). -/
def needsJointDeclaration (n : Nat) : Bool :=
  decide (heirFloor <= n)

/-- Zero heirs is not 二人以上. -/
theorem needsJointDeclaration_0 : needsJointDeclaration 0 = false := by decide

/-- One heir is not 二人以上. -/
theorem needsJointDeclaration_1 : needsJointDeclaration 1 = false := by decide

/-- Exactly two heirs (二人) qualifies: 以上 is inclusive. -/
theorem needsJointDeclaration_2 : needsJointDeclaration 2 = true := by decide

/-- Three heirs qualifies. -/
theorem needsJointDeclaration_3 : needsJointDeclaration 3 = true := by decide

/-- The pinned statutory count is 二人 = 2. -/
theorem heirFloor_value : heirFloor = 2 := rfl

end JapanTaxLaw.JointHeirThreshold2
