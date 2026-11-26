import JapanTaxLaw.TaxFinance

/-
# LocalTax144_33FineCeiling7M — pinned clause 「七年以下の拘禁刑若しくは七百万円以下の罰金に処し、又はこれを併科する。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002, article 第百四十四条の三十三 (Num 144_33), paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|48959028bb9de1c9c17fd4332379c0417d316df9696589f1c981a23cf9253b2d.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:144_33/Article#144_33/Paragraph#2/ParagraphSentence/Sentence#1.
原文逐語: 「情を知つて、前項の罪に当たる行為に要する資金、土地、建物、艦船、車両、設備、機械、器具、原材料又は薬品を提供し、又は運搬したときは、その違反行為をした者は、七年以下の拘禁刑若しくは七百万円以下の罰金に処し、又はこれを併科する。」
Scope: ONLY the inclusive 七百万円以下 fine ceiling (七 = 7,000,000 円) in this
aiding-and-abetting penalty clause. The parallel 七年以下の拘禁刑 ceiling, the
list of provided articles, the offense elements, the concurrent-sentence option
and all other paragraphs and articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax144_33FineCeiling7M

open JapanTaxLaw.TaxFinance

/-- 七百万 — 以下 (inclusive ceiling, ¥7,000,000). -/
def threshold : Nat := 7_000_000

/-- 「七百万円以下の罰金に処し」. -/
def inScope (fine : Nat) : Prop := fine ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (fine : Nat) : Bool := decide (fine ≤ 7_000_000)

end JapanTaxLaw.LocalTax144_33FineCeiling7M
