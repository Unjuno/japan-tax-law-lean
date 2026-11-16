import JapanTaxLaw.TaxFinance

/-!
# RegistrationQualificationFeesP3C — 登録免許税法 別表第一（二）第三十二号 七十六〜八十二 の flat fee モデル (W-C)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  section 開始マーカー: "三十二　人の資格の登録若しくは認定又は技能証明"（\u3000 は全角空白）

Models 別表第一（二）第三十二号 の 七十六〜八十二 の flat fee 項目（pinned raw bytes 逐語、金額は日本語数字で検証して Arabic に変換）:

  七十六       登録研修機関（精神保健指定医）の登録 ... 一件につき九万円              → ¥90,000
  七十七（一） 第一種・第二種医薬品製造販売業、医薬部外品・化粧品製造販売業の許可 ... 一件につき十五万円 → ¥150,000
  七十七（二） 医薬品等の製造業の許可／製造所の区分追加の許可 ... 一件につき九万円       → ¥90,000
  七十七（三） 保管のみを行う製造所の登録 ... 一件につき九万円                       → ¥90,000
  七十七（四） 医薬品等外国製造業者の認定／区分追加の認定 ... 一件につき九万円           → ¥90,000
  七十七（五） 医薬品等外国製造業者の保管のみを行う製造所の登録 ... 一件につき九万円       → ¥90,000
  七十七（六） 第一種・第二種・第三種医療機器製造販売業、体外診断用医薬品製造販売業の許可 ... 一件につき十五万円 → ¥150,000
  七十七（七） 医療機器／体外診断用医薬品の製造の事業の登録 ... 一件につき九万円          → ¥90,000
  七十七（八） 医療機器等外国製造業者の登録 ... 一件につき九万円                       → ¥90,000
  七十七（九） 再生医療等製品の製造販売の事業の許可 ... 一件につき十五万円                → ¥150,000
  七十七（十） 再生医療等製品の製造業の許可／製造所の区分追加の許可 ... 一件につき九万円    → ¥90,000
  七十七（十一）再生医療等製品外国製造業者の認定／区分追加の認定 ... 一件につき九万円       → ¥90,000
  七十七（十二）医療機器の修理業の許可／修理区分の追加の許可 ... 一件につき九万円          → ¥90,000
  七十七（十三）第八十三条第一項の読み替え適用による許可・認定・登録 ... 一件につき九万円    → ¥90,000
  七十七（十四）登録認証機関の登録 ... 一件につき九万円                              → ¥90,000
  七十七の二（一）特定細胞加工物等の製造の許可 ... 一件につき九万円                    → ¥90,000
  七十七の二（二）外国における特定細胞加工物等の製造の認定 ... 一件につき九万円            → ¥90,000
  七十八       登録試験問題作成機関（介護支援専門員実務研修受講試験）の登録 ... 一件につき十五万円 → ¥150,000
  七十九       確定拠出年金運営管理業の登録 ... 一件につき九万円                       → ¥90,000
  八十         在宅就業支援団体の登録 ... 一件につき一万五千円                        → ¥15,000
  八十一（一） 有料の職業紹介事業の許可 ... 一件につき九万円                          → ¥90,000
  八十一（二） 労働者派遣事業の許可 ... 一件につき九万円                              → ¥90,000
  八十一（三） 港湾労働者派遣事業の許可 ... 一件につき九万円                          → ¥90,000
  八十一（四） 派遣事業対象業務の種類の変更の許可（港湾ごとの増加に限る） ... 一件につき一万五千円 → ¥15,000
  八十一（五） 建設業務有料職業紹介事業の許可 ... 一件につき九万円                     → ¥90,000
  八十一（六） 建設業務労働者就業機会確保事業の許可 ... 一件につき九万円                 → ¥90,000
  八十一の二   登録試験機関（キャリアコンサルタント）の登録 ... 一件につき十五万円           → ¥150,000
  八十二       登録講習機関（建築物環境衛生管理技術者免状）の登録 ... 一件につき九万円       → ¥90,000

