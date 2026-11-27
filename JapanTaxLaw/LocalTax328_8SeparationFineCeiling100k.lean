import JapanTaxLaw.TaxFinance

/-
# LocalTax328_8SeparationFineCeiling100k — pinned clause 「市町村は、分離課税に係る所得割の納税義務者が退職所得申告書を正当な理由がなくて提出しなかつた場合には、その者に対し、当該市町村の条例で十万円以下の過料を科する旨の規定を設けることができる。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 328_8, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|19d6869ad5c8922d23d284bb9abec07606a5132e82123a2d9af1b5fe7d2a4181.
Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:328_8/Article#328_8/Paragraph#1/ParagraphSentence/Sentence#1.
原文逐語: 「市町村は、分離課税に係る所得割の納税義務者が退職所得申告書を正当な理由がなくて提出しなかつた場合には、その者に対し、当該市町村の条例で十万円以下の過料を科する旨の規定を設けることができる。」
Scope: ONLY the 十万円以下 (fine ≤ 100,000) INCLUSIVE ceiling for the 過料 on failing to file a 退職所得申告書. 正当な理由の認定・条例の内容・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax328_8SeparationFineCeiling100k

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (100000), INCLUSIVE ceiling. -/
def threshold : Nat := 100000

/-- 「市町村は、分離課税に係る所得割の納税義務者が退職所得申告書を正当な理由がなくて提出しなかつた場合には、その者に対し、当該市町村の条例で十万円以下の過料を科する旨の規定を設けることができる。」. -/
def inScope (fine : Nat) : Prop := fine ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (fine : Nat) : Bool := decide (fine ≤ 100000)

end JapanTaxLaw.LocalTax328_8SeparationFineCeiling100k
