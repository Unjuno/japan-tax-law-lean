import JapanTaxLaw.ResidualDistributionOneMonth

/-
# ResidualDistributionOneMonthSpec — 復興特別法人税省令 1(1)(4) の独立定式

Pinned: law 424M60000040007, revision 424M60000040007_20210415_503M60000040045,
Article 1 Paragraph 1 Item 4; needle 「…終了の日の翌日から一月以内に…」.

Independent restatement: the distribution month must be strictly after the
fiscal-year-end month and at most one month later. Definitions use their own
numerals and no implementation identifiers; the agreement theorem is separate.
-/

namespace JapanTaxLaw.ResidualDistributionOneMonth

/-- 独立定式: 一月 = 1。 -/
def specOneMonth : Nat := 1

/-- 独立定式: fyEnd < dist ∧ dist <= fyEnd + 1。 -/
def specWithin (fyEnd dist : Nat) : Bool :=
  fyEnd < dist && dist <= fyEnd + specOneMonth

theorem agreeOneMonth : oneMonth = specOneMonth := by
  unfold oneMonth specOneMonth
  rfl

theorem agreeWithin (fyEnd dist : Nat) :
    withinOneMonth fyEnd dist = specWithin fyEnd dist := by
  unfold withinOneMonth specWithin
  rw [agreeOneMonth]

example : specWithin 0 0 = false := by decide
example : specWithin 0 1 = true := by decide
example : specWithin 0 2 = false := by decide

end JapanTaxLaw.ResidualDistributionOneMonth
