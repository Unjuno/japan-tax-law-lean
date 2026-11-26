import JapanTaxLaw.TaxFinance

/-
# LocalTax72_24_5TwoPrefectures — pinned clause 「前項の場合においては、その区分計算の方法について、事務所又は事業所所在地の道府県知事（二以上の道府県において事務所又は事業所を設けて事業を行う法人にあつては、主たる事務所又は事業所所在地の道府県知事）の承認を受けなければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 72_24_5, paragraph 3.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|6e670927c16fc5079d514ad476d019dda5156c1ca70b0fe0fef1919e37171284.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:72_24_5/Article#72_24_5/Paragraph#3/ParagraphSentence/Sentence#1.
原文逐語: 「前項の場合においては、その区分計算の方法について、事務所又は事業所所在地の道府県知事（二以上の道府県において事務所又は事業所を設けて事業を行う法人にあつては、主たる事務所又は事業所所在地の道府県知事）の承認を受けなければならない。」
Scope: ONLY 二以上の道府県において事務所又は事業所を設けて事業を行う法人. The 区分計算の方法, the 主たる事務所又は事業所所在地の道府県知事 substitution, the 承認 requirement and all other paragraphs/articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_24_5TwoPrefectures

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2), INCLUSIVE. -/
def threshold : Nat := 2

/-- 「二以上の道府県において事務所又は事業所を設けて事業を行う法人」. -/
def inScope (prefectures : Nat) : Prop := threshold ≤ prefectures

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (prefectures : Nat) : Bool := decide (2 ≤ prefectures)

end JapanTaxLaw.LocalTax72_24_5TwoPrefectures
