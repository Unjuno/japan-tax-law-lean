import JapanTaxLaw.SpecialMeasuresArt42_4CombinedRatioOver10Exception

/-!
# SpecialMeasuresArt42_4CombinedRatioOver10ExceptionSpec — independent spec

Law id: 332AC0000000026 (租税特別措置法), revision from INVENTORY.
Art.42の4 EXCEPTION 「合算試験研究費割合が百分の十を超える事業年度（（１）に掲げる事業年度を除く。）」.
Normative unit: NORM|54d5aca7a490dd39b948d2eef0911c7833ef5a5fe7fbf89798f9a60d6a9dee0c

The implementation uses a strict inequality plus a disequality exclusion; the
spec states the ratio part as the absence of the reverse non-strict inequality
and the year part as an equality to the non-excluded class. Representationally
distinct, proved equivalent by cases in the kernel. Axiom-free; no
simp/propext/omega. Concrete `decide` reductions are probe-confirmed
axiom-free.

Not modelled: ratio computation, item-1 year definition, legal correctness.
-/

namespace JapanTaxLaw.SpecialMeasuresArt42_4CombinedRatioOver10Exception

/-- Independent spec: ratio above floor and year is the non-excluded class. -/
def SpecQualifies (ratioPercent : Nat) (year : YearClass) : Prop :=
  ¬ ratioPercent <= ratioFloor /\ year = YearClass.otherYear

/-- The implementation and the independent spec agree. -/
theorem qualifies_spec_agreement (r : Nat) (y : YearClass) :
    qualifies r y ↔ SpecQualifies r y := by
  cases y with
  | item1Year =>
      constructor
      · intro h
        exact (h.2 rfl).elim
      · intro h
        cases h.2
  | otherYear =>
      constructor
      · intro h
        constructor
        · exact Nat.not_le_of_gt h.1
        · rfl
      · intro h
        constructor
        · exact Nat.lt_of_not_ge h.1
        · intro hy
          cases hy

end JapanTaxLaw.SpecialMeasuresArt42_4CombinedRatioOver10Exception
