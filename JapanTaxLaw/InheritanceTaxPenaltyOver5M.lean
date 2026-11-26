import JapanTaxLaw.TaxFinance

/-
# InheritanceTaxPenaltyOver5M — pinned clause 「免れた相続税額又は贈与税額が五百万円を超えるときは、情状により、同項の罰金は、五百万円を超えその免れた相続税額又は贈与税額に相当する金額以下とすることができる。」

Pinned: law 325AC0000000073 (相続税法), revision 325AC0000000073_20260401_506AC0000000008, article 第六十八条 (Num 68), paragraph 4.
Raw: data/raw/325AC0000000073_20260401_506AC0000000008.law.json (SHA-256 c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7). Normative unit: NORM|8689d9ba56a471797ef0a9a690495dcaf7afa565240759409456acef128e0a2f.
Source path: LawBody[3]/MainProvision/MainProvision[7]/Article:68/Article#68/Paragraph#4/ParagraphSentence/Sentence#1.
原文逐語: 「免れた相続税額又は贈与税額が五百万円を超えるときは、情状により、同項の罰金は、五百万円を超えその免れた相続税額又は贈与税額に相当する金額以下とすることができる。」
Scope: ONLY the strict 五百万円を超え threshold (五 = 5,000,000 円) that opens
this discretionary fine rule. The discretionary upper bound (免れた税額に相当
する金額以下), the underlying offense, other paragraphs and other articles are
NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceTaxPenaltyOver5M

open JapanTaxLaw.TaxFinance

/-- 五百万 — を超え (strict, ¥5,000,000). -/
def threshold : Nat := 5_000_000

/-- 「免れた相続税額又は贈与税額が五百万円を超える」. -/
def inScope (evaded : Nat) : Prop := threshold < evaded

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (evaded : Nat) : Bool := decide (5_000_000 < evaded)

end JapanTaxLaw.InheritanceTaxPenaltyOver5M
