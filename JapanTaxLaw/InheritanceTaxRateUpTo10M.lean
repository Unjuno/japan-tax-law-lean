import JapanTaxLaw.TaxFinance

/-
# InheritanceTaxRateUpTo10M — pinned clause 「千万円以下の金額」

Pinned source:
  Law id: 325AC0000000073; revision 325AC0000000073_20260401_506AC0000000008; article 16.
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json
  Normative unit: NORM|92331abb47f0b9bba69651babb5e33741e72a9f527d842c4cd3de6ad1734abee

原文逐語: 「千万円以下の金額」

Scope: ONLY the threshold/tier interval expressed by this clause. Rates,
other tiers, the underlying computation and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceTaxRateUpTo10M

open JapanTaxLaw.TaxFinance

/-- 千万 — inclusive upper bound (以下). -/
def threshold : Money := 10_000_000

/-- 金額が千万円以下の金額. -/
def inScope (amount : Money) : Prop := amount ≤ threshold


/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Money) : Bool := decide (amount ≤ 10_000_000)

end JapanTaxLaw.InheritanceTaxRateUpTo10M
