import JapanTaxLaw.TaxFinance

/-
# LocalTax72_2CapitalCeiling100M — pinned clause 「資本金の額又は出資金の額が一億円以下の法人であるかどうか及び資本又は出資を有しない法人であるかどうかの判定並びに前項第一号ロ（１）又は（２）に掲げる法人に該当するものであるかどうかの判定に関し必要な事項の判定（次号に掲げる判定を除く。）」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 72_2, paragraph 2, item 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|11fc94ad2175496397b2419fa27d5e0eed267f716689326d1fd6b67cffdda0e2.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:72_2/Article#72_2/Paragraph#2/Item#1/ItemSentence/Column#1/Sentence#1.
原文逐語: 「資本金の額又は出資金の額が一億円以下の法人であるかどうか及び資本又は出資を有しない法人であるかどうかの判定並びに前項第一号ロ（１）又は（２）に掲げる法人に該当するものであるかどうかの判定に関し必要な事項の判定（次号に掲げる判定を除く。）」
Scope: ONLY the 資本金の額又は出資金の額が一億円以下 (capital ≤ 100,000,000) ceiling. 資本又は出資を有しない法人の判定・前項第一号ロの判定・他号他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_2CapitalCeiling100M

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (100000000), INCLUSIVE ceiling. -/
def threshold : Nat := 100000000

/-- 「資本金の額又は出資金の額が一億円以下の法人であるかどうか及び資本又は出資を有しない法人であるかどうかの判定並びに前項第一号ロ（１）又は（２）に掲げる法人に該当するものであるかどうかの判定に関し必要な事項の判定（次号に掲げる判定を除く。）」. -/
def inScope (capital : Nat) : Prop := capital ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (capital : Nat) : Bool := decide (capital ≤ 100000000)

end JapanTaxLaw.LocalTax72_2CapitalCeiling100M
