import JapanTaxLaw.CustomsTariffArt21Deeming

/-!
# CustomsTariffArt21DeemingSpec — independent spec for 関税定率法 第二十一条(1)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第二十一条(1) 外国とみなす地域 — DEEMING with three conjunctive conditions.
Normative unit: NORM|1171722dae792afda3c164ba383e239e77bbd936df4f4d007090778db64ea0dc

The implementation computes the for-this-Act treatment with a boolean `&&`
chain over (domestic actual status, Cabinet-order designation, provisional period).
The independent spec expresses the deeming as PROPOSITIONAL conditions and states
the effect via pattern matching on RegionStatus — a distinct formulation.
Kernel proves agreement for all (region, period), axiom-free.

「当分の間」 precise temporal bounds are NOT modeled (explicit Bool parameter).
Not modelled: designated-region identity, temporal bounds, other articles, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt21Deeming

/-- Independent spec: the three deeming conditions as a proposition. -/
def SpecDeemingConditions (r : Region) (inProvisionalPeriod : Bool) : Prop :=
  r.actualStatus = RegionStatus.domestic ∧
  r.designatedByCabinetOrder = true ∧
  inProvisionalPeriod = true

/-- Independent spec: for-this-Act treatment by pattern matching (no && chain). -/
def specTreatedAs (r : Region) (inProvisionalPeriod : Bool) : RegionStatus :=
  match r.actualStatus with
  | RegionStatus.foreign => RegionStatus.foreign
  | RegionStatus.domestic =>
      match r.designatedByCabinetOrder && inProvisionalPeriod with
      | true => RegionStatus.foreign
      | false => RegionStatus.domestic

/-- Implementation agrees with the independent spec, for all inputs. Axiom-free. -/
theorem agree_treated_as (r : Region) (p : Bool) :
    treatedAsForThisAct r p = specTreatedAs r p := by
  cases r with
  | mk actual designated =>
      cases actual <;> cases designated <;> cases p <;> rfl

/-- The deeming fiction CHANGES the status iff the three conditions hold, universally.
    Axiom-free. Note: an actually-foreign region is treated foreign trivially, not
    by the fiction — so the correct invariant is about the status CHANGE. -/
theorem deeming_changes_status_iff_conditions (r : Region) (p : Bool) :
    treatedAsForThisAct r p ≠ r.actualStatus ↔ SpecDeemingConditions r p := by
  cases r with
  | mk actual designated =>
      cases actual <;> cases designated <;> cases p <;>
        simp [treatedAsForThisAct, SpecDeemingConditions]

/-- The fiction changes status only for a 本邦の地域 (domestic region): scoped,
    not identity-changing. Axiom-free. -/
theorem deeming_only_changes_domestic (r : Region) (p : Bool) :
    treatedAsForThisAct r p ≠ r.actualStatus → r.actualStatus = RegionStatus.domestic := by
  cases r with
  | mk actual designated =>
      cases actual <;> cases designated <;> cases p <;> simp [treatedAsForThisAct] at *

/-- For an actually-domestic region, being deemed foreign iff the three conditions.
    Axiom-free. -/
theorem domestic_deemed_iff_conditions (d : Bool) (p : Bool) :
    treatedAsForThisAct (Region.mk RegionStatus.domestic d) p = RegionStatus.foreign ↔
      SpecDeemingConditions (Region.mk RegionStatus.domestic d) p := by
  cases d <;> cases p <;> simp [treatedAsForThisAct, SpecDeemingConditions]

end JapanTaxLaw.CustomsTariffArt21Deeming
