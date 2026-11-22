import JapanTaxLaw.CustomsTariffArt14UnconditionalExemption

/-!
# CustomsTariffArt14UnconditionalExemptionSpec — independent spec for 関税定率法 第十四条(1)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第十四条(1) — DELEGATION 「次に掲げる貨物で輸入されるものについては、政令で定めるところにより、その関税を免除する。」:
         duty exemption for the enumerated imported goods is prescribed by Cabinet Order.
Normative unit: NORM|f6d35dafe6f1a5d34c574d8205cb86f3a7c970ed725d5ad49d6d7824b4509d64

The implementation is the constant `exemptionAuthority : Authority`. The
independent spec states the same delegation as a propositional predicate over
any authority value (`SpecCabinetOrder a := a = cabinetOrder`), representationally
distinct from the constant and equivalent when applied to the implementation.
Axiom-free via rfl/cases — no decide-as-proof/simp/propext.

Not modelled: item substance, Cabinet Order content, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt14UnconditionalExemption

/-- Independent spec: an authority is the Cabinet Order iff it equals cabinetOrder. -/
def SpecCabinetOrder (a : Authority) : Prop :=
  a = Authority.cabinetOrder

/-- Universal agreement (axiom-free). -/
theorem agree_exemption_authority :
    SpecCabinetOrder exemptionAuthority := by
  rfl

/-- The act is NOT the prescribing authority for this exemption. -/
theorem spec_act_not_cabinet : ¬ SpecCabinetOrder Authority.act := by
  intro h
  cases h

end JapanTaxLaw.CustomsTariffArt14UnconditionalExemption
