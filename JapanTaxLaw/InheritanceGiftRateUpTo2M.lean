import JapanTaxLaw.TaxFinance

/-
# InheritanceGiftRateUpTo2M — pinned clause 「二百万円以下の金額」

Pinned source:
  Law id: 325AC0000000073; revision 325AC0000000073_20260401_506AC0000000008; article 21_7.
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json
  Normative unit: NORM|c15d9fc007f9f3839fac4e9af8b4c4b0e8625df3c89ac6a180ca7fe82d66a49b

原文逐語: 「二百万円以下の金額」

Scope: ONLY the threshold/tier interval expressed by this clause. Rates,
other tiers, the underlying computation and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceGiftRateUpTo2M

open JapanTaxLaw.TaxFinance

/-- 二百万 — inclusive upper bound (以下). -/
def threshold : Money := 2_000_000

/-- 金額が二百万円以下の金額. -/
def inScope (amount : Money) : Prop := amount ≤ threshold


/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Money) : Bool := decide (amount ≤ 2_000_000)

end JapanTaxLaw.InheritanceGiftRateUpTo2M
