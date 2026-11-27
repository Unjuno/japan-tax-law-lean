import JapanTaxLaw.TaxFinance

/-
# LocalTax72_38_2ExtensionWithin3Years — pinned clause 「道府県知事は、第一項の規定により徴収を猶予した場合において、その猶予をした期間内にその猶予をした金額を納付することができないやむを得ない理由があると認めるときは、当該法人の申請により、三年以内の期間を限りその期間を延長することができる。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 72_38_2, paragraph 5.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|60c47ab3118e23043948ca7161b7df5a09ed6f37823d291f5ccf6f48ea561859.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:72_38_2/Article#72_38_2/Paragraph#5/ParagraphSentence/Sentence#1.
原文逐語: 「道府県知事は、第一項の規定により徴収を猶予した場合において、その猶予をした期間内にその猶予をした金額を納付することができないやむを得ない理由があると認めるときは、当該法人の申請により、三年以内の期間を限りその期間を延長することができる。」
Scope: ONLY the 三年以内の期間を限り延長 (years ≤ 3) ceiling. 第一項の徴収猶予自体, やむを得ない理由の認定, 法人の申請, 延長期間の実体的要件, 他の項, 他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_38_2ExtensionWithin3Years

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (3), INCLUSIVE ceiling. -/
def threshold : Nat := 3

/-- 「道府県知事は、第一項の規定により徴収を猶予した場合において、その猶予をした期間内にその猶予をした金額を納付することができないやむを得ない理由があると認めるときは、当該法人の申請により、三年以内の期間を限りその期間を延長することができる。」. -/
def inScope (years : Nat) : Prop := years ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years ≤ 3)

end JapanTaxLaw.LocalTax72_38_2ExtensionWithin3Years
