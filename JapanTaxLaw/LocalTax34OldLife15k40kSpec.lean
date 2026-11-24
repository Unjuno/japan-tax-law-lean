import JapanTaxLaw.LocalTax34OldLife15k40k
/- Independent spec for 「前年中に支払つた旧生命保険料の金額の合計額が一万五千円を超え四万円以下である場合」: statutory literals only; universal
axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax34OldLife15k40k
open JapanTaxLaw.TaxFinance
def specInScope (amount : Money) : Prop := Nat.succ 15_000 ≤ amount ∧ amount ≤ 40_000
theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope lower upper
  constructor
  · rintro ⟨loOk, hiOk⟩
    exact ⟨Nat.succ_le_of_lt loOk, hiOk⟩
  · rintro ⟨loOk, hiOk⟩
    exact ⟨Nat.lt_of_succ_le loOk, hiOk⟩
end JapanTaxLaw.LocalTax34OldLife15k40k
