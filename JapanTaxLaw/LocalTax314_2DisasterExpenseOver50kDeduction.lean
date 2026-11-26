import JapanTaxLaw.TaxFinance

/-
# LocalTax314_2DisasterExpenseOver50kDeduction — pinned clause 「損失の金額の合計額から災害関連支出の金額のうち五万円を超える部分の金額を控除した金額とイに定める金額とのいずれか低い金額」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 314_2, paragraph 1, item 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|39ec66d9d2a2e700826a152219efffd237ed7e17d302f5947936e9b9d6d12e95.
Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:314_2/Article#314_2/Paragraph#1/Item#1/Subitem1#2/Subitem1Sentence/Column#2/Sentence#1.
原文逐語: 「損失の金額の合計額から災害関連支出の金額のうち五万円を超える部分の金額を控除した金額とイに定める金額とのいずれか低い金額」
Scope: ONLY 災害関連支出の金額のうち五万円を超える部分の金額. The 損失の金額の合計額, the イに定める金額 comparison, the 第三十四条 parallel occurrence of the same amount string, the 五万円以下 ceiling and all other subitems are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax314_2DisasterExpenseOver50kDeduction

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (50000), STRICT. -/
def threshold : Nat := 50000

/-- 「災害関連支出の金額のうち五万円を超える部分の金額」. -/
def inScope (excess : Nat) : Prop := threshold < excess

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (excess : Nat) : Bool := decide (50000 < excess)

end JapanTaxLaw.LocalTax314_2DisasterExpenseOver50kDeduction
