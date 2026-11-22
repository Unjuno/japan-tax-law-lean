import JapanTaxLaw.CustomsTariffArt8PrevReading6to8Spec

/-!
# CustomsTariffArt8PrevReading6to8Tests — kernel-checked checks for 関税定率法 第八条(14)

Verifies the 準用 「第六項から第八項までの規定は、前項の調査が開始された場合について
準用する。」: all three source provisions (para 6, 7, 8) apply when the 前項
(para 13) investigation has begun, none otherwise; paragraph numbers extracted
structurally (6/7/8, trigger 13); universal agreement with the independent spec.
-/

namespace JapanTaxLaw.CustomsTariffArt8PrevReading6to8

-- Paragraph numbers derived from the verbatim 第六項から第八項まで and source path.
example : provisionParagraph Provision.para6 = 6 := rfl
example : provisionParagraph Provision.para7 = 7 := rfl
example : provisionParagraph Provision.para8 = 8 := rfl
example : triggerParagraph = 13 := rfl

-- 準用 applies to all three source provisions when the 前項 investigation has begun.
example : appliesViaReading InvestigationState.prevStarted Provision.para6 := rfl
example : appliesViaReading InvestigationState.prevStarted Provision.para7 := rfl
example : appliesViaReading InvestigationState.prevStarted Provision.para8 := rfl

-- No application in any other case.
example : ¬ appliesViaReading InvestigationState.other Provision.para6 := by
  intro h
  unfold appliesViaReading at h
  cases h
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

end JapanTaxLaw.CustomsTariffArt8PrevReading6to8
