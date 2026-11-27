import JapanTaxLaw.LocalTax20_4_2TwoOrMoreInstallments

/-
# LocalTax20_4_2TwoOrMoreInstallmentsSpec — independent spec for 地方税法 Num 20_4_2/6

Needle 「地方税の確定金額を、二以上の納期限を定め、一定の金額に分割して納付し、又は納入することとされている場合において、その納期限ごとの分割金額に千円未満の端数があるとき、又はその分割金額の全額が千円未満であるときは、その端数金額又はその全額は、すべて最初の納期限に係る分割金額に合算するものとする。」.
The implementation uses `threshold ≤ deadlines`; the independent spec states
the statutory INCLUSIVE lower bound as `2 ≤ deadlines`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」 is INCLUSIVE: the threshold itself qualifies and one below does not.
-/
namespace JapanTaxLaw.LocalTax20_4_2TwoOrMoreInstallments

open JapanTaxLaw.TaxFinance

def specInScope (deadlines : Nat) : Prop := 2 ≤ deadlines

theorem agree_scope (deadlines : Nat) : inScope deadlines ↔ specInScope deadlines := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax20_4_2TwoOrMoreInstallments
