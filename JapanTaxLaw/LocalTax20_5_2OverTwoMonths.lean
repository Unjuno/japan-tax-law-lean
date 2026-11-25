import JapanTaxLaw.TaxFinance

/-
# LocalTax20_5_2OverTwoMonths — pinned clause 「この場合において、延長後の期限は、当該理由がなくなつた日から二月を超えてはならない。」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 20_5_2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json. Normative unit: NORM|cebb9b5c43f6020899062e4ec82e7c9ead3f073fae4269c78aea75cc3f321b38.
原文逐語: 「この場合において、延長後の期限は、当該理由がなくなつた日から二月を超えてはならない。」
Scope: ONLY the threshold/tier interval of this clause. Rates, other tiers,
the underlying computation and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax20_5_2OverTwoMonths

open JapanTaxLaw.TaxFinance

/-- 二月 — を超え（strict） ceiling: beyond two months is outside the permitted period. -/
def threshold : Nat := 2

/-- 「延長後の期限は、当該理由がなくなつた日から二月を超えてはならない」. -/
def inScope (amount : Nat) : Prop := amount > threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount > 2)

end JapanTaxLaw.LocalTax20_5_2OverTwoMonths
