import JapanTaxLaw.RegistrationQualificationFees

/-!
# RegistrationQualificationFees tests — 別表第一（二）第三十二号 (一)〜(九) smoke checks

Decidable smoke tests for the flat qualification registration fees, pinned to
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- （一）イ／ロ 公認会計士・外国公認会計士
example : certifiedPublicAccountantRegistrationFee = 60_000 := by decide
example : foreignCertifiedPublicAccountantRegistrationFee = 60_000 := by decide
-- （二）行政書士 ／ （二の二）政治資金監査人
example : administrativeScrivenerRegistrationFee = 30_000 := by decide
example : politicalFundsComplianceAuditorRegistrationFee = 15_000 := by decide
-- （三）弁護士 ／ （四）外国法事務弁護士
example : attorneyRegistrationFee = 60_000 := by decide
example : foreignLegalAffairsAttorneyRegistrationFee = 60_000 := by decide
-- （五）司法書士 ／ 簡裁訴訟代理等関係業務の認定
example : judicialScrivenerRegistrationFee = 30_000 := by decide
example : simplifyCourtLitigationAgencyCertificationFee = 5_000 := by decide
-- （六）土地家屋調査士 ／ 民間紛争解決手続代理関係業務の認定
example : landAndBuildingSurveyorRegistrationFee = 30_000 := by decide
example : alternativeDisputeResolutionAgencyCertificationFee = 5_000 := by decide
-- （七）税理士
example : taxAccountantRegistrationFee = 60_000 := by decide
-- （八）技術士 ／ 技術士補
example : registeredEngineerRegistrationFee = 30_000 := by decide
example : assistantEngineerRegistrationFee = 15_000 := by decide
-- （八の二）公認心理師
example : certifiedPsychologistRegistrationFee = 15_000 := by decide
-- （九）医師又は歯科医師／薬剤師／保健師、助産師、看護師等／登録事項の変更
example : physicianDentistRegistrationFee = 60_000 := by decide
example : pharmacistRegistrationFee = 30_000 := by decide
example : healthNurseEtcRegistrationFee = 9_000 := by decide
example : registrationModificationFee = 1_000 := by decide

end JapanTaxLaw
