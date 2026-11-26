import JapanTaxLaw.TaxFinance

/-!
# SpecialMeasuresArt42_4CombinedRatioOver10Exception — EXCEPTION

Pinned source:
  Law id: 332AC0000000026
  Official title: 租税特別措置法
  Law number: 昭和三十二年法律第二十六号
  Law type: Act (法律)
  Raw snapshot: data/raw/332AC0000000026_*.law.json
  sha256: e6e6013bbc0608c6b48dea01d50ac847c3e5d094f0420223171ffe1b5cf8d5ee
  Normative unit id: NORM|54d5aca7a490dd39b948d2eef0911c7833ef5a5fe7fbf89798f9a60d6a9dee0c
  Source path: LawBody[3]/MainProvision/MainProvision[2]/Article:42_4/Article#42_4/Paragraph#8/Item#9/Subitem1#2/Subitem2#2/Subitem2Sentence/Column#1/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「合算試験研究費割合が百分の十を超える事業年度（（１）に掲げる事業年度を除く。）」

Norm kind: EXCEPTION (with CONDITION aspect) — the case applies where the
combined R&D expense ratio strictly exceeds the source percentage, except for
the business years listed in the referenced item 1. The computable slice models
exactly the strict threshold and the item-1 carve-out over a two-way year
classification. The statutory quote above is byte-verbatim from the pinned
source; English prose here is descriptive only.

Variable contract (meaning / domain / type):
  ratioPercent : Nat — combined R&D expense ratio in whole percentage points.
  ratioFloor : Nat — 10 percent, derived from the source numeral.
  YearClass : Type — item1Year (excluded) or otherYear.
  qualifies : Nat -> YearClass -> Prop — threshold met AND year not carved out.
  No currency amount, rounding, or ratio computation applies; ratio values are
  caller-established. Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.SpecialMeasuresArt42_4CombinedRatioOver10Exception

/-- The referenced item-1 business years are excluded; other years are not. -/
inductive YearClass : Type
  | item1Year : YearClass
  | otherYear : YearClass

/-- Strict ratio threshold from the source (whole percentage points). -/
def ratioFloor : Nat := 10

/-- The condition with the item-1 carve-out. -/
def qualifies (ratioPercent : Nat) (year : YearClass) : Prop :=
  ratioFloor < ratioPercent /\ year ≠ YearClass.item1Year

/-- The threshold equals the source percentage. -/
theorem floor_is_source : ratioFloor = 10 := rfl

/-- A ratio exactly at the threshold does not qualify. -/
theorem at_floor_rejected : ¬ qualifies 10 YearClass.otherYear := by
  unfold qualifies ratioFloor
  intro h
  exact (Nat.not_lt_of_ge (Nat.le_refl 10)) h.1

/-- A ratio above the threshold qualifies for a non-excluded year. -/
theorem above_floor_other_qualifies : qualifies 11 YearClass.otherYear := by
  unfold qualifies ratioFloor
  constructor
  · decide
  · intro h
    cases h

/-- A ratio above the threshold still fails for an item-1 year. -/
theorem above_floor_item1_rejected : ¬ qualifies 11 YearClass.item1Year := by
  unfold qualifies ratioFloor
  intro h
  exact h.2 rfl

end JapanTaxLaw.SpecialMeasuresArt42_4CombinedRatioOver10Exception
