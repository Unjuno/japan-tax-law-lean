import JapanTaxLaw.LocalTax72_48TwoAllocationBases

/- Independent spec for 「分割法人が二以上の分割基準を適用すべき事業を併せて行う場合における当該分割法人の事業に係る課税標準額の総額の分割については、これらの事業のうち主たる事業について定められた分割基準によるものとする。」:
statutory literals only, no impl identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax72_48TwoAllocationBases

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := amount ≥ 2

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax72_48TwoAllocationBases
