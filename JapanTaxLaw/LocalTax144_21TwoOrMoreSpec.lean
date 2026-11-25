import JapanTaxLaw.LocalTax144_21TwoOrMore

/- Independent spec for 「二人以上の者が代表者を定めて免税軽油使用者証の交付を受けることができる。」: statutory
literals only, no impl identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax144_21TwoOrMore

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := amount ≥ 2

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax144_21TwoOrMore
