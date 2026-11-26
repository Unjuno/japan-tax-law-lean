import JapanTaxLaw.LocalTax321_4TwoSpecialCollectors

/- Independent spec for 「この場合において、特別徴収義務者として二以上の者を指定したときは、給与所得に係る特別徴収税額をこれらの者が当該年度中にそれぞれ支払うべき給与の額に按分して、これを徴収させることができる。」:
statutory literals only, no impl identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax321_4TwoSpecialCollectors

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := amount ≥ 2

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax321_4TwoSpecialCollectors