八十一 の（注）「高年齢者等の雇用の安定等に関する法律第三十八条第二項（業務等）の規定による届出が
同条第三項の規定により職業安定法第三十条第一項（有料職業紹介事業の許可）の規定による許可とみなされる
場合における当該届出は、有料の職業紹介事業の許可とみなす。」はデーミング（みなし）規定で金額なし。
doc-comment に記載するが fee def は作らない。

Scope & honest boundaries:

* 一件につきの固定額であることを検証するのみ。登録・許可・認定の要件・適用・更新の有無、
  政令で定めるものの該当性、第八十三条第一項による読み替えの該当性、港湾ごとの増加の該当性は
  **caller-established** とし、ここではモデル化しない（Bool を金額式に入れない）。
* 七十六・七十七各号・七十七の二・八十・八十二の「更新の登録／許可／認定を除く。」、
  七十七各号の「政令で定めるものに限り」（(四)(五)(八) は政令表記なし）、
  七十七（一）（六）（九）・（十三）の「読み替えて適用する場合を含む。」、
  八十一（一）〜（三）（五）（六）の「更新の許可を除く。」、八十一（四）の「…に限る。」は
  いずれも適用判定ゲートであり、金額定数には反映しない（caller-established）。
* 八十一（注）のみなし規定は金額规定がないため fee def を作らない。
* 七十五 以前（W-A / W-B スライド）は未モデル化につき未検査（NOT YET COVERED）。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- 七十六 精神保健及び精神障害者福祉に関する法律第十八条第一項第四号／第十九条第一項（登録研修機関の登録）の登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。更新除外は caller-established。 -/
def mentalHealthTrainingInstRegFee : Money := 90_000

/-- 七十七（一） 医薬品医療機器等法第十二条第一項（製造販売業の許可）の第一種・第二種医薬品製造販売業許可、医薬部外品・化粧品製造販売業許可の件数につきの額（固定 ¥150,000）。政令該当性・更新除外・第八十三条第一項の読み替え該当性は caller-established。 -/
def pharmaMarketingLicenseFee : Money := 150_000

/-- 七十七（二） 医薬品医療機器等法第十三条第一項（製造業の許可）の医薬品等の製造業の許可又は同条第八項の製造所に係る許可の区分の追加の許可の件数につきの額（固定 ¥90,000）。政令該当性・更新除外は caller-established。 -/
def pharmaManufactureLicenseFee : Money := 90_000

/-- 七十七（三） 医薬品医療機器等法第十三条の二の二第一項（保管のみを行う製造所に係る登録）の登録の件数につきの額（固定 ¥90,000）。政令該当性・更新除外は caller-established。 -/
def pharmaStorageOnlyFacilityRegFee : Money := 90_000

/-- 七十七（四） 医薬品医療機器等法第十三条の三第一項（医薬品等外国製造業者の認定）の認定又は区分の追加の認定の件数につきの額（固定 ¥90,000）。更新除外・準用該当性は caller-established。 -/
def pharmaForeignManufacturerCertFee : Money := 90_000

/-- 七十七（五） 医薬品医療機器等法第十三条の三の二第一項（医薬品等外国製造業者の保管のみを行う製造所に係る登録）の登録の件数につきの額（固定 ¥90,000）。更新除外は caller-established。 -/
def pharmaForeignStorageOnlyRegFee : Money := 90_000

/-- 七十七（六） 医薬品医療機器等法第二十三条の二第一項（製造販売業の許可）の第一種・第二種・第三種医療機器製造販売業許可、体外診断用医薬品製造販売業許可の件数につきの額（固定 ¥150,000）。政令該当性・更新除外・読み替え該当性は caller-established。 -/
def medicalDeviceMarketingLicenseFee : Money := 150_000

