import JapanTaxLaw.TaxFinance

/-
# LocalTax72_25Over4Months — pinned clause 「当該道府県知事が指定する四月を超える月数の期間内」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 72_25.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|debb666d030002ace27d83b2391038f119f9fbc12e99315be413189f63c7a4b6.
原文逐語: 「当該道府県知事が指定する四月を超える月数の期間内」
Scope: ONLY the threshold of this clause. Other amounts, classifications,
procedures and articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_25Over4Months

open JapanTaxLaw.TaxFinance

/-- Statutory threshold — 四月を超え (strict). -/
def threshold : Nat := 4

/-- 「当該道府県知事が指定する四月を超える月数の期間内」. -/
def inScope (amount : Nat) : Prop := threshold < amount

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (4 < amount)

end JapanTaxLaw.LocalTax72_25Over4Months
