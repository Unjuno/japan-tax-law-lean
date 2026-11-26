import JapanTaxLaw.TaxFinance

/-
# InheritanceTaxArt21_11_2TwoGiftors — pinned clause 「前項の相続時精算課税適用者に係る特定贈与者が二人以上ある場合における各特定贈与者から贈与により取得した財産に係る課税価格から控除する金額の計算については、政令で定める。」

Pinned: law 325AC0000000073, revision 325AC0000000073_20260401_506AC0000000008, article 21_11_2.
Raw: data/raw/325AC0000000073_20260401_506AC0000000008.law.json. Normative unit: NORM|ba4a9dc61d44dd9331f12254edf683c46c3244a3e5bf9287cddd00c498f6ea4d.
原文逐語: 「前項の相続時精算課税適用者に係る特定贈与者が二人以上ある場合における各特定贈与者から贈与により取得した財産に係る課税価格から控除する金額の計算については、政令で定める。」
Scope: ONLY the threshold/tier interval of this clause. The delegated
computation, other tiers and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceTaxArt21_11_2TwoGiftors

open JapanTaxLaw.TaxFinance

/-- 二人 — 以上（inclusive） threshold (two or more specific donors). -/
def threshold : Nat := 2

/-- 「特定贈与者が二人以上ある場合」. -/
def inScope (amount : Nat) : Prop := amount ≥ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount ≥ 2)

end JapanTaxLaw.InheritanceTaxArt21_11_2TwoGiftors
