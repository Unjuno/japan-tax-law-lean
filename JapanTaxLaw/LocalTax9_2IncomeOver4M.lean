import JapanTaxLaw.TaxFinance

/-
# LocalTax9_2IncomeOver4M — pinned clause 「各事業年度の所得のうち年四百万円を超える金額」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 9_2, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|759e48c5272d4e80fb1eef6e3ab2e1e8be0f33f1bc07441bce274ec56d3899e5.
Source path: LawBody[3]/SupplProvision/SupplProvision[40]/Article:9_2/Article#9_2/Paragraph#1/ParagraphSentence/Sentence#1/QuoteStruct/TableStruct/Table/TableRow/TableColumn/Sentence#1.
原文逐語: 「各事業年度の所得のうち年四百万円を超える金額」
Scope: ONLY 各事業年度の所得のうち年四百万円を超える金額. The 附則 table's other cells, the 第七十二条の二十四の七 parallel occurrence of the same string, the 一億円 upper band and all other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax9_2IncomeOver4M

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (4000000), STRICT. -/
def threshold : Nat := 4000000

/-- 「各事業年度の所得のうち年四百万円を超える金額」. -/
def inScope (income : Nat) : Prop := threshold < income

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (income : Nat) : Bool := decide (4000000 < income)

end JapanTaxLaw.LocalTax9_2IncomeOver4M
