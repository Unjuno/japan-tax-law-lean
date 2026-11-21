import JapanTaxLaw.CustomsTariffArt21DeemingSpec

/-!
# CustomsTariffArt21DeemingTests — kernel-checked checks for 関税定率法 第二十一条(1)

Verifies the scoped DEEMING: a Cabinet-order-designated domestic region is
treated as foreign for this Act during the provisional period; the fiction is
conditional, scoped (never mutates actual status), and agrees with the spec.
-/

namespace JapanTaxLaw.CustomsTariffArt21Deeming

open RegionStatus

-- A designated domestic region during the provisional period is deemed foreign.
example : treatedAsForThisAct (Region.mk domestic true) true = foreign := rfl

-- Each condition is necessary: no deeming if not designated...
example : treatedAsForThisAct (Region.mk domestic false) true = domestic := rfl
-- ...not in the provisional period...
example : treatedAsForThisAct (Region.mk domestic true) false = domestic := rfl
-- ...or already foreign (fiction applies to 本邦の地域 only).
example : treatedAsForThisAct (Region.mk foreign true) true = foreign := rfl

-- Universal agreement with the independent spec.
example (r : Region) (p : Bool) : treatedAsForThisAct r p = specTreatedAs r p :=
  agree_treated_as r p

-- The fiction changes status iff the three conditions hold, universal.
example (r : Region) (p : Bool) :
    treatedAsForThisAct r p ≠ r.actualStatus ↔ SpecDeemingConditions r p :=
  deeming_changes_status_iff_conditions r p

-- The fiction changes status only for a 本邦の地域 (domestic), universally.
example (r : Region) (p : Bool) :
    treatedAsForThisAct r p ≠ r.actualStatus → r.actualStatus = domestic :=
  deeming_only_changes_domestic r p

-- For an actually-domestic region, deemed foreign iff the three conditions.
example (d : Bool) (p : Bool) :
    treatedAsForThisAct (Region.mk domestic d) p = foreign ↔
      SpecDeemingConditions (Region.mk domestic d) p :=
  domestic_deemed_iff_conditions d p

end JapanTaxLaw.CustomsTariffArt21Deeming
