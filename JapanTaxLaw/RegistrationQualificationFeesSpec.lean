import JapanTaxLaw.RegistrationQualificationFees

/-!
# RegistrationQualificationFees spec — independent restatement of
  登録免許税法 別表第一（二）第三十二号（人の資格の登録若しくは認定又は技能証明）(一)〜(九)

Sources (pinned; identical to RegistrationQualificationFees.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: (same as RegistrationTax.lean pin)

Independent restatement of:
  * 別表第一（二）第三十二号 の (一)〜(九) の各登録件数一件につきの flat 額
from the statutory text itself.

Scope boundaries identical to the implementation (33 に至る以降は未モデル化).
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: (一）イ 公認会計士の登録。 -/
def specCertifiedPublicAccountantRegistrationFee : Money := 60_000
/-- Spec: (一）ロ 外国公認会計士の登録。 -/
def specForeignCertifiedPublicAccountantRegistrationFee : Money := 60_000
/-- Spec: (二） 行政書士の登録。 -/
def specAdministrativeScrivenerRegistrationFee : Money := 30_000
/-- Spec: (二の二） 政治資金監査人の登録。 -/
def specPoliticalFundsComplianceAuditorRegistrationFee : Money := 15_000
/-- Spec: (三） 弁護士の登録。 -/
def specAttorneyRegistrationFee : Money := 60_000
/-- Spec: (四） 外国法事務弁護士の登録。 -/
def specForeignLegalAffairsAttorneyRegistrationFee : Money := 60_000
/-- Spec: (五）イ 司法書士の登録。 -/
def specJudicialScrivenerRegistrationFee : Money := 30_000
/-- Spec: (五）ロ 簡裁訴訟代理等関係業務の認定。 -/
def specSimplifyCourtLitigationAgencyCertificationFee : Money := 5_000
/-- Spec: (六）イ 土地家屋調査士の登録。 -/
def specLandAndBuildingSurveyorRegistrationFee : Money := 30_000
/-- Spec: (六）ロ 民間紛争解決手続代理関係業務の認定。 -/
def specAlternativeDisputeResolutionAgencyCertificationFee : Money := 5_000
/-- Spec: (七） 税理士の登録。 -/
def specTaxAccountantRegistrationFee : Money := 60_000
/-- Spec: (八）イ 技術士の登録。 -/
def specRegisteredEngineerRegistrationFee : Money := 30_000
/-- Spec: (八）ロ 技術士補の登録。 -/
def specAssistantEngineerRegistrationFee : Money := 15_000
/-- Spec: (八の二） 公認心理師の登録。 -/
def specCertifiedPsychologistRegistrationFee : Money := 15_000
/-- Spec: (九）イ（１） 医師又は歯科医師の登録。 -/
def specPhysicianDentistRegistrationFee : Money := 60_000
/-- Spec: (九）イ（２） 薬剤師の登録。 -/
def specPharmacistRegistrationFee : Money := 30_000
/-- Spec: (九）イ（３） 保健師、助産師、看護師、理学療法士、作業療法士、診療放射線技師、
    臨床検査技師、視能訓練士、臨床工学技士又は義肢装具士の登録。 -/
def specHealthNurseEtcRegistrationFee : Money := 9_000
/-- Spec: (九）ロ 登録事項の変更の登録。 -/
def specRegistrationModificationFee : Money := 1_000

example : specCertifiedPublicAccountantRegistrationFee = 60_000 := by decide
example : specForeignCertifiedPublicAccountantRegistrationFee = 60_000 := by decide
example : specAdministrativeScrivenerRegistrationFee = 30_000 := by decide
example : specPoliticalFundsComplianceAuditorRegistrationFee = 15_000 := by decide
example : specAttorneyRegistrationFee = 60_000 := by decide
example : specForeignLegalAffairsAttorneyRegistrationFee = 60_000 := by decide
example : specJudicialScrivenerRegistrationFee = 30_000 := by decide
example : specSimplifyCourtLitigationAgencyCertificationFee = 5_000 := by decide
example : specLandAndBuildingSurveyorRegistrationFee = 30_000 := by decide
example : specAlternativeDisputeResolutionAgencyCertificationFee = 5_000 := by decide
example : specTaxAccountantRegistrationFee = 60_000 := by decide
example : specRegisteredEngineerRegistrationFee = 30_000 := by decide
example : specAssistantEngineerRegistrationFee = 15_000 := by decide
example : specCertifiedPsychologistRegistrationFee = 15_000 := by decide
example : specPhysicianDentistRegistrationFee = 60_000 := by decide
example : specPharmacistRegistrationFee = 30_000 := by decide
example : specHealthNurseEtcRegistrationFee = 9_000 := by decide
example : specRegistrationModificationFee = 1_000 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeRegistrationQualificationFees : Bool :=
  specCertifiedPublicAccountantRegistrationFee == certifiedPublicAccountantRegistrationFee &&
    specForeignCertifiedPublicAccountantRegistrationFee == foreignCertifiedPublicAccountantRegistrationFee &&
    specAdministrativeScrivenerRegistrationFee == administrativeScrivenerRegistrationFee &&
    specPoliticalFundsComplianceAuditorRegistrationFee == politicalFundsComplianceAuditorRegistrationFee &&
    specAttorneyRegistrationFee == attorneyRegistrationFee &&
    specForeignLegalAffairsAttorneyRegistrationFee == foreignLegalAffairsAttorneyRegistrationFee &&
    specJudicialScrivenerRegistrationFee == judicialScrivenerRegistrationFee &&
    specSimplifyCourtLitigationAgencyCertificationFee == simplifyCourtLitigationAgencyCertificationFee &&
    specLandAndBuildingSurveyorRegistrationFee == landAndBuildingSurveyorRegistrationFee &&
    specAlternativeDisputeResolutionAgencyCertificationFee == alternativeDisputeResolutionAgencyCertificationFee &&
    specTaxAccountantRegistrationFee == taxAccountantRegistrationFee &&
    specRegisteredEngineerRegistrationFee == registeredEngineerRegistrationFee &&
    specAssistantEngineerRegistrationFee == assistantEngineerRegistrationFee &&
    specCertifiedPsychologistRegistrationFee == certifiedPsychologistRegistrationFee &&
    specPhysicianDentistRegistrationFee == physicianDentistRegistrationFee &&
    specPharmacistRegistrationFee == pharmacistRegistrationFee &&
    specHealthNurseEtcRegistrationFee == healthNurseEtcRegistrationFee &&
    specRegistrationModificationFee == registrationModificationFee

example : agreeRegistrationQualificationFees = true := by decide

end JapanTaxLaw
