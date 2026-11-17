import JapanTaxLaw.CustomsAirCargo

/-!
# CustomsAirCargo spec — 関税定率法 art. 4の6

Sources (pinned; identical to CustomsAirCargo.lean):

  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01

Independent restatement of:
  * 1項: 代替適用時は通常运送方法の運賃等、そうでなければ航空実費
  * 2項: 個人的使用時は卸価格、そうでなければ小売価格
  impl が Bool の if を使うのに対し、spec は match 式による別の定式化で
  独立に保つ。

Scope boundaries identical to the implementation.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: art. 4の6(1) 運賃等の代替（独立定式）。 -/
def specAirFreight (subst : Bool) (conventional freight : Money) : Money :=
  match subst with
  | true => conventional
  | false => freight

/-- Spec: art. 4の6(2) 課税価格の代替（独立定式）。 -/
def specPersonalPrice (personal : Bool) (wholesale retail : Money) : Money :=
  match personal with
  | true => wholesale
  | false => retail

-- ==== points (kernel-decided) ====

example : specAirFreight true 50_000 200_000 = 50_000 := by decide
example : specAirFreight false 50_000 200_000 = 200_000 := by decide
example : specPersonalPrice true 100_000 250_000 = 100_000 := by decide
example : specPersonalPrice false 100_000 250_000 = 250_000 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeCustomsAirCargo : Bool :=
  airFreightForValuation true 50_000 200_000 == specAirFreight true 50_000 200_000
    && airFreightForValuation false 50_000 200_000 == specAirFreight false 50_000 200_000
    && personalUseValue true 100_000 250_000 == specPersonalPrice true 100_000 250_000
    && personalUseValue false 100_000 250_000 == specPersonalPrice false 100_000 250_000

example : agreeCustomsAirCargo = true := by decide

end JapanTaxLaw
