import JapanTaxLaw.LocalTax34RelativeOver1_2M
/- Independent spec for 「前年の合計所得金額が百二十万円を超える特定親族」: statutory literals only; universal
axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax34RelativeOver1_2M
open JapanTaxLaw.TaxFinance
def specInScope (amount : Money) : Prop := Nat.succ 1_200_000 ≤ amount
theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  constructor
  · intro h
    exact Nat.succ_le_of_lt h
  · intro h
    exact Nat.lt_of_succ_le h
end JapanTaxLaw.LocalTax34RelativeOver1_2M
