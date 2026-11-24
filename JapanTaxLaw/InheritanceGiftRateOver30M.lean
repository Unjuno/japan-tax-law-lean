import JapanTaxLaw.TaxFinance

/-
# InheritanceGiftRateOver30M — pinned clause 「三千万円を超える金額」

Pinned source:
  Law id: 325AC0000000073; revision 325AC0000000073_20260401_506AC0000000008; article 21_7.
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json
  Normative unit: NORM|7e19c12b92a5778bd5316fcf9548271de5a3256091b2addd3f1ec59619e759df

原文逐語: 「三千万円を超える金額」

Scope: ONLY the threshold/tier interval expressed by this clause. Rates,
other tiers, the underlying computation and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceGiftRateOver30M

open JapanTaxLaw.TaxFinance

/-- 三千万 — strict lower bound (を超え). -/
def threshold : Money := 30_000_000

/-- 金額が三千万円を超える金額. -/
def inScope (amount : Money) : Prop := threshold < amount


/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Money) : Bool := decide (30_000_000 < amount)

end JapanTaxLaw.InheritanceGiftRateOver30M
