import JapanTaxLaw.TaxFinance

/-
# LocalTax72_48TwoAllocationBases — pinned clause 「分割法人が二以上の分割基準を適用すべき事業を併せて行う場合における当該分割法人の事業に係る課税標準額の総額の分割については、これらの事業のうち主たる事業について定められた分割基準によるものとする。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002, article 72_48.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json. Normative unit: NORM|a560ff959067b90c251085b623b796fdf623c4f123bb2bfb9f5e714e9ce2a9b8.
原文逐語: 「分割法人が二以上の分割基準を適用すべき事業を併せて行う場合における当該分割法人の事業に係る課税標準額の総額の分割については、これらの事業のうち主たる事業について定められた分割基準によるものとする。」
Scope: ONLY the inclusive 二以上 threshold of this clause. The notification,
approval, apportionment and all other procedures are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_48TwoAllocationBases

open JapanTaxLaw.TaxFinance

/-- 二 — 以上（inclusive） threshold (分割法人の二以上の分割基準). -/
def threshold : Nat := 2

/-- Statutory trigger 「分割法人が二以上の分割基準を適用すべき事業を併せて行う場合における当該分割法人の事業に係る課税標準額の総額の分割については、これらの事業のうち主たる事業について定められた分割基準によるものとする。」. -/
def inScope (amount : Nat) : Prop := amount ≥ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount ≥ 2)

end JapanTaxLaw.LocalTax72_48TwoAllocationBases
