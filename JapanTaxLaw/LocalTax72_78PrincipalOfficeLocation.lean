import JapanTaxLaw.TaxFinance

/-
# LocalTax72_78PrincipalOfficeLocation — pinned clause 「その事務所等の所在地（その事務所等が二以上ある場合には、主たるものの所在地）」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 72_78 (第七十二条の七十八).
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|7b5333da217ebf338731a9e2fa42afe9b4eff903fbbbac22c853941b835c693c.
原文逐語: 「その事務所等の所在地（その事務所等が二以上ある場合には、主たるものの所在地）」
Scope: ONLY the 以上 (inclusive floor) of this clause. Other amounts, classifications,
procedures and articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_78PrincipalOfficeLocation

open JapanTaxLaw.TaxFinance

/-- Statutory threshold — その事務所等の所在地（その事務所等が二以上ある場合には、主たるものの所在地） (以上, inclusive floor). -/
def threshold : Nat := 2

/-- Inclusive statutory floor — 以上. -/
def lower : Nat := threshold

/-- 「その事務所等の所在地（その事務所等が二以上ある場合には、主たるものの所在地）」. -/
def inScope (amount : Nat) : Prop := amount ≥ lower

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (2 ≤ amount)

end JapanTaxLaw.LocalTax72_78PrincipalOfficeLocation
