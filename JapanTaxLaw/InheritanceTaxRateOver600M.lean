import JapanTaxLaw.TaxFinance

/-
# InheritanceTaxRateOver600M — pinned clause 「六億円を超える金額」

Pinned source:
  Law id: 325AC0000000073; revision 325AC0000000073_20260401_506AC0000000008; article 16.
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json
  Normative unit: NORM|b499e7ff816c3143182331132a1f1511d6e34881154b571c773d19feb4834159

原文逐語: 「六億円を超える金額」

Scope: ONLY the threshold/tier interval expressed by this clause. Rates,
other tiers, the underlying computation and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceTaxRateOver600M

open JapanTaxLaw.TaxFinance

/-- 六億 — strict lower bound (を超え). -/
def threshold : Money := 600_000_000

/-- 金額が六億円を超える金額. -/
def inScope (amount : Money) : Prop := threshold < amount


/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Money) : Bool := decide (600_000_000 < amount)

end JapanTaxLaw.InheritanceTaxRateOver600M
