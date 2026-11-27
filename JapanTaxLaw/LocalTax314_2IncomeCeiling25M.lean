import JapanTaxLaw.TaxFinance

/-
# LocalTax314_2IncomeCeiling25M — pinned clause 「市町村は、前年の合計所得金額が二千五百万円以下である所得割の納税義務者については、その者の前年の所得について算定した総所得金額、退職所得金額又は山林所得金額から、次の各号に掲げる場合の区分に応じ、当該各号に定める金額を控除するものとする。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 314_2, paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|7e278c2b32667e9eceb1e211ae9d12770874aeddc226d0cb7ea1f36244d6c0cf.
Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:314_2/Article#314_2/Paragraph#2/ParagraphSentence/Sentence#1.
原文逐語: 「市町村は、前年の合計所得金額が二千五百万円以下である所得割の納税義務者については、その者の前年の所得について算定した総所得金額、退職所得金額又は山林所得金額から、次の各号に掲げる場合の区分に応じ、当該各号に定める金額を控除するものとする。」
Scope: ONLY the 前年の合計所得金額が二千五百万円以下 (income ≤ 25,000,000) ceiling. 控除額の算定・所得の区分・他の号・項, 他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax314_2IncomeCeiling25M

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (25000000), INCLUSIVE ceiling. -/
def threshold : Nat := 25000000

/-- 「市町村は、前年の合計所得金額が二千五百万円以下である所得割の納税義務者については、その者の前年の所得について算定した総所得金額、退職所得金額又は山林所得金額から、次の各号に掲げる場合の区分に応じ、当該各号に定める金額を控除するものとする。」. -/
def inScope (income : Nat) : Prop := income ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (income : Nat) : Bool := decide (income ≤ 25000000)

end JapanTaxLaw.LocalTax314_2IncomeCeiling25M