/-- 七十七（七） 医薬品医療機器等法第二十三条の二の三第一項（製造業の登録）の医療機器又は体外診断用医薬品の製造の事業の登録の件数につきの額（固定 ¥90,000）。政令該当性・更新除外は caller-established。 -/
def medicalDeviceManufactureRegFee : Money := 90_000

/-- 七十七（八） 医薬品医療機器等法第二十三条の二の四第一項（医療機器等外国製造業者の登録）の登録の件数につきの額（固定 ¥90,000）。更新除外は caller-established。 -/
def medicalDeviceForeignManufacturerRegFee : Money := 90_000

/-- 七十七（九） 医薬品医療機器等法第二十三条の二十第一項（製造販売業の許可）の再生医療等製品の製造販売の事業の許可の件数につきの額（固定 ¥150,000）。政令該当性・更新除外・読み替え該当性は caller-established。 -/
def regenProductMarketingLicenseFee : Money := 150_000

/-- 七十七（十） 医薬品医療機器等法第二十三条の二十二第一項（製造業の許可）の再生医療等製品の製造業の許可又は同条第八項の製造所に係る許可の区分の追加の許可の件数につきの額（固定 ¥90,000）。政令該当性・更新除外は caller-established。 -/
def regenProductManufactureLicenseFee : Money := 90_000

/-- 七十七（十一） 医薬品医療機器等法第二十三条の二十四第一項（再生医療等製品外国製造業者の認定）の認定又は区分の追加の認定の件数につきの額（固定 ¥90,000）。更新除外・準用該当性は caller-established。 -/
def regenProductForeignManufacturerCertFee : Money := 90_000

/-- 七十七（十二） 医薬品医療機器等法第四十条の二第一項（医療機器の修理業の許可）の修理業の許可又は同条第七項の修理区分の追加の許可の件数につきの額（固定 ¥90,000）。政令該当性・更新除外は caller-established。 -/
def medicalDeviceRepairLicenseFee : Money := 90_000

/-- 七十七（十三） 医薬品医療機器等法第八十三条第一項の規定により読み替えて適用する同法第十三条第一項若しくは第八項等の規定による許可、認定又は登録の件数につきの額（固定 ¥90,000）。政令該当性・更新除外・読み替え該当性は caller-established。 -/
def pmdActDeemedLicenseFee : Money := 90_000

/-- 七十七（十四） 医薬品医療機器等法第二十三条の二の二十三第一項（登録認証機関の登録）の登録の件数につきの額（固定 ¥90,000）。更新除外は caller-established。 -/
def deviceCertificationBodyRegFee : Money := 90_000

/-- 七十七の二（一） 再生医療等の安全性の確保等に関する法律第三十五条第一項（特定細胞加工物等の製造の許可）の許可の件数につきの額（固定 ¥90,000）。更新除外は caller-established。 -/
def specificCellProcessProductMfgLicenseFee : Money := 90_000

/-- 七十七の二（二） 再生医療等の安全性の確保等に関する法律第三十九条第一項（外国における特定細胞加工物等の製造の認定）の認定の件数につきの額（固定 ¥90,000）。更新除外は caller-established。 -/
def foreignCellProcessProductCertFee : Money := 90_000

/-- 七十八 介護保険法第六十九条の十一第一項（登録試験問題作成機関の登録）の登録の件数につきの額（固定 ¥150,000）。 -/
def careManagerExamQuestionBodyRegFee : Money := 150_000

/-- 七十九 確定拠出年金法第八十八条第一項（登録）の確定拠出年金運営管理業の登録の件数につきの額（固定 ¥90,000）。 -/
def dcPensionMgmtBusinessRegFee : Money := 90_000

/-- 八十 障害者の雇用の促進等に関する法律第七十四条の三第一項（在宅就業支援団体の登録）の登録（更新の登録を除く。）の件数につきの額（固定 ¥15,000）。更新除外は caller-established。 -/
def homeWorkSupportOrgRegFee : Money := 15_000

