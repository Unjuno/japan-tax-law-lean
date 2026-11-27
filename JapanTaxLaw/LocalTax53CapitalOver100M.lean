import JapanTaxLaw.TaxFinance

/-
# LocalTax53CapitalOver100M — pinned clause 「納税申告書に係る事業年度開始の日（公共法人等にあつては、前年四月一日）現在における資本金の額又は出資金の額が一億円を超える法人」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 53, paragraph 66, item 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|0ede6682bb3d0d5af128a9ee5d4a5dc1e271e59892cc37d3b574788afe685d8b.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:53/Article#53/Paragraph#66/Item#1/ItemSentence/Sentence#1.
原文逐語: 「納税申告書に係る事業年度開始の日（公共法人等にあつては、前年四月一日）現在における資本金の額又は出資金の額が一億円を超える法人」
Scope: ONLY the 資本金の額又は出資金の額が一億円を超える法人 (yen > 100000000) STRICT lower bound in this item. 事業年度開始の日・公共法人等の特例・法人税割の計算・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax53CapitalOver100M

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (100000000), STRICT lower bound. -/
def threshold : Nat := 100000000

/-- 「納税申告書に係る事業年度開始の日（公共法人等にあつては、前年四月一日）現在における資本金の額又は出資金の額が一億円を超える法人」. -/
def inScope (yen : Nat) : Prop := threshold < yen

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (yen : Nat) : Bool := decide (100000000 < yen)

end JapanTaxLaw.LocalTax53CapitalOver100M
