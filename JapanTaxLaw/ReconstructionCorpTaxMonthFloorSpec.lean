import JapanTaxLaw.ReconstructionCorpTaxMonthFloor

/-
# ReconstructionCorpTaxMonthFloorSpec — 復興特別法人税政令 3(3) の独立定式

Pinned: law 424CO0000000017, revision 424CO0000000017_20240401_505CO0000000208,
Article 3 Paragraph 3; needle 「…一月に満たない端数を生じたときは、これを切り捨てる。」

Independent restatement: the effective month count is the natural-number floor
of a caller-established exact rational month count. Definitions below use no
implementation identifiers; the agreement theorem is a separate bridge.
-/

namespace JapanTaxLaw.ReconstructionCorpTaxMonthFloor

/-- 独立定式: exact rational numer/denom の整数部。 -/
def specFloorMonths (a : Nat) (b : Nat) : Nat :=
  a / b

theorem agreeFloor (a b : Nat) :
    effectiveMonths a b = specFloorMonths a b := by
  unfold effectiveMonths specFloorMonths
  rfl

example : specFloorMonths 1 2 = 0 := by decide
example : specFloorMonths 13 12 = 1 := by decide
example : specFloorMonths 31 32 = 0 := by decide

end JapanTaxLaw.ReconstructionCorpTaxMonthFloor
