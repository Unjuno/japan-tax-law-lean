import JapanTaxLaw.TaxSavingsPenaltyCap

/-!
# TaxSavingsPenaltyCapSpec — independent spec for 納税貯蓄組合法 第十四条

Pinned source:
  Law id: 326AC1000000145
  Revision: 326AC1000000145_20211122_503AC0000000046
  Raw snapshot: data/raw/326AC1000000145_20211122_503AC0000000046.law.json

原文逐語:
  「次の各号のいずれかに該当する者は、十万円以下の過料に処する。」

Independent formulation: 十万円 = 100,000 yen and 「以下」 is an inclusive
Nat <= test. The definitions below use their OWN constant and comparison and
do NOT reference any implementation definition. Only the `agree*` helpers
bridge to the implementation for comparison.
-/

namespace JapanTaxLaw.TaxSavingsPenaltyCap

/-- Spec-local statutory cap: 十万円 = 100,000 (independent constant). -/
def specPenaltyCap : Nat := 100_000

/-- Independent formula: the amount is at or below the 十万円 cap. -/
def specWithin (amount : Nat) : Bool := amount <= specPenaltyCap

/-- Kernel-checked agreement of the independent formula with the impl. -/
theorem agree_penalty_cap (amount : Nat) :
    withinPenaltyCap amount = specWithin amount := by
  unfold withinPenaltyCap specWithin penaltyCap specPenaltyCap
  rfl

/-- Finite Bool agreement grid over the threshold neighbourhood. -/
def agreePenaltyCap : Bool :=
  [0, 1, 99_999, 100_000, 100_001].all fun n =>
    withinPenaltyCap n == specWithin n

example : agreePenaltyCap = true := by decide

end JapanTaxLaw.TaxSavingsPenaltyCap
