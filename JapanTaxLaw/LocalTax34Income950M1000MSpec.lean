import JapanTaxLaw.LocalTax34Income950M1000M
/- Independent spec for 「当該納税義務者の前年の合計所得金額が九百五十万円を超え千万円以下である場合」: statutory literals only; universal
axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax34Income950M1000M
open JapanTaxLaw.TaxFinance
def specInScope (amount : Money) : Prop := Nat.succ 9_500_000 ≤ amount ∧ amount ≤ 10_000_000
theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope lower upper
  constructor
  · rintro ⟨loOk, hiOk⟩
    exact ⟨Nat.succ_le_of_lt loOk, hiOk⟩
  · rintro ⟨loOk, hiOk⟩
    exact ⟨Nat.lt_of_succ_le loOk, hiOk⟩
end JapanTaxLaw.LocalTax34Income950M1000M
