import JapanTaxLaw.TaxFinance

/-
# LocalTax349Population200k — pinned clause 「人口二十万人以上の市」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 349_4.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json. Normative unit: NORM|13392f81030b448f210599b96a54470f54cc058f859d69754d2e3f4554d73fa8.
原文逐語: 「人口二十万人以上の市」
Scope: ONLY the threshold/tier interval of this clause. Rates, other tiers,
the underlying computation and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax349Population200k

open JapanTaxLaw.TaxFinance

/-- 二十万人 — 以上（inclusive） threshold (two hundred thousand population). -/
def threshold : Nat := 200_000

/-- 「人口二十万人以上の市」. -/
def inScope (amount : Nat) : Prop := amount ≥ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount ≥ 200_000)

end JapanTaxLaw.LocalTax349Population200k
