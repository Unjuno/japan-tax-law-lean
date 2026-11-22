import JapanTaxLaw.CustomsTariffArt17Delegation

/-!
# CustomsTariffArt17DelegationSpec — independent spec for 関税定率法 第十七条(1)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第十七条(1) — DELEGATION 「加工される貨物又は加工材料となる貨物で政令で定めるもの」:
         goods classes are prescribed by Cabinet Order (政令で定めるもの).
Normative unit: NORM|35c971a0758598e57593706d43c4732904e25dab80fb92770430a30ab0f83d3f

The implementation is the constant `prescriptionAuthority : Authority`. The
independent spec states it as a propositional predicate over any authority
value (`SpecCabinetOrder a := a = cabinetOrder`), representationally distinct
from the constant and equivalent when applied to it. Axiom-free via rfl/cases.

Not modelled: Cabinet Order content, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt17Delegation

/-- Independent spec: an authority is the Cabinet Order iff it equals cabinetOrder. -/
def SpecCabinetOrder (a : Authority) : Prop :=
  a = Authority.cabinetOrder

/-- Universal agreement (axiom-free). -/
theorem agree_prescription_authority :
    SpecCabinetOrder prescriptionAuthority := by
  rfl

/-- The act is NOT the prescribing authority for this goods class. -/
theorem spec_act_not_cabinet : ¬ SpecCabinetOrder Authority.act := by
  intro h
  cases h

end JapanTaxLaw.CustomsTariffArt17Delegation
