import JapanTaxLaw.TaxFinance

/-
# LocalTax72_109FreightTaxEvasionUpTo10Years — pinned clause 「偽りその他不正の行為により貨物割の全部又は一部を免れ、又は免れようとしたときは、その違反行為をした者は、十年以下の拘禁刑若しくは千万円以下の罰金に処し、又はこれを併科する。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 72_109, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|8bf883788e9e64ca692fba3bdacb6ea8f994fc8c6a6c8eeea654c79f3ef5a315.
原文逐語: 「偽りその他不正の行為により貨物割の全部又は一部を免れ、又は免れようとしたときは、その違反行為をした者は、十年以下の拘禁刑若しくは千万円以下の罰金に処し、又はこれを併科する。」
Scope: ONLY the 十年以下の拘禁刑 (years <= 10) INCLUSIVE ceiling for evading or attempting to evade freight tax. 千万円以下の罰金・併科・貨物割の課税標準・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_109FreightTaxEvasionUpTo10Years

open JapanTaxLaw.TaxFinance

/-- 「偽りその他不正の行為により貨物割の全部又は一部を免れ、又は免れようとしたときは、その違反行為をした者は、十年以下の拘禁刑若しくは千万円以下の罰金に処し、又はこれを併科する。」 — statutory threshold literal (10); INCLUSIVE boundary. -/
def inScope (years : Nat) : Prop := years <= 10

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years <= 10)

end JapanTaxLaw.LocalTax72_109FreightTaxEvasionUpTo10Years
