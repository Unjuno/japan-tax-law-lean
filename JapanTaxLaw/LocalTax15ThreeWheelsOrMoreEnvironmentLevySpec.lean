import JapanTaxLaw.LocalTax15ThreeWheelsOrMoreEnvironmentLevy

/-
# LocalTax15ThreeWheelsOrMoreEnvironmentLevySpec — independent spec for 地方税法 Num 15(1)

Needle 「新法の規定中軽自動車税の環境性能割に関する部分は、施行日以後に取得された三輪以上の軽自動車に対して課すべき軽自動車税の環境性能割について適用し、施行日前に取得された三輪以上の軽自動車に対して課する軽自動車税の環境性能割については、なお従前の例による。」.
The implementation uses `threshold ≤ wheels`; the independent spec states the same
inclusive bound as `3 ≤ wheels`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」 is INCLUSIVE: the threshold itself qualifies and one below does not.
-/
namespace JapanTaxLaw.LocalTax15ThreeWheelsOrMoreEnvironmentLevy

open JapanTaxLaw.TaxFinance

def specInScope (wheels : Nat) : Prop := 3 ≤ wheels

theorem agree_scope (wheels : Nat) : inScope wheels ↔ specInScope wheels := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax15ThreeWheelsOrMoreEnvironmentLevy
