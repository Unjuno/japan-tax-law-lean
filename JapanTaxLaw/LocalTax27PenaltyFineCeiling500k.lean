import JapanTaxLaw.TaxFinance

/-
# LocalTax27PenaltyFineCeiling500k — pinned clause 「次の各号のいずれかに該当する場合には、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 27, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|47870cf520e1aaea9319e84caef449b43cffea6b069d75479fc7b94140a5edd1.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:27/Article#27/Paragraph#1/ParagraphSentence/Sentence#1.
原文逐語: 「次の各号のいずれかに該当する場合には、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」
Scope: ONLY the 五十万円以下 (fine ≤ 500,000) INCLUSIVE ceiling on the criminal fine. 一年以下の拘禁刑, the triggering 各号 and 他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax27PenaltyFineCeiling500k

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (500000), INCLUSIVE ceiling. -/
def threshold : Nat := 500000

/-- 「次の各号のいずれかに該当する場合には、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」. -/
def inScope (fine : Nat) : Prop := fine ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (fine : Nat) : Bool := decide (fine ≤ 500000)

end JapanTaxLaw.LocalTax27PenaltyFineCeiling500k
