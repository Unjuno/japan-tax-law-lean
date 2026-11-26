import JapanTaxLaw.TaxFinance

/-!
# LocalTaxArt154Capacity30To40Condition — CONDITION

Pinned source:
  Law id: 325AC0000000226
  Official title: 地方税法
  Law number: 昭和二十五年法律第二百二十六号
  Law type: Act (法律)
  Raw snapshot: data/raw/325AC0000000226_*.law.json
  sha256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  Normative unit id: NORM|aa32cf8b9a6339adb0c07216fe43e73857aaea91f64393d2c754d5883c44b9bb
  Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:154/Article#154/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「（２）　乗車定員が三十人を超え、四十人以下のもの」

Norm kind: CONDITION — a table-cell interval condition: passenger capacity is
greater than the lower bound and not greater than the upper bound. Both bounds
are derived from the kanji numerals in the verbatim quote above. The computable
slice models exactly that half-open interval over natural-number passenger
counts. The statutory quote above is byte-verbatim from the pinned source;
English prose here is descriptive only.

Variable contract (meaning / domain / type):
  capacity : Nat — passenger capacity (persons, non-negative integer).
  lowerBound : Nat — 30 persons (strictly exceeded).
  upperBound : Nat — 40 persons (inclusive).
  withinInterval : Nat -> Prop — lowerBound < capacity ∧ capacity <= upperBound.
  No currency amount or rounding applies; the surrounding table structure and
  legal correctness are NOT MODELLED. Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalTaxArt154Capacity30To40Condition

/-- Strict lower bound from the source (persons). -/
def lowerBound : Nat := 30

/-- Inclusive upper bound from the source (persons). -/
def upperBound : Nat := 40

/-- The interval condition: capacity above the lower bound and up to the upper bound. -/
def withinInterval (capacity : Nat) : Prop :=
  lowerBound < capacity /\ capacity <= upperBound

/-- The lower bound equals the source threshold. -/
theorem lower_bound_is_source : lowerBound = 30 := rfl

/-- The upper bound equals the source threshold. -/
theorem upper_bound_is_source : upperBound = 40 := rfl

/-- Capacity just above the lower bound qualifies. -/
theorem capacity_31_qualifies : withinInterval 31 := by
  unfold withinInterval lowerBound upperBound
  constructor <;> decide

/-- Capacity exactly at the upper bound qualifies. -/
theorem capacity_upper_qualifies : withinInterval 40 := by
  unfold withinInterval lowerBound upperBound
  constructor <;> decide

/-- Capacity at the lower bound is excluded (strict lower bound). -/
theorem capacity_lower_rejected : ¬ withinInterval 30 := by
  unfold withinInterval lowerBound upperBound
  intro h
  exact (Nat.not_lt_of_ge (Nat.le_refl 30)) h.1

/-- Capacity above the upper bound is excluded. -/
theorem capacity_above_upper_rejected : ¬ withinInterval 41 := by
  unfold withinInterval lowerBound upperBound
  intro h
  exact (Nat.not_le_of_gt (by decide : 40 < 41)) h.2

end JapanTaxLaw.LocalTaxArt154Capacity30To40Condition
