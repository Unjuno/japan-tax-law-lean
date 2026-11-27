import JapanTaxLaw.TaxFinance

/-
# LocalTax144_25ExemptionCertTransferFineCeiling500k — pinned clause 「前条の規定に違反したときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 144_25, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|b11d0e0ba6f95c2688dacb61262b0c536bcbf286bcd3946b7ce13e4b01c2d0ce.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:144_25/Article#144_25/Paragraph#1/ParagraphSentence/Sentence#1.
原文逐語: 「前条の規定に違反したときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」
Scope: ONLY the 五十万円以下 (fine ≤ 500,000) INCLUSIVE ceiling on the criminal fine for 免税証の譲渡の禁止違反. 一年以下の拘禁刑・第二項の千万円以下の罰金・法人両罰・時効・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax144_25ExemptionCertTransferFineCeiling500k

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (500000), INCLUSIVE ceiling. -/
def threshold : Nat := 500000

/-- 「前条の規定に違反したときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」. -/
def inScope (fine : Nat) : Prop := fine ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (fine : Nat) : Bool := decide (fine ≤ 500000)

end JapanTaxLaw.LocalTax144_25ExemptionCertTransferFineCeiling500k
