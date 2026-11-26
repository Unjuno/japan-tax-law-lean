import JapanTaxLaw.TaxFinance

/-!
# LocalTaxArt154Capacity30Condition — CONDITION

Pinned source:
  Law id: 325AC0000000226
  Official title: 地方税法
  Law number: 昭和二十五年法律第二百二十六号
  Law type: Act (法律)
  Raw snapshot: data/raw/325AC0000000226_*.law.json
  sha256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  Normative unit id: NORM|aada7e0359814b0a7a3a59ef923563944d9083c679e564d3bab228d790ecbabd
  Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:154/Article#154/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「（１）　乗車定員が三十人以下のもの」

Norm kind: CONDITION — a table-cell condition classifying passenger capacity:
the case applies where the vehicle's passenger capacity is not greater than
the limit (the limit is read from the kanji numeral in the verbatim quote
above). The computable slice models the <= threshold over natural-number
passenger counts. The statutory quote above is byte-verbatim from the pinned
source; English prose here is descriptive only.

Variable contract (meaning / domain / type):
  capacity : Nat — passenger capacity (persons, non-negative integer).
  capacityLimit : Nat — 30 persons, derived from the source numeral.
  withinLimit : Nat -> Prop — capacity <= capacityLimit.
  No currency amount, rounding, or rate applies; the surrounding table structure
  and legal correctness are NOT MODELLED. Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalTaxArt154Capacity30Condition

/-- Passenger-capacity limit from the source (persons). -/
def capacityLimit : Nat := 30

/-- The capacity condition: not greater than the limit. -/
def withinLimit (capacity : Nat) : Prop :=
  capacity <= capacityLimit

/-- The limit equals the source threshold. -/
theorem limit_is_source_value : capacityLimit = 30 := rfl

/-- Capacity exactly at the limit satisfies the condition. -/
theorem capacity_at_limit : withinLimit 30 := Nat.le_refl 30

/-- Zero capacity satisfies the condition. -/
theorem zero_capacity_allowed : withinLimit 0 := Nat.zero_le capacityLimit

/-- Capacity above the limit does not satisfy the condition. -/
theorem capacity_over_limit_rejected (n : Nat) (h : 30 < n) : ¬ withinLimit n := by
  unfold withinLimit capacityLimit
  exact Nat.not_le_of_gt h

end JapanTaxLaw.LocalTaxArt154Capacity30Condition
