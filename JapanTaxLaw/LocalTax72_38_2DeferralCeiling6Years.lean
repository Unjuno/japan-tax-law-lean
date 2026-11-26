import JapanTaxLaw.TaxFinance

/-
# LocalTax72_38_2DeferralCeiling6Years — pinned clause 「ただし、その期間は、既に当該法人につき同項の規定により徴収を猶予した期間と合わせて六年を超えることができない。」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 72_38_2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|ce6757b91f05f96d9968e5b5bf66b3d800df83c4d9716bb6c8bab220fc6c9bd9.
原文逐語: 「ただし、その期間は、既に当該法人につき同項の規定により徴収を猶予した期間と合わせて六年を超えることができない。」
Scope: ONLY the threshold of this clause. Other amounts, classifications,
procedures and articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_38_2DeferralCeiling6Years

open JapanTaxLaw.TaxFinance

/-- Statutory threshold — 以下 / を超えることができない (inclusive ceiling). -/
def threshold : Nat := 6

/-- 「ただし、その期間は、既に当該法人につき同項の規定により徴収を猶予した期間と合わせて六年を超えることができない。」. -/
def inScope (amount : Nat) : Prop := amount ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount ≤ 6)

end JapanTaxLaw.LocalTax72_38_2DeferralCeiling6Years
