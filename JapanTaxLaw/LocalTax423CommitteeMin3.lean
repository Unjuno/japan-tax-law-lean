import JapanTaxLaw.TaxFinance

/-
# LocalTax423CommitteeMin3 — pinned clause 「固定資産評価審査委員会の委員の定数は三人以上とし、当該市町村の条例で定める。」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 423.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json. Normative unit: NORM|788a46ffcd4f2317b2a1716797a350bd3f5fdd48f4ea5f3b4322b3b266243f3a.
原文逐語: 「固定資産評価審査委員会の委員の定数は三人以上とし、当該市町村の条例で定める。」
Scope: ONLY the threshold/tier interval of this clause. Rates, other tiers,
the underlying computation and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax423CommitteeMin3

open JapanTaxLaw.TaxFinance

/-- 三人 — 以上（inclusive） threshold (three committee members). -/
def threshold : Nat := 3

/-- 「固定資産評価審査委員会の委員の定数は三人以上とし、当該市町村の条例で定める。」. -/
def inScope (amount : Nat) : Prop := amount ≥ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount ≥ 3)

end JapanTaxLaw.LocalTax423CommitteeMin3
