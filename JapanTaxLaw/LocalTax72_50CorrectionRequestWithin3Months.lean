import JapanTaxLaw.TaxFinance

/-
# LocalTax72_50CorrectionRequestWithin3Months — pinned clause 「この場合において、正当な事由がなくて当該税務官署が当該更正の請求を受けた日から三月以内に更正をしないときは、道府県知事は、当該税務官署を監督する税務官署に更正をすべき旨を請求することができる。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 72_50, paragraph 3.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|f7f5441b875fc544978242a7175d314dcb4d13b367dd62f30e9bbba111474948.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:72_50/Article#72_50/Paragraph#3/ParagraphSentence/Sentence#2.
原文逐語: 「この場合において、正当な事由がなくて当該税務官署が当該更正の請求を受けた日から三月以内に更正をしないときは、道府県知事は、当該税務官署を監督する税務官署に更正をすべき旨を請求することができる。」
Scope: ONLY 当該更正の請求を受けた日から三月以内に更正をしない. The 道府県知事の監督税務官署への請求, the 第七十二条の四十 parallel clause, the 正当な事由 の有無 and all other paragraphs/articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_50CorrectionRequestWithin3Months

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (3), INCLUSIVE. -/
def threshold : Nat := 3

/-- 「当該更正の請求を受けた日から三月以内に更正をしない」. -/
def inScope (months : Nat) : Prop := months ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (months : Nat) : Bool := decide (months ≤ 3)

end JapanTaxLaw.LocalTax72_50CorrectionRequestWithin3Months
