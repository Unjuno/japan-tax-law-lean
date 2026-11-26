import JapanTaxLaw.TaxFinance

/-!
# TariffSpecificFloor — 93 の 従量税率下限付き関税率

Pinned tariff rows state an ad valorem rate `num/den` percent together with
a specific-duty floor `floor` 円/kg: 「その率が一キログラムにつきY円の
従量税率より低いときは、当該従量税率」. The duty is the larger of the
ad-valorem amount and the specific amount.

`price` is the price per kg (円), `kg` the dutiable weight, `num/den` the
ad-valorem rate as a fraction of the price (e.g. 2.8% → 28/1000), and
`floor` the specific rate in 円/kg. All are Nat; division is floor.
Classification codes and other tariff conditions are caller-established and
NOT MODELLED. Not legal advice.
-/

namespace JapanTaxLaw.TariffSpecificFloor

def tariffDuty (price kg num den floor : Nat) : Nat :=
  if price * num < floor * den then kg * floor else price * kg * num / den

example : tariffDuty 100 1 28 1000 20 = 20 := by decide
example : tariffDuty 100 1 50 100 25 = 50 := by decide
example : tariffDuty 1_000 1 50 100 25 = 500 := by decide

end JapanTaxLaw.TariffSpecificFloor
