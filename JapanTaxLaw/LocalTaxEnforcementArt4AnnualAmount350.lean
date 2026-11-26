import JapanTaxLaw.TaxFinance

/-!
# LocalTaxEnforcementArt4AnnualAmount350 — CONDITION

Pinned source:
  Law id: 329M50000002023
  Official title: 地方税法施行規則
  Law number: 昭和二十九年総理府令第二十三号
  Law type: MinisterialOrdinance (省令)
  Raw snapshot: data/raw/329M50000002023_*.law.json
  sha256: 5ffb833bd3a3d7c477efecd41ace0d53ea8e8a14e61567f6ee18d08000bb217e
  Normative unit id: NORM|c8d9f6f7319a50729e1de85ce41a2c51e37f8a03b6cf39647b6bb44bfe202fb1
  Source path: LawBody[79]/SupplProvision/SupplProvision[4]/Article:4/Article#4/Paragraph#2/ParagraphSentence/Sentence#1/QuoteStruct/TableStruct/Table/TableRow/TableColumn/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「年３５０万円以下の金額　（（２１））」

Norm kind: CONDITION — a supplementary-provision table cell classifying an
annual amount that does not exceed the stated threshold (the amount is read
from the fullwidth digits in the verbatim quote above). The computable slice
models exactly the <= threshold over natural-number amounts. The statutory
quote above is byte-verbatim from the pinned source; English prose here is
descriptive only.

Variable contract (meaning / domain / type):
  annualAmount : Nat — annual amount in units of 10,000 yen (non-negative integer).
  amountLimit : Nat — 350 units of 10,000 yen, derived from the source.
  withinLimit : Nat -> Prop — annualAmount <= amountLimit.
  The appended table-row label and the surrounding table structure are NOT
  MODELLED; no rounding or currency conversion applies. Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalTaxEnforcementArt4AnnualAmount350

/-- Annual amount limit from the source, in units of 10,000 yen. -/
def amountLimit : Nat := 350

/-- The condition: annual amount does not exceed the limit. -/
def withinLimit (annualAmount : Nat) : Prop :=
  annualAmount <= amountLimit

/-- The limit equals the source amount. -/
theorem limit_is_source_value : amountLimit = 350 := rfl

/-- An amount exactly at the limit satisfies the condition. -/
theorem amount_at_limit : withinLimit 350 := Nat.le_refl 350

/-- A zero amount satisfies the condition. -/
theorem zero_amount_allowed : withinLimit 0 := Nat.zero_le amountLimit

/-- An amount above the limit does not satisfy the condition. -/
theorem amount_over_limit_rejected (n : Nat) (h : 350 < n) : ¬ withinLimit n := by
  unfold withinLimit amountLimit
  exact Nat.not_le_of_gt h

end JapanTaxLaw.LocalTaxEnforcementArt4AnnualAmount350
