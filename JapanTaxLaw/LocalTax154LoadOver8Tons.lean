import JapanTaxLaw.TaxFinance

/-
# LocalTax154LoadOver8Tons — pinned clause 「（９）　最大積載量が八トンを超えるもの」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 154.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|6cbc1d048de06a8f6ab32c0a1f99482b5d2576669a8a1659176fa69cc7d02d5e.
原文逐語: 「（９）　最大積載量が八トンを超えるもの」
Scope: ONLY the threshold of this clause. Other amounts, classifications,
procedures and articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax154LoadOver8Tons

open JapanTaxLaw.TaxFinance

/-- Statutory threshold — を超え (strict). -/
def threshold : Nat := 8

/-- 「（９）　最大積載量が八トンを超えるもの」. -/
def inScope (amount : Nat) : Prop := threshold < amount

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (8 < amount)

end JapanTaxLaw.LocalTax154LoadOver8Tons
