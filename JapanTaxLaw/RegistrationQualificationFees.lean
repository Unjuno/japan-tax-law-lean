import JapanTaxLaw.TaxFinance

/-!
# RegistrationQualificationFees — 登録免許税法 別表第一（二）第三十二号（人の資格の登録若しくは認定又は技能証明）L4 モデル (一)〜(九) 帯域

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: (same as RegistrationTax.lean / RegistrationCommercialTaxTable.lean pins)
  (data/raw/342AC0000000035_20261101_508AC0000000021.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Models 別表第一（二）第三十二号 (一)〜(九) の flat fee 項目 — pinned raw bytes 逐語:

  （一）イ公認会計士の登録登録件数一件につき六万円
        ロ外国公認会計士の登録登録件数一件につき六万円
  （二）行政書士の登録登録件数一件につき三万円
  （二の二）政治資金監査人の登録登録件数一件につき一万五千円
  （三）弁護士の登録登録件数一件につき六万円
  （四）外国法事務弁護士の登録登録件数一件につき六万円
  （五）イ司法書士の登録登録件数一件につき三万円
        ロ簡裁訴訟代理等関係業務の認定）の認定認定件数一件につき五千円
  （六）イ土地家屋調査士の登録登録件数一件につき三万円
        ロ民間紛争解決手続代理関係業務の認定）の認定認定件数一件につき五千円
  （七）税理士の登録登録件数一件につき六万円
  （八）イ技術士の登録登録件数一件につき三万円
        ロ技術士補の登録登録件数一件につき一万五千円
  （八の二）公認心理師の登録登録件数一件につき一万五千円
  （九）イ（１）医師又は歯科医師の登録登録件数一件につき六万円
        （２）薬剤師の登録登録件数一件につき三万円
        （３）保健師、助産師、看護師、理学療法士、作業療法士、診療放射線技師、
              臨床検査技師、視能訓練士、臨床工学技士又は義肢装具士の登録登録件数一件につき九千円
        ロイ（１）から（３）までに掲げる者に係る登録事項の変更の登録登録件数一件につき千円

Scope & honest boundaries:

* 一件につきの固定額であることを検証するのみ。登録（の要件・適用・聴取）は
  政令により個別審議の対象であり、ここではモデル化しない。
* （十）以降（歯科衛生士・歯科技工士・救急救命士・言語聴覚士・あん摩マツサージ指圧師はり師きゆう師等・
  柔道整復師・管理栄養士・理容師・美容師・社会福祉士等・精神保健福祉士・獣医師・愛玩動物看護師・
  百六十 以降の資格登録項目等）は未モデル化につき未検査（NOT YET COVERED）。
* 「認定件数」と「登録件数」の意味上の区別は非モデル化（一律 Money で扱う）。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- （一）イ 公認会計士の登録の件数につきの額（固定 ¥60,000）。 -/
def certifiedPublicAccountantRegistrationFee : Money := 60_000

/-- （一）ロ 外国公認会計士の登録の件数につきの額（固定 ¥60,000）。 -/
def foreignCertifiedPublicAccountantRegistrationFee : Money := 60_000

/-- （二） 行政書士の登録の件数につきの額（固定 ¥30,000）。 -/
def administrativeScrivenerRegistrationFee : Money := 30_000

/-- （二の二） 政治資金監査人の登録の件数につきの額（固定 ¥15,000）。 -/
def politicalFundsComplianceAuditorRegistrationFee : Money := 15_000

/-- （三） 弁護士の登録の件数につきの額（固定 ¥60,000）。 -/
def attorneyRegistrationFee : Money := 60_000

/-- （四） 外国法事務弁護士の登録の件数につきの額（固定 ¥60,000）。 -/
def foreignLegalAffairsAttorneyRegistrationFee : Money := 60_000

/-- （五）イ 司法書士の登録の件数につきの額（固定 ¥30,000）。 -/
def judicialScrivenerRegistrationFee : Money := 30_000

/-- （五）ロ 簡裁訴訟代理等関係業務の認定の件数につきの額（固定 ¥5,000）。 -/
def simplifyCourtLitigationAgencyCertificationFee : Money := 5_000

/-- （六）イ 土地家屋調査士の登録の件数につきの額（固定 ¥30,000）。 -/
def landAndBuildingSurveyorRegistrationFee : Money := 30_000

/-- （六）ロ 民間紛争解決手続代理関係業務の認定の件数につきの額（固定 ¥5,000）。 -/
def alternativeDisputeResolutionAgencyCertificationFee : Money := 5_000

/-- （七） 税理士の登録の件数につきの額（固定 ¥60,000）。 -/
def taxAccountantRegistrationFee : Money := 60_000

/-- （八）イ 技術士の登録の件数につきの額（固定 ¥30,000）。 -/
def registeredEngineerRegistrationFee : Money := 30_000

/-- （八）ロ 技術士補の登録の件数につきの額（固定 ¥15,000）。 -/
def assistantEngineerRegistrationFee : Money := 15_000

/-- （八の二） 公認心理師の登録の件数につきの額（固定 ¥15,000）。 -/
def certifiedPsychologistRegistrationFee : Money := 15_000

/-- （九）イ（１） 医師又は歯科医師の登録の件数につきの額（固定 ¥60,000）。 -/
def physicianDentistRegistrationFee : Money := 60_000

/-- （九）イ（２） 薬剤師の登録の件数につきの額（固定 ¥30,000）。 -/
def pharmacistRegistrationFee : Money := 30_000

/-- （九）イ（３） 保健師、助産師、看護師、理学療法士、作業療法士、診療放射線技師、
    臨床検査技師、視能訓練士、臨床工学技士又は義肢装具士の登録の件数につきの額（固定 ¥9,000）。 -/
def healthNurseEtcRegistrationFee : Money := 9_000

/-- （九）ロ イ（１）から（３）までに掲げる者に係る登録事項の変更の登録の件数につきの額（固定 ¥1,000）。 -/
def registrationModificationFee : Money := 1_000

theorem certifiedPublicAccountantRegistrationFee_pos : certifiedPublicAccountantRegistrationFee > 0 := by decide
theorem foreignCertifiedPublicAccountantRegistrationFee_pos :
    foreignCertifiedPublicAccountantRegistrationFee > 0 := by decide
theorem administrativeScrivenerRegistrationFee_pos : administrativeScrivenerRegistrationFee > 0 := by decide
theorem politicalFundsComplianceAuditorRegistrationFee_pos :
    politicalFundsComplianceAuditorRegistrationFee > 0 := by decide
theorem attorneyRegistrationFee_pos : attorneyRegistrationFee > 0 := by decide
theorem foreignLegalAffairsAttorneyRegistrationFee_pos :
    foreignLegalAffairsAttorneyRegistrationFee > 0 := by decide
theorem judicialScrivenerRegistrationFee_pos : judicialScrivenerRegistrationFee > 0 := by decide
theorem simplifyCourtLitigationAgencyCertificationFee_pos :
    simplifyCourtLitigationAgencyCertificationFee > 0 := by decide
theorem landAndBuildingSurveyorRegistrationFee_pos : landAndBuildingSurveyorRegistrationFee > 0 := by decide
theorem alternativeDisputeResolutionAgencyCertificationFee_pos :
    alternativeDisputeResolutionAgencyCertificationFee > 0 := by decide
theorem taxAccountantRegistrationFee_pos : taxAccountantRegistrationFee > 0 := by decide
theorem registeredEngineerRegistrationFee_pos : registeredEngineerRegistrationFee > 0 := by decide
theorem assistantEngineerRegistrationFee_pos : assistantEngineerRegistrationFee > 0 := by decide
theorem certifiedPsychologistRegistrationFee_pos : certifiedPsychologistRegistrationFee > 0 := by decide
theorem physicianDentistRegistrationFee_pos : physicianDentistRegistrationFee > 0 := by decide
theorem pharmacistRegistrationFee_pos : pharmacistRegistrationFee > 0 := by decide
theorem healthNurseEtcRegistrationFee_pos : healthNurseEtcRegistrationFee > 0 := by decide
theorem registrationModificationFee_pos : registrationModificationFee > 0 := by decide

-- ==== kernel-decided smoke checks ====

example : certifiedPublicAccountantRegistrationFee = 60_000 := by decide
example : foreignCertifiedPublicAccountantRegistrationFee = 60_000 := by decide
example : administrativeScrivenerRegistrationFee = 30_000 := by decide
example : politicalFundsComplianceAuditorRegistrationFee = 15_000 := by decide
example : attorneyRegistrationFee = 60_000 := by decide
example : foreignLegalAffairsAttorneyRegistrationFee = 60_000 := by decide
example : judicialScrivenerRegistrationFee = 30_000 := by decide
example : simplifyCourtLitigationAgencyCertificationFee = 5_000 := by decide
example : landAndBuildingSurveyorRegistrationFee = 30_000 := by decide
example : alternativeDisputeResolutionAgencyCertificationFee = 5_000 := by decide
example : taxAccountantRegistrationFee = 60_000 := by decide
example : registeredEngineerRegistrationFee = 30_000 := by decide
example : assistantEngineerRegistrationFee = 15_000 := by decide
example : certifiedPsychologistRegistrationFee = 15_000 := by decide
example : physicianDentistRegistrationFee = 60_000 := by decide
example : pharmacistRegistrationFee = 30_000 := by decide
example : healthNurseEtcRegistrationFee = 9_000 := by decide
example : registrationModificationFee = 1_000 := by decide

end JapanTaxLaw
