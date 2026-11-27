import JapanTaxLaw.LocalTax17_4TwoOrMoreInstallmentsDeeming

/-
# LocalTax17_4TwoOrMoreInstallmentsDeemingSpec — independent spec for 地方税法 Num 17_4/3

Needle 「二以上の納期又は二回以上の分割納付若しくは分割納入に係る地方団体の徴収金につき過誤納を生じた場合には、その過誤納金については、その過誤納金の額に相当する地方団体の徴収金に達するまで、納付又は納入の日の順序に従い最後に納付又は納入された金額から順次遡つて求めた金額からなるものとみなして、第一項の規定を適用する。」.
The implementation uses `threshold ≤ installments`; the independent spec states
the statutory INCLUSIVE lower bound as `2 ≤ installments`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」 is INCLUSIVE: the threshold itself qualifies and one below does not.
-/
namespace JapanTaxLaw.LocalTax17_4TwoOrMoreInstallmentsDeeming

open JapanTaxLaw.TaxFinance

def specInScope (installments : Nat) : Prop := 2 ≤ installments

theorem agree_scope (installments : Nat) : inScope installments ↔ specInScope installments := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax17_4TwoOrMoreInstallmentsDeeming
