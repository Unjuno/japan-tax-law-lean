import JapanTaxLaw.LocalTax314_2NewAnnuityOver56k

/- Independent spec for 「前年中に支払つた新個人年金保険料の金額の合計額が五万六千円を超える場合」: statutory literals only, no implementation
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax314_2NewAnnuityOver56k

open JapanTaxLaw.TaxFinance

/-- Independently transcribed statutory condition (literals only). -/
def specInScope (amount : Money) : Prop := Nat.succ 56_000 ≤ amount

theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope lower threshold
  constructor
  · intro h
    exact Nat.succ_le_of_lt h
  · intro h
    exact Nat.lt_of_succ_le h

end JapanTaxLaw.LocalTax314_2NewAnnuityOver56k
