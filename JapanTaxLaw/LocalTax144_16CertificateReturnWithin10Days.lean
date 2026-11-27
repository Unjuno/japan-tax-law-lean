import JapanTaxLaw.TaxFinance

/-
# LocalTax144_16CertificateReturnWithin10Days — pinned clause 「第一項の証票の交付を受けた者は、軽油引取税の特別徴収の義務が消滅した場合又は事務所若しくは事業所を廃止した場合には、その消滅し、又は廃止した日から十日以内にその証票を道府県知事に返さなければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 144_16, paragraph 4.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|e1b051afe2b3a8b76eabc0b473440482e00af8fc5e5a1461bcb9db62de001ca0.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:144_16/Article#144_16/Paragraph#4/ParagraphSentence/Sentence#1.
原文逐語: 「第一項の証票の交付を受けた者は、軽油引取税の特別徴収の義務が消滅した場合又は事務所若しくは事業所を廃止した場合には、その消滅し、又は廃止した日から十日以内にその証票を道府県知事に返さなければならない。」
Scope: ONLY the 消滅し、又は廃止した日から十日以内 (days ≤ 10) deadline. 特別徴収の義務の消滅自体, 事務所・事業所の廃止の認定, 第一項の証票の交付, 返還先の手続, 他の項, 他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax144_16CertificateReturnWithin10Days

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (10), INCLUSIVE ceiling. -/
def threshold : Nat := 10

/-- 「第一項の証票の交付を受けた者は、軽油引取税の特別徴収の義務が消滅した場合又は事務所若しくは事業所を廃止した場合には、その消滅し、又は廃止した日から十日以内にその証票を道府県知事に返さなければならない。」. -/
def inScope (days : Nat) : Prop := days ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days ≤ 10)

end JapanTaxLaw.LocalTax144_16CertificateReturnWithin10Days
