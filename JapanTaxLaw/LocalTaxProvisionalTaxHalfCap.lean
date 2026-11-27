import JapanTaxLaw.TaxFinance

/-
# LocalTaxProvisionalTaxHalfCap — pinned clause 「ただし、当該徴収することができる額の総額は、仮算定税額の二分の一に相当する額を超えることができない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 364, paragraph 5.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|2d8c039384a0dda8f28a1455c4573a32d7abb76555d4d6ce1d6a58a8973fdcfc.
原文逐語: 「ただし、当該徴収することができる額の総額は、仮算定税額の二分の一に相当する額を超えることができない。」
Scope: ONLY the 徴収できる額の総額が仮算定税額の二分の一に相当する額を超える STRICT 上限. ただし書の徴収手続・仮算定税額の算定・他項他条項は NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTaxProvisionalTaxHalfCap

open JapanTaxLaw.TaxFinance

/-- Statutory threshold literal (2) with the inclusive/strict boundary fixed by the clause. -/
def inScope (amount base : Nat) : Prop := 2 * amount > base

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount base : Nat) : Bool := decide (2 * amount > base)

end JapanTaxLaw.LocalTaxProvisionalTaxHalfCap
