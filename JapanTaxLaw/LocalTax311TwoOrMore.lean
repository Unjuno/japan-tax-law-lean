import JapanTaxLaw.TaxFinance

/-
# LocalTax311TwoOrMore — pinned clause 「前号に掲げる者を二人以上有する者」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 311.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json. Normative unit: NORM|1ed1564cf1b491810255cf81def7dacb6a05d358ca056df51e2551048e6c65ec.
原文逐語: 「前号に掲げる者を二人以上有する者」
Scope: ONLY the threshold/tier interval of this clause. Rates, other tiers,
the underlying computation and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax311TwoOrMore

open JapanTaxLaw.TaxFinance

/-- 二人 — 以上（inclusive） threshold (two or more persons). -/
def threshold : Nat := 2

/-- 「前号に掲げる者を二人以上有する者」. -/
def inScope (amount : Nat) : Prop := amount ≥ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount ≥ 2)

end JapanTaxLaw.LocalTax311TwoOrMore
