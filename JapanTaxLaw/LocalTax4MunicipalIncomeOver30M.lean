import JapanTaxLaw.TaxFinance

/-
# LocalTax4MunicipalIncomeOver30M — pinned clause 「ただし、当該納税義務者の前年の合計所得金額が三千万円を超える年度分の市町村民税の所得割については、この限りでない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002, article 第四条 (Num 4), paragraph 10 (附則, SupplProvision[8]), sentence 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|1c7214750d121f7442a8bfbeb97da2332dafa39cf38696835515cd565588dd8d.
Source path: LawBody[3]/SupplProvision/SupplProvision[8]/Article:4/Article#4/Paragraph#10/ParagraphSentence/Sentence#2.
原文逐語: 「ただし、当該納税義務者の前年の合計所得金額が三千万円を超える年度分の市町村民税の所得割については、この限りでない。」
Scope: ONLY the strict 三千万円を超え threshold (三 = 30,000,000 円) that opens
this 市町村民税 proviso. The exception's legal effect (この限りでない), the
道府県民税 counterpart, the parallel 第四条の二 clause and all other paragraphs
and articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax4MunicipalIncomeOver30M

open JapanTaxLaw.TaxFinance

/-- 三千万 — を超え (strict, ¥30,000,000). -/
def threshold : Nat := 30_000_000

/-- 「前年の合計所得金額が三千万円を超える年度分」. -/
def inScope (income : Nat) : Prop := threshold < income

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (income : Nat) : Bool := decide (30_000_000 < income)

end JapanTaxLaw.LocalTax4MunicipalIncomeOver30M
