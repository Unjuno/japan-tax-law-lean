import JapanTaxLaw.TaxFinance

/-
# LocalTax72_25Over3Months — pinned clause 「当該道府県知事が指定する三月を超える月数の期間内」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 72_25.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json. Normative unit: NORM|93f4e10498152ac92f06409e2ac45cf8d103f6aba2ed5227ab3469334787defc.
原文逐語: 「当該道府県知事が指定する三月を超える月数の期間内」
Scope: ONLY the threshold/tier interval of this clause. Rates, other tiers,
the underlying computation and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_25Over3Months

open JapanTaxLaw.TaxFinance

/-- 三月 — を超え（strict） threshold (three months). -/
def threshold : Nat := 3

/-- 「当該道府県知事が指定する三月を超える月数の期間内」. -/
def inScope (amount : Nat) : Prop := amount > threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount > 3)

end JapanTaxLaw.LocalTax72_25Over3Months
