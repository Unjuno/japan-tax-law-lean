import JapanTaxLaw.CustomsTariffArt8PrevReading7_8_23Spec

/-!
# CustomsTariffArt8PrevReading7_8_23Tests — kernel-checked checks for 関税定率法 第八条(28)

Verifies the 準用 「第七項、第八項及び第二十三項の規定は、前項の調査が開始された場合について準用する。」:
all three source provisions (para 7, 8, 23) apply when the 前項 (para 27)
investigation has begun, none otherwise; paragraph numbers extracted structurally
(7/8/23, trigger 27); universal agreement with the independent spec.
-/

namespace JapanTaxLaw.CustomsTariffArt8PrevReading7_8_23

-- Paragraph numbers derived from the verbatim 第七項、第八項及び第二十三項 and source path.
example : provisionParagraph Provision.para7 = 7 := rfl
example : provisionParagraph Provision.para8 = 8 := rfl
example : provisionParagraph Provision.para23 = 23 := rfl
example : triggerParagraph = 27 := rfl

-- 準用 applies to all three source provisions when the 前項 investigation has begun.
example : appliesViaReading InvestigationState.prevStarted Provision.para7 := rfl
example : appliesViaReading InvestigationState.prevStarted Provision.para8 := rfl
example : appliesViaReading InvestigationState.prevStarted Provision.para23 := rfl

-- No application in any other case.
example : ¬ appliesViaReading InvestigationState.other Provision.para7 := by
  intro h
  unfold appliesViaReading at h
  cases h
example : ¬ appliesViaReading InvestigationState.other Provision.para8 := by
  intro h
  unfold appliesViaReading at h
  cases h
example : ¬ appliesViaReading InvestigationState.other Provision.para23 := by
  intro h
  unfold appliesViaReading at h
  cases h

-- Universal agreement with the independent spec.
example (s : InvestigationState) (p : Provision) :
    appliesViaReading s p ↔ SpecApplies s p :=
  agree_applies_via_reading s p

end JapanTaxLaw.CustomsTariffArt8PrevReading7_8_23
