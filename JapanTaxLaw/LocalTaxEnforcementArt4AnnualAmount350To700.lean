import JapanTaxLaw.TaxFinance

/-!
# LocalTaxEnforcementArt4AnnualAmount350To700 — CONDITION

Pinned source:
  Law id: 329M50000002023
  Official title: 地方税法施行規則
  Law number: 昭和二十九年総理府令第二十三号
  Law type: MinisterialOrdinance (省令)
  Raw snapshot: data/raw/329M50000002023_*.law.json
  sha256: 5ffb833bd3a3d7c477efecd41ace0d53ea8e8a14e61567f6ee18d08000bb217e
  Normative unit id: NORM|0a52a8975d92d2968ed4d24f279f8b5e8e432b8486f46e012d95bd6d5f5186de
  Source path: LawBody[79]/SupplProvision/SupplProvision[4]/Article:4/Article#4/Paragraph#2/ParagraphSentence/Sentence#1/QuoteStruct/TableStruct/Table/TableRow/TableColumn/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「年３５０万円を超え年７００万円以下の金額　（（２２））」

Norm kind: CONDITION — a supplementary-provision table cell classifying an
annual amount strictly above the lower bound and not above the upper bound.
Both bounds are derived from the fullwidth digits in the verbatim quote above.
The computable slice models that half-open interval over natural-number amounts.
The statutory quote above is byte-verbatim from the pinned source; English prose
here is descriptive only.

Variable contract (meaning / domain / type):
  annualAmount : Nat — annual amount in units of 10,000 yen (non-negative integer).
  lowerBound : Nat — 350 units of 10,000 yen (strictly exceeded).
  upperBound : Nat — 700 units of 10,000 yen (inclusive).
  withinInterval : Nat -> Prop — lowerBound < annualAmount /\ annualAmount <= upperBound.
  The appended table-row label and surrounding table structure are NOT MODELLED;
  no rounding or currency conversion applies. Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalTaxEnforcementArt4AnnualAmount350To700

/-- Strict lower bound from the source, in units of 10,000 yen. -/
def lowerBound : Nat := 350

/-- Inclusive upper bound from the source, in units of 10,000 yen. -/
def upperBound : Nat := 700

/-- The half-open interval condition. -/
def withinInterval (annualAmount : Nat) : Prop :=
  lowerBound < annualAmount /\ annualAmount <= upperBound

/-- The lower bound equals the source amount. -/
theorem lower_bound_is_source : lowerBound = 350 := rfl

/-- The upper bound equals the source amount. -/
theorem upper_bound_is_source : upperBound = 700 := rfl

/-- Amount just above the lower bound qualifies. -/
theorem lower_plus_one_qualifies : withinInterval 351 := by
  unfold withinInterval lowerBound upperBound
  constructor <;> decide

/-- Amount exactly at the upper bound qualifies. -/
theorem upper_qualifies : withinInterval 700 := by
  unfold withinInterval lowerBound upperBound
  constructor <;> decide

/-- Amount at the lower bound is excluded (strict lower bound). -/
theorem lower_rejected : ¬ withinInterval 350 := by
  unfold withinInterval lowerBound upperBound
  intro h
  exact (Nat.not_lt_of_ge (Nat.le_refl 350)) h.1

/-- Amount above the upper bound is excluded. -/
theorem above_upper_rejected : ¬ withinInterval 701 := by
  unfold withinInterval lowerBound upperBound
  intro h
  exact (Nat.not_le_of_gt (by decide : 700 < 701)) h.2

end JapanTaxLaw.LocalTaxEnforcementArt4AnnualAmount350To700
