import JapanTaxLaw.CustomsTariffArt7PrevParagraphReadingSpec

/-!
# CustomsTariffArt7PrevParagraphReadingTests — kernel-checked checks for 関税定率法 第七条(25)

Verifies the 準用 「第八項、第九項及び第二十項の規定は、前項の調査が開始された場合について
準用する。」: all three source provisions (para 8, 9, 20) apply when the 前項
(para 24) investigation has begun, none otherwise; paragraph numbers extracted
structurally (8/9/20, trigger 24); universal agreement with the independent spec.
-/

namespace JapanTaxLaw.CustomsTariffArt7PrevParagraphReading

-- Paragraph numbers derived from the verbatim 第八項/第九項/第二十項.
example : provisionParagraph Provision.para8 = 8 := rfl
example : provisionParagraph Provision.para9 = 9 := rfl
example : provisionParagraph Provision.para20 = 20 := rfl
example : triggerParagraph = 24 := rfl

-- 準用 applies to all three source provisions when the 前項 investigation has begun.
example : appliesViaReading InvestigationState.prevStarted Provision.para8 := rfl
example : appliesViaReading InvestigationState.prevStarted Provision.para9 := rfl
example : appliesViaReading InvestigationState.prevStarted Provision.para20 := rfl

-- No application in any other case.
example : ¬ appliesViaReading InvestigationState.other Provision.para8 := by
  intro h
  unfold appliesViaReading at h
  cases h
example : ¬ appliesViaReading InvestigationState.other Provision.para9 := by
  intro h
  unfold appliesViaReading at h
  cases h
example : ¬ appliesViaReading InvestigationState.other Provision.para20 := by
  intro h
  unfold appliesViaReading at h
  cases h

-- Universal agreement with the independent spec.
example (s : InvestigationState) (p : Provision) :
    appliesViaReading s p ↔ SpecApplies s p :=
  agree_applies_via_reading s p

end JapanTaxLaw.CustomsTariffArt7PrevParagraphReading
