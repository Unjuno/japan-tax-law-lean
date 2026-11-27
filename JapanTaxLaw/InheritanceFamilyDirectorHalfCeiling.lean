import JapanTaxLaw.TaxFinance

/-
# InheritanceFamilyDirectorHalfCeiling — pinned clause 「被相続人の相続開始の直前における当該被相続人に係る同族理事の数の理事の総数のうちに占める割合が二分の一を超えること。」

Pinned: law 325AC0000000073 (相続税法), revision 325AC0000000073_20260401_506AC0000000008,
article Num 66_2, paragraph 2, item 3.
Raw: data/raw/325AC0000000073_20260401_506AC0000000008.law.json (SHA-256 c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7). Normative unit: NORM|a786da436570ed3ab31a2b421051c4cab3a3728e0c20d9f3e9dad0b3463e06ac.
原文逐語: 「被相続人の相続開始の直前における当該被相続人に係る同族理事の数の理事の総数のうちに占める割合が二分の一を超えること。」
Scope: ONLY the 同族理事の数が理事の総数の二分の一を超える STRICT 上限（割合 > 1/2）. 相続開始直前の判定・同族理事/理事の定義・他号他項他条項は NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceFamilyDirectorHalfCeiling

open JapanTaxLaw.TaxFinance

/-- Statutory threshold literal (2) with the inclusive/strict boundary fixed by the clause. -/
def inScope (familyDirectors allDirectors : Nat) : Prop := 2 * familyDirectors > allDirectors

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (familyDirectors allDirectors : Nat) : Bool := decide (2 * familyDirectors > allDirectors)

end JapanTaxLaw.InheritanceFamilyDirectorHalfCeiling
