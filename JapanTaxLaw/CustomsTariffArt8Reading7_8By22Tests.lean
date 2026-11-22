import JapanTaxLaw.CustomsTariffArt8Reading7_8By22Spec

/-!
# CustomsTariffArt8Reading7_8By22Tests — kernel-checked checks for 関税定率法 第八条(24)

Verifies the 準用 「第七項及び第八項の規定は、第二十二項の調査が開始された場合について
準用する。」: both source provisions (para 7, 8) apply when the paragraph-22
investigation has begun, none otherwise; paragraph numbers extracted structurally
(7/8, trigger 22); universal agreement with the independent spec.
-/

namespace JapanTaxLaw.CustomsTariffArt8Reading7_8By22

-- Paragraph numbers derived from the verbatim 第七項及び第八項 and 第二十二項.
example : provisionParagraph Provision.para7 = 7 := rfl
example : provisionParagraph Provision.para8 = 8 := rfl
example : triggerParagraph = 22 := rfl

-- 準用 applies to both source provisions when the paragraph-22 investigation has begun.
example : appliesViaReading InvestigationState.para22Started Provision.para7 := rfl
example : appliesViaReading InvestigationState.para22Started Provision.para8 := rfl

-- No application in any other case.
example : ¬ appliesViaReading InvestigationState.other Provision.para7 := by
  intro h
  unfold appliesViaReading at h
  cases h
example : ¬ appliesViaReading InvestigationState.other Provision.para8 := by
  intro h
  unfold appliesViaReading at h
  cases h

-- Universal agreement with the independent spec.
example (s : InvestigationState) (p : Provision) :
    appliesViaReading s p ↔ SpecApplies s p :=
  agree_applies_via_reading s p

end JapanTaxLaw.CustomsTariffArt8Reading7_8By22
