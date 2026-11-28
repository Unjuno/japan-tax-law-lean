import JapanTaxLaw.TaxFinance

/-
# LocalTax75_2Age70OrMore — pinned clause 「年齢七十歳以上の者」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 75_2, paragraph 1, item 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|d0afba42bad0f0e8a31897eb72ec8b88fc235eb0e5ea0c936283ce1d7bca86d6.
原文逐語: 「年齢七十歳以上の者」
Scope: ONLY the 年齢七十歳以上の者という INCLUSIVE 下限（age >= 70）. 控除対象扶養親族の他の要件・老人扶養親族の区分・他項他条項は NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax75_2Age70OrMore

open JapanTaxLaw.TaxFinance

/-- Statutory threshold literal (70) with the inclusive boundary fixed by the clause. -/
def inScope (age : Nat) : Prop := age >= 70

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (age : Nat) : Bool := decide (age >= 70)

end JapanTaxLaw.LocalTax75_2Age70OrMore
