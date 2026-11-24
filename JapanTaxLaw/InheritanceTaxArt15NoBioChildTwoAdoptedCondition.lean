import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxArt15NoBioChildTwoAdoptedCondition — CONDITION

Pinned source:
  Law id: 325AC0000000073
  Official title: 相続税法
  Law number: 昭和二十五年法律第七十三号
  Law type: Act (法律)
  Raw snapshot: data/raw/325AC0000000073_*.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|e3c065dafc60128427f7b5f314a6f77fe6ec9f329edbf9694aacdf3c47af393b
  Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:15/Article#15/Paragraph#2/Item#2/ItemSentence/Column#1/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「当該被相続人に実子がなく、養子の数が二人以上である場合」

Norm kind: CONDITION — item 2 of Article 15(2): when the decedent has no 実子
(actual child) and the number of 養子 (adopted children) is 二人以上
(two or more). This is the qualifying condition for the adjacent column's adopted-child
count; the count itself (the legal effect) is a separate norm outside this unit's
needle and is NOT MODELLED here. All statutory terms below are reproduced
programmatically from the verbatim needle; the canonical quote is byte-verbatim.

Variable contract (meaning / domain / type):
  hasBioChild : Bool — whether the decedent has an 実子 (caller-established).
  adoptedCount : Nat — number of 養子 (caller-established; unit: persons).
  qualifies : Bool -> Nat -> Bool — !hasBioChild && adoptedCount >= 2.
  The threshold 二人以上 is inclusive (two or more).

No other arithmetic is modeled. Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceTaxArt15NoBioChildTwoAdoptedCondition

/-- 実子がなく、養子の数が二人以上である場合: the qualifying condition. -/
def qualifies (hasBioChild : Bool) (adoptedCount : Nat) : Bool :=
  !hasBioChild && adoptedCount >= 2

/-- No actual child and two adopted children qualifies. -/
theorem zero_bio_two_adopted : qualifies false 2 = true := by decide

/-- No actual child and three adopted children qualifies. -/
theorem zero_bio_three_adopted : qualifies false 3 = true := by decide

/-- No actual child but only one adopted child does not qualify. -/
theorem zero_bio_one_adopted : qualifies false 1 = false := by decide

/-- An actual child present does not qualify regardless of adopted count. -/
theorem bio_child_excludes : qualifies true 3 = false := by decide

end JapanTaxLaw.InheritanceTaxArt15NoBioChildTwoAdoptedCondition
