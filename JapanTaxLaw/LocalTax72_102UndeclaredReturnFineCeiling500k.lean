import JapanTaxLaw.TaxFinance

/-
# LocalTax72_102UndeclaredReturnFineCeiling500k — pinned clause 「正当な理由がなくて前条の規定による申告書をその提出期限までに提出しなかつたときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 72_102, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|fb0ce3bef1d5b7acfec8041d9cc879dc36773faa3c5065a00cf275642a39113f.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:72_102/Article#72_102/Paragraph#1/ParagraphSentence/Sentence#1.
原文逐語: 「正当な理由がなくて前条の規定による申告書をその提出期限までに提出しなかつたときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」
Scope: ONLY the 五十万円以下 (fine ≤ 500,000) INCLUSIVE ceiling on the criminal fine for failing to file the 申告書 without 正当な理由. 一年以下の拘禁刑, 前条の要件該当性・情状判断・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_102UndeclaredReturnFineCeiling500k

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (500000), INCLUSIVE ceiling. -/
def threshold : Nat := 500000

/-- 「正当な理由がなくて前条の規定による申告書をその提出期限までに提出しなかつたときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」. -/
def inScope (fine : Nat) : Prop := fine ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (fine : Nat) : Bool := decide (fine ≤ 500000)

end JapanTaxLaw.LocalTax72_102UndeclaredReturnFineCeiling500k
