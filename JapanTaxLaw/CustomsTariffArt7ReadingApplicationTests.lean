import JapanTaxLaw.CustomsTariffArt7ReadingApplicationSpec

/-!
# CustomsTariffArt7ReadingApplicationTests — kernel-checked checks for 関税定率法 第七条(21)

Verifies the 準用 「第八項及び第九項の規定は、第十九項の調査が開始された場合について
準用する。」: both source provisions (para 8, para 9) apply when the para-19
investigation has begun, and neither applies otherwise; paragraph numbers
extracted structurally (8, 9, 19); universal agreement with the independent spec.
-/

namespace JapanTaxLaw.CustomsTariffArt7ReadingApplication

-- Paragraph numbers derived from the verbatim 第八項/第九項/第十九項.
example : provisionParagraph Provision.para8 = 8 := rfl
example : provisionParagraph Provision.para9 = 9 := rfl
example : triggerParagraph = 19 := rfl

-- 準用 applies to both source provisions when the para-19 investigation has begun.
example : appliesViaReading InvestigationState.para19Started Provision.para8 := rfl
example : appliesViaReading InvestigationState.para19Started Provision.para9 := rfl

-- No application in any other case.
example : ¬ appliesViaReading InvestigationState.other Provision.para8 := by
  intro h
  unfold appliesViaReading at h
  contradiction
example : ¬ appliesViaReading InvestigationState.other Provision.para9 := by
  intro h
  unfold appliesViaReading at h
  contradiction

-- Universal agreement with the independent spec.
example (s : InvestigationState) (p : Provision) :
    appliesViaReading s p ↔ SpecApplies s p :=
  agree_applies_via_reading s p

end JapanTaxLaw.CustomsTariffArt7ReadingApplication