/-- 八十一（一） 職業安定法第三十条第一項の有料の職業紹介事業の許可（更新の許可を除く。）の件数につきの額（固定 ¥90,000）。八十一（注）のみなし規定の該当性を含む更新除外は caller-established。 -/
def feeChargingJobPlacementPermitFee : Money := 90_000

/-- 八十一（二） 労働者派遣事業の適正な運営の確保及び派遣労働者の保護等に関する法律第五条第一項（労働者派遣事業の許可）の許可（更新の許可を除く。）の件数につきの額（固定 ¥90,000）。更新除外は caller-established。 -/
def workerDispatchingPermitFee : Money := 90_000

/-- 八十一（三） 港湾労働法第十二条第一項（港湾労働者派遣事業の許可）の許可（更新の許可を除く。）の件数につきの額（固定 ¥90,000）。更新除外は caller-established。 -/
def portWorkerDispatchPermitFee : Money := 90_000

/-- 八十一（四） 港湾労働法第十八条第一項（派遣事業対象業務の種類の変更等）の変更の許可（同法第十二条第二項第四号の港湾ごとの派遣事業対象業務の種類の増加に係るものに限る。）の件数につきの額（固定 ¥15,000）。港湾ごとの増加の該当性は caller-established。 -/
def portDispatchScopeChangePermitFee : Money := 15_000

/-- 八十一（五） 建設労働者の雇用の改善等に関する法律第十八条第一項（建設業務有料職業紹介事業の許可）の許可（更新の許可を除く。）の件数につきの額（固定 ¥90,000）。更新除外は caller-established。 -/
def constructionJobPlacementPermitFee : Money := 90_000

/-- 八十一（六） 建設労働者の雇用の改善等に関する法律第三十一条第一項（建設業務労働者就業機会確保事業の許可）の許可（更新の許可を除く。）の件数につきの額（固定 ¥90,000）。更新除外は caller-established。 -/
def constructionEmploymentOpportunityPermitFee : Money := 90_000

/-- 八十一の二 職業能力開発促進法第三十条の五第一項（登録試験機関の登録）の登録の件数につきの額（固定 ¥150,000）。 -/
def careerCounselorExamBodyRegFee : Money := 150_000

/-- 八十二 建築物における衛生的環境の確保に関する法律第七条第一項第一号（登録講習機関の登録）の登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。更新除外は caller-established。 -/
def buildingEnvMgmtCourseRegFee : Money := 90_000

