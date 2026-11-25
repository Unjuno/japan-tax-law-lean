import JapanTaxLaw.TaxFinance

/-
# LocalTax154PassengersUpTo30 — pinned clause 「（ｉ）　乗車定員が三十人以下のもの」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 154.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json. Normative unit: NORM|19e6a008bafcbf28089826a4191debb49496177793c74d5e3ff0b55f41d2635a.
原文逐語: 「（ｉ）　乗車定員が三十人以下のもの」
Scope: ONLY the threshold/tier interval of this clause. Rates, other tiers,
the underlying computation and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax154PassengersUpTo30

open JapanTaxLaw.TaxFinance

/-- 三十人 — 以下（inclusive） threshold (thirty passengers). -/
def threshold : Nat := 30

/-- 「（ｉ）　乗車定員が三十人以下のもの」. -/
def inScope (amount : Nat) : Prop := amount ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount ≤ 30)

end JapanTaxLaw.LocalTax154PassengersUpTo30
