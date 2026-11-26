import JapanTaxLaw.TaxFinance

/-
# LocalTax7_2IncomeOver9M — pinned clause 「九百万円を超える金額」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002, article 第七条の二 (Num 7_2), paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|173f3086befe70ad8fce20705614f112024e97f394f82a7288a55061794155a5.
原文逐語: 「九百万円を超える金額」
Scope: ONLY the strict 九百万円を超え threshold of this clause. The paired tax
rate, the other table cells, other paragraphs and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax7_2IncomeOver9M

open JapanTaxLaw.TaxFinance

/-- 九百万 — を超え (strict). -/
def threshold : Nat := 9_000_000

/-- 「九百万円を超える金額」. -/
def inScope (amount : Nat) : Prop := threshold < amount

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (9_000_000 < amount)

end JapanTaxLaw.LocalTax7_2IncomeOver9M
