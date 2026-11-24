import JapanTaxLaw.TaxFinance

/-
# InheritanceGiftRate4M6M — pinned clause 「四百万円を超え六百万円以下の金額」

Pinned source: law 325AC0000000073; revision 325AC0000000073_20260401_506AC0000000008; article 21_7.
Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json; normative unit NORM|246a67a42516a454e7df2f7fc108debef44b46afd4aef3c1dd5e5f0e08115c11.
原文逐語: 「四百万円を超え六百万円以下の金額」
Scope: ONLY the threshold/tier expressed by this clause. Rates, other tiers,
the underlying computation and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceGiftRate4M6M

open JapanTaxLaw.TaxFinance

/-- strict lower (を超え). -/
def lower : Money := 4_000_000

/-- inclusive upper (以下). -/
def upper : Money := 6_000_000

/-- 「四百万円を超え六百万円以下の金額」. -/
def inScope (amount : Money) : Prop := lower < amount ∧ amount ≤ upper


/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Money) : Bool := decide (4_000_000 < amount ∧ amount ≤ 6_000_000)

end JapanTaxLaw.InheritanceGiftRate4M6M
