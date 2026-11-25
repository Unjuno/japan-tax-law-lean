import JapanTaxLaw.TaxFinance

/-
# LocalTax154DisplacementOver6L — pinned clause 「（１０）　総排気量が六リットルを超えるもの」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 154.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json. Normative unit: NORM|01d4d7b447399c3a29c8b45e6671e7eaec473d25acd4b773304c174dcdc954aa.
原文逐語: 「（１０）　総排気量が六リットルを超えるもの」
Scope: ONLY the threshold/tier interval of this clause. Rates, other tiers,
the underlying computation and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax154DisplacementOver6L

open JapanTaxLaw.TaxFinance

/-- 六リットル — を超え（strict） threshold (six litres). -/
def threshold : Nat := 6

/-- 「（１０）　総排気量が六リットルを超えるもの」. -/
def inScope (amount : Nat) : Prop := amount > threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount > 6)

end JapanTaxLaw.LocalTax154DisplacementOver6L
