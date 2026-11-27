import JapanTaxLaw.TaxFinance

/-
# LocalTax72_40DecisionWithinThreeMonths — pinned clause 「この場合において、正当な事由がなくて当該税務官署が当該更正又は決定の請求を受けた日から三月以内に更正又は決定をしないときは、道府県知事は、当該税務官署を監督する税務官署に更正又は決定をすべき旨を請求することができる。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 72_40, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|3ba81a308c698e5d332b0cac0ef9aea24c86821f3de8da7c2767144001c41b7e.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:72_40/Article#72_40/Paragraph#1/ParagraphSentence/Sentence#2.
原文逐語: 「この場合において、正当な事由がなくて当該税務官署が当該更正又は決定の請求を受けた日から三月以内に更正又は決定をしないときは、道府県知事は、当該税務官署を監督する税務官署に更正又は決定をすべき旨を請求することができる。」
Scope: ONLY the 請求を受けた日から三月以内 (months ≤ 3) ceiling. 正当な事由の有無・監督税務官署への請求手続・更正決定の内容・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_40DecisionWithinThreeMonths

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (3), INCLUSIVE ceiling. -/
def threshold : Nat := 3

/-- 「この場合において、正当な事由がなくて当該税務官署が当該更正又は決定の請求を受けた日から三月以内に更正又は決定をしないときは、道府県知事は、当該税務官署を監督する税務官署に更正又は決定をすべき旨を請求することができる。」. -/
def inScope (months : Nat) : Prop := months ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (months : Nat) : Bool := decide (months ≤ 3)

end JapanTaxLaw.LocalTax72_40DecisionWithinThreeMonths
