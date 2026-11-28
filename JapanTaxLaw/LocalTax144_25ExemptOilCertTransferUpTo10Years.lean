import JapanTaxLaw.TaxFinance

/-
# LocalTax144_25ExemptOilCertTransferUpTo10Years — pinned clause 「前条の規定に違反して免税証を譲り受け、免税軽油の引取りを行つたときは、その違反行為をした者は、十年以下の拘禁刑若しくは千万円以下の罰金に処し、又はこれを併科する。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 144_25, paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|be6f4fc2bfafea4dcda292a049cc1f967644816d68a76424c2148c8da0ead3c2.
原文逐語: 「前条の規定に違反して免税証を譲り受け、免税軽油の引取りを行つたときは、その違反行為をした者は、十年以下の拘禁刑若しくは千万円以下の罰金に処し、又はこれを併科する。」
Scope: ONLY the 十年以下の拘禁刑 (years <= 10) INCLUSIVE ceiling for receiving a transferred tax-exemption certificate and drawing tax-exempt light oil in violation of the preceding article. 千万円以下の罰金・併科・免税証の交付手続・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax144_25ExemptOilCertTransferUpTo10Years

open JapanTaxLaw.TaxFinance

/-- 「前条の規定に違反して免税証を譲り受け、免税軽油の引取りを行つたときは、その違反行為をした者は、十年以下の拘禁刑若しくは千万円以下の罰金に処し、又はこれを併科する。」 — statutory threshold literal (10); INCLUSIVE boundary. -/
def inScope (years : Nat) : Prop := years <= 10

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years <= 10)

end JapanTaxLaw.LocalTax144_25ExemptOilCertTransferUpTo10Years
