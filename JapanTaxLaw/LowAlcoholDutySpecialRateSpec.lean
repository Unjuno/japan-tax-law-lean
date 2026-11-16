import JapanTaxLaw.LowAlcoholDutySpecialRate

/-!
# LowAlcoholDutySpecialRate spec — independent restatement of
  租税特別措置法 art. 87の2（低アルコール分の蒸留酒類等に係る酒税の税率の特例）

Sources (pinned; identical to LowAlcoholDutySpecialRate.lean):

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: E6E6013BBC0608C6B48DEA01D50AC847C3E5D094F0420223171FFE1B5CF8D5EE

Independent restatement of the pinned text:
  * 蒸留酒類（アルコール分 < 13°・第二十一号に規定するリキュールは < 12°）は
    「酒税法第二十三条の規定にかかわらず、次の各号に掲げる区分に応じ、
    一キロリットルにつき、当該各号に定める金額とする。
     一アルコール分が十一度未満のもの十万円
     二アルコール分が十一度以上十三度未満のもの十万円にアルコール分が十度を超える一度ごとに一万円を加えた金額」
from the statutory text itself.

Scope boundaries identical to the implementation.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 蒸留酒類の税額（キロリットル当たり・Art. 87の2 一・二）。 -/
def specDistilledDutyRate (alcoholDeg : Nat) : Option Money :=
  if alcoholDeg < 11 then some 100_000
  else if alcoholDeg < 13 then some (100_000 + (alcoholDeg - 10) * 10_000)
  else none

/-- Spec: リキュールの税額（キロリットル当たり・< 12° 限定）。 -/
def specLiqueurDutyRate (alcoholDeg : Nat) : Option Money :=
  if alcoholDeg < 11 then some 100_000
  else if alcoholDeg < 12 then some (100_000 + (alcoholDeg - 10) * 10_000)
  else none

/-- Spec: art. 87の2 特例税率。 -/
def specLowAlcoholDutyPerKiloLitre (cat : LowAlcoholCategory) (alcoholDeg : Nat) : Option Money :=
  match cat with
  | LowAlcoholCategory.distilled => specDistilledDutyRate alcoholDeg
  | LowAlcoholCategory.liqueur => specLiqueurDutyRate alcoholDeg

-- ==== points (kernel-decided) ====

example : specDistilledDutyRate 0 = some 100_000 := by decide
example : specDistilledDutyRate 10 = some 100_000 := by decide
example : specDistilledDutyRate 11 = some 110_000 := by decide
example : specDistilledDutyRate 12 = some 120_000 := by decide
example : specDistilledDutyRate 13 = none := by decide

example : specLiqueurDutyRate 0 = some 100_000 := by decide
example : specLiqueurDutyRate 10 = some 100_000 := by decide
example : specLiqueurDutyRate 11 = some 110_000 := by decide
example : specLiqueurDutyRate 12 = none := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeLowAlcoholDutyPoints : Bool :=
  [0, 10, 11, 12, 13].all fun a =>
    specDistilledDutyRate a == distilledDutyRate a
  &&
  [0, 10, 11, 12, 13].all fun a =>
    specLiqueurDutyRate a == liqueurDutyRate a

example : agreeLowAlcoholDutyPoints = true := by decide

end JapanTaxLaw
