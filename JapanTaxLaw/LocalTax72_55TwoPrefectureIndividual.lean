import JapanTaxLaw.TaxFinance

/-
# LocalTax72_55TwoPrefectureIndividual — pinned clause 「二以上の道府県に事務所又は事業所を設けて事業を行う個人」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002, article 第七十二条の五十五 (Num 72_55), paragraph 3.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|45172d5ee0ea8f0b6dbdd216cc0ca0816616481385413b1dc37a63b7758ccd32.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:72_55/Article#72_55/Paragraph#3/ParagraphSentence/Sentence#1.
原文逐語: 「二以上の道府県に事務所又は事業所を設けて事業を行う個人」
Scope: ONLY the inclusive 二以上 prefecture-count threshold (二 = 2) of this
clause. The filing-addressee rule (主たる事務所所在地の道府県知事), the reference
to the preceding two paragraphs and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_55TwoPrefectureIndividual

open JapanTaxLaw.TaxFinance

/-- 二 — 以上 (inclusive). -/
def threshold : Nat := 2

/-- 「二以上の道府県に事務所又は事業所を設けて事業を行う個人」. -/
def inScope (prefectures : Nat) : Prop := threshold ≤ prefectures

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (prefectures : Nat) : Bool := decide (2 ≤ prefectures)

end JapanTaxLaw.LocalTax72_55TwoPrefectureIndividual
