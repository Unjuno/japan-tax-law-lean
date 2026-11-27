import JapanTaxLaw.TaxFinance

/-
# LocalTax522_2MiningFilingFineCeiling100k — pinned clause 「市町村は、鉱産税の納税者が正当な事由がなくて前条の規定による申告書を同条に規定する申告書の提出期限までに提出しなかつた場合においては、その者に対し、当該市町村の条例で十万円以下の過料を科する旨の規定を設けることができる。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 522_2, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|d5e8337731ae44b8a3209c1c44ca3c71baaed46047161938f212a87f4d2ba152.
Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:522_2/Article#522_2/Paragraph#1/ParagraphSentence/Sentence#1.
原文逐語: 「市町村は、鉱産税の納税者が正当な事由がなくて前条の規定による申告書を同条に規定する申告書の提出期限までに提出しなかつた場合においては、その者に対し、当該市町村の条例で十万円以下の過料を科する旨の規定を設けることができる。」
Scope: ONLY the 十万円以下 (fine ≤ 100,000) INCLUSIVE ceiling for the 過料 on a late 鉱産税 申告書. 正当な事由の認定・条例の内容・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax522_2MiningFilingFineCeiling100k

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (100000), INCLUSIVE ceiling. -/
def threshold : Nat := 100000

/-- 「市町村は、鉱産税の納税者が正当な事由がなくて前条の規定による申告書を同条に規定する申告書の提出期限までに提出しなかつた場合においては、その者に対し、当該市町村の条例で十万円以下の過料を科する旨の規定を設けることができる。」. -/
def inScope (fine : Nat) : Prop := fine ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (fine : Nat) : Bool := decide (fine ≤ 100000)

end JapanTaxLaw.LocalTax522_2MiningFilingFineCeiling100k
