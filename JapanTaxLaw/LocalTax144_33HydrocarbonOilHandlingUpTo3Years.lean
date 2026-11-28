import JapanTaxLaw.TaxFinance

/-
# LocalTax144_33HydrocarbonOilHandlingUpTo3Years — pinned clause 「第一項の犯罪に係る炭化水素油について、情を知つてこれを運搬し、保管し、有償若しくは無償で取得し、又は処分の媒介若しくはあつせんをしたときは、その違反行為をした者は、三年以下の拘禁刑若しくは三百万円以下の罰金に処し、又はこれを併科する。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 144_33, paragraph 3.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|83c454e2e9734f7e2970522d2abfb8f009346d40b02c93c42b665fd54bcd746b.
原文逐語: 「第一項の犯罪に係る炭化水素油について、情を知つてこれを運搬し、保管し、有償若しくは無償で取得し、又は処分の媒介若しくはあつせんをしたときは、その違反行為をした者は、三年以下の拘禁刑若しくは三百万円以下の罰金に処し、又はこれを併科する。」
Scope: ONLY the 三年以下の拘禁刑 (years <= 3) INCLUSIVE ceiling for knowingly transporting, storing, acquiring or brokering hydrocarbon oil connected with the first-paragraph crime. 三百万円以下の罰金・併科・第一項の犯罪の認定・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax144_33HydrocarbonOilHandlingUpTo3Years

open JapanTaxLaw.TaxFinance

/-- 「第一項の犯罪に係る炭化水素油について、情を知つてこれを運搬し、保管し、有償若しくは無償で取得し、又は処分の媒介若しくはあつせんをしたときは、その違反行為をした者は、三年以下の拘禁刑若しくは三百万円以下の罰金に処し、又はこれを併科する。」 — statutory threshold literal (3); INCLUSIVE boundary. -/
def inScope (years : Nat) : Prop := years <= 3

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years <= 3)

end JapanTaxLaw.LocalTax144_33HydrocarbonOilHandlingUpTo3Years
