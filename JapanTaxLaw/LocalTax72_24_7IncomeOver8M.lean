import JapanTaxLaw.TaxFinance

/-
# LocalTax72_24_7IncomeOver8M — pinned clause 「各事業年度の所得のうち年八百万円を超える金額」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002, article 第七十二条の二十四の七 (Num 72_24_7), paragraph 1, item 3.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|ad52185987fff99ddb9f5dc7564d515a6847119b2ac2ce67cfc93effc1092877.
原文逐語: 「各事業年度の所得のうち年八百万円を超える金額」
Scope: ONLY the strict 八百万円を超え threshold of this clause. The paired tax rate,
the other table cells, other items / paragraphs and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_24_7IncomeOver8M

open JapanTaxLaw.TaxFinance

/-- 八百万 — を超え (strict). -/
def threshold : Nat := 8_000_000

/-- 「各事業年度の所得のうち年八百万円を超える金額」. -/
def inScope (amount : Nat) : Prop := threshold < amount

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (8_000_000 < amount)

end JapanTaxLaw.LocalTax72_24_7IncomeOver8M
