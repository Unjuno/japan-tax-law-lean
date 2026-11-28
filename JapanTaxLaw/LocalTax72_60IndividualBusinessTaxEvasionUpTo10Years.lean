import JapanTaxLaw.TaxFinance

/-
# LocalTax72_60IndividualBusinessTaxEvasionUpTo10Years — pinned clause 「偽りその他不正の行為により個人の行う事業に対する事業税の全部又は一部を免れたときは、その違反行為をした者は、十年以下の拘禁刑若しくは千万円以下の罰金に処し、又はこれを併科する。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 72_60, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|0aecf0144b3b93d48ad0684c2f29b26e079395cfc20b1182881b836673d21494.
原文逐語: 「偽りその他不正の行為により個人の行う事業に対する事業税の全部又は一部を免れたときは、その違反行為をした者は、十年以下の拘禁刑若しくは千万円以下の罰金に処し、又はこれを併科する。」
Scope: ONLY the 十年以下の拘禁刑 (years <= 10) INCLUSIVE ceiling for an individual who evades business tax on the individual's business. 千万円以下の罰金・併科・事業税の課税標準・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_60IndividualBusinessTaxEvasionUpTo10Years

open JapanTaxLaw.TaxFinance

/-- 「偽りその他不正の行為により個人の行う事業に対する事業税の全部又は一部を免れたときは、その違反行為をした者は、十年以下の拘禁刑若しくは千万円以下の罰金に処し、又はこれを併科する。」 — statutory threshold literal (10); INCLUSIVE boundary. -/
def inScope (years : Nat) : Prop := years <= 10

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years <= 10)

end JapanTaxLaw.LocalTax72_60IndividualBusinessTaxEvasionUpTo10Years
