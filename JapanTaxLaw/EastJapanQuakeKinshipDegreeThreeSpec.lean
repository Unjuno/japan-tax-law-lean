import JapanTaxLaw.EastJapanQuakeKinshipDegreeThree

/-
# EastJapanQuakeKinshipDegreeThreeSpec — 東日本大震災特例法施行規則 15(2)(4)ロ の独立定式

Pinned: law 423M60000040020, revision 423M60000040020_20260414_508M60000040039,
Article 15 Paragraph 2 Item 4 Subitem ロ; needle 「…所有者の三親等内の親族
であることを証する書類」.

Independent restatement: a person qualifies when the (caller-established)
kinship degree does not exceed three. Agreement with the implementation is a
separate bridge.
-/

namespace JapanTaxLaw.EastJapanQuakeKinshipDegreeThree

/-- 独立定式: 三 = 3。 -/
def specDegree : Nat := 3

/-- 独立定式: degree <= 3（「内」）。 -/
def specWithin (degree : Nat) : Bool :=
  degree <= specDegree

theorem agreeDegree : thirdDegree = specDegree := by
  unfold thirdDegree specDegree
  rfl

theorem agreeWithin (degree : Nat) :
    withinThirdDegree degree = specWithin degree := by
  unfold withinThirdDegree specWithin
  rw [agreeDegree]

example : specWithin 3 = true := by decide
example : specWithin 4 = false := by decide

end JapanTaxLaw.EastJapanQuakeKinshipDegreeThree