theorem mentalHealthTrainingInstRegFee_pos : mentalHealthTrainingInstRegFee > 0 := by decide
theorem pharmaMarketingLicenseFee_pos : pharmaMarketingLicenseFee > 0 := by decide
theorem pharmaManufactureLicenseFee_pos : pharmaManufactureLicenseFee > 0 := by decide
theorem pharmaStorageOnlyFacilityRegFee_pos : pharmaStorageOnlyFacilityRegFee > 0 := by decide
theorem pharmaForeignManufacturerCertFee_pos : pharmaForeignManufacturerCertFee > 0 := by decide
theorem pharmaForeignStorageOnlyRegFee_pos : pharmaForeignStorageOnlyRegFee > 0 := by decide
theorem medicalDeviceMarketingLicenseFee_pos : medicalDeviceMarketingLicenseFee > 0 := by decide
theorem medicalDeviceManufactureRegFee_pos : medicalDeviceManufactureRegFee > 0 := by decide
theorem medicalDeviceForeignManufacturerRegFee_pos : medicalDeviceForeignManufacturerRegFee > 0 := by decide
theorem regenProductMarketingLicenseFee_pos : regenProductMarketingLicenseFee > 0 := by decide
theorem regenProductManufactureLicenseFee_pos : regenProductManufactureLicenseFee > 0 := by decide
theorem regenProductForeignManufacturerCertFee_pos : regenProductForeignManufacturerCertFee > 0 := by decide
theorem medicalDeviceRepairLicenseFee_pos : medicalDeviceRepairLicenseFee > 0 := by decide
theorem pmdActDeemedLicenseFee_pos : pmdActDeemedLicenseFee > 0 := by decide
theorem deviceCertificationBodyRegFee_pos : deviceCertificationBodyRegFee > 0 := by decide
theorem specificCellProcessProductMfgLicenseFee_pos : specificCellProcessProductMfgLicenseFee > 0 := by decide
theorem foreignCellProcessProductCertFee_pos : foreignCellProcessProductCertFee > 0 := by decide
theorem careManagerExamQuestionBodyRegFee_pos : careManagerExamQuestionBodyRegFee > 0 := by decide
theorem dcPensionMgmtBusinessRegFee_pos : dcPensionMgmtBusinessRegFee > 0 := by decide
theorem homeWorkSupportOrgRegFee_pos : homeWorkSupportOrgRegFee > 0 := by decide
theorem feeChargingJobPlacementPermitFee_pos : feeChargingJobPlacementPermitFee > 0 := by decide
theorem workerDispatchingPermitFee_pos : workerDispatchingPermitFee > 0 := by decide
theorem portWorkerDispatchPermitFee_pos : portWorkerDispatchPermitFee > 0 := by decide
theorem portDispatchScopeChangePermitFee_pos : portDispatchScopeChangePermitFee > 0 := by decide
theorem constructionJobPlacementPermitFee_pos : constructionJobPlacementPermitFee > 0 := by decide
theorem constructionEmploymentOpportunityPermitFee_pos : constructionEmploymentOpportunityPermitFee > 0 := by decide
theorem careerCounselorExamBodyRegFee_pos : careerCounselorExamBodyRegFee > 0 := by decide
theorem buildingEnvMgmtCourseRegFee_pos : buildingEnvMgmtCourseRegFee > 0 := by decide

example : mentalHealthTrainingInstRegFee = 90_000 := by decide
example : pharmaMarketingLicenseFee = 150_000 := by decide
example : pharmaManufactureLicenseFee = 90_000 := by decide
example : pharmaStorageOnlyFacilityRegFee = 90_000 := by decide
example : pharmaForeignManufacturerCertFee = 90_000 := by decide
example : pharmaForeignStorageOnlyRegFee = 90_000 := by decide
example : medicalDeviceMarketingLicenseFee = 150_000 := by decide
example : medicalDeviceManufactureRegFee = 90_000 := by decide
example : medicalDeviceForeignManufacturerRegFee = 90_000 := by decide
example : regenProductMarketingLicenseFee = 150_000 := by decide
example : regenProductManufactureLicenseFee = 90_000 := by decide
example : regenProductForeignManufacturerCertFee = 90_000 := by decide
example : medicalDeviceRepairLicenseFee = 90_000 := by decide
example : pmdActDeemedLicenseFee = 90_000 := by decide
example : deviceCertificationBodyRegFee = 90_000 := by decide
example : specificCellProcessProductMfgLicenseFee = 90_000 := by decide
example : foreignCellProcessProductCertFee = 90_000 := by decide
example : careManagerExamQuestionBodyRegFee = 150_000 := by decide
example : dcPensionMgmtBusinessRegFee = 90_000 := by decide
example : homeWorkSupportOrgRegFee = 15_000 := by decide
example : feeChargingJobPlacementPermitFee = 90_000 := by decide
example : workerDispatchingPermitFee = 90_000 := by decide
example : portWorkerDispatchPermitFee = 90_000 := by decide
example : portDispatchScopeChangePermitFee = 15_000 := by decide
example : constructionJobPlacementPermitFee = 90_000 := by decide
example : constructionEmploymentOpportunityPermitFee = 90_000 := by decide
example : careerCounselorExamBodyRegFee = 150_000 := by decide
example : buildingEnvMgmtCourseRegFee = 90_000 := by decide

end JapanTaxLaw
