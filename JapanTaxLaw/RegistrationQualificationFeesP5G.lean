import JapanTaxLaw.TaxFinance

/-!
# RegistrationQualificationFeesP5G — 登録免許税法 別表第一（二）第三十二号 百三〜百十 の flat fee モデル (W-G)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  担当範囲原文: art32_103_110.txt（百三〜百十、UTF-8）

Models 別表第一（二）第三十二号 の 百三〜百十 の flat fee 項目（pinned raw bytes 逐語、
金額は日本語数字で検証して Arabic に変換）:

    百三     熱供給事業の登録 ... 一件につき九万円                       → ¥90,000
    百四（一） 小売電気事業の登録 ... 一件につき九万円                     → ¥90,000
    百四（二） 指定旧供給区域の変更の許可 ... 一件につき九万円             → ¥90,000
    百四（三） 一般送配電事業の許可／供給区域の変更の許可 ... 一件につき十五万円 → ¥150,000
    百四（四） 供給区域外の供給の許可（第二十四条第一項） ... 一件につき一万五千円 → ¥15,000
    百四（五） 送電事業の許可／振替供給の相手方の変更の許可 ... 一件につき十五万円 → ¥150,000
    百四（六） 配電事業の許可／供給区域の変更の許可 ... 一件につき十五万円     → ¥150,000
    百四（七） 供給区域外の供給の許可（準用） ... 一件につき一万五千円       → ¥15,000
    百四（八） 特定送配電事業者による小売供給の登録 ... 一件につき一万五千円   → ¥15,000
    百四（九） 特定供給（電気を供給する事業の許可） ... 一件につき一万五千円   → ¥15,000
    百四（十） 認定高度保安実施設置者の認定 ... 一件につき九万円             → ¥90,000
    百四（十一）認定電気使用者情報利用者等協会の認定 ... 一件につき十五万円     → ¥150,000
    百四（十二）登録適合性確認機関の登録 ... 一件につき九万円                 → ¥90,000
    百四（十三）登録安全管理審査機関の登録 ... 一件につき九万円               → ¥90,000
    百四（十四）登録調査機関の登録 ... 一件につき九万円                       → ¥90,000
    百五     登録電気工事業者の登録 ... 一件につき九万円                     → ¥90,000
    百六     工場等に係る登録調査機関の登録 ... 一件につき九万円             → ¥90,000
    百七     工業用水道事業の許可／給水区域の変更の許可 ... 一件につき九万円   → ¥90,000
    百八     深海底鉱業の許可／深海底鉱区の変更の許可 ... 一件につき九万円     → ¥90,000
    百八の二 登録導管輸送工作物検査機関の登録 ... 一件につき九万円           → ¥90,000
    百九（一）アルコールの製造／輸入の事業の許可 ... 一件につき十五万円       → ¥150,000
    百九（二）アルコールの販売の事業の許可 ... 一件につき九万円               → ¥90,000
    百九（三）アルコールの使用の許可／変更の許可 ... 一件につき一万五千円     → ¥15,000
    百十     航空機等の製造事業若しくは修理事業の許可／事業の区分の変更の許可 ... 一件につき九万円 → ¥90,000

全 24 件が一件につきの固定額。割合（千分の△）はない。デーミング規定・金額なし行は
本範囲に存在しない。

Scope & honest boundaries:

* 一件につきの固定額であることを検証するのみ。登録・認定・認可・許可の要件・適用は
    caller-established とし、ここではモデル化しない。
* 「指定旧供給区域の増加に係るもの（当該指定旧供給区域の属する市町村内における増加を
    除く。）に限る。」「供給区域の増加に係るもの（…市町村内における増加を除く。）に限る。」
    「振替供給の相手方である一般送配電事業者又は配電事業者の増加に係るものに限る。」
    「更新の認定を除く。」「更新の登録を除く。」「深海底鉱区の面積の増加に係るものに限る。」
    「使用施設ごとのアルコールの用途の増加に係るものに限る。」
    「事業の区分の増加に係るものに限る。」等の適用判定は caller-established とし、
    金額定数には反映しない（Bool を式に入れない）。
* 百二 以前・百十一 以降は NOT YET COVERED。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- 百三 熱供給事業法（昭和四十七年法律第八十八号）第三条（事業の登録）の熱供給事業の登録の件数につきの額（固定 ¥90,000）。 -/
def heatSupplyRegFee : Money := 90_000

/-- 百四（一） 電気事業法（昭和三十九年法律第百七十号）第二条の二（事業の登録）の小売電気事業の登録の件数につきの額（固定 ¥90,000）。 -/
def retailElectricRegFee : Money := 90_000

/-- 百四（二） 電気事業法等の一部を改正する法律（平成二十六年法律第七十二号）附則第十七条第一項の指定旧供給区域の変更の許可（同法附則第十六条第一項に規定する指定旧供給区域の増加に係るもの（当該指定旧供給区域の属する市町村内における増加を除く。）に限る。）の件数につきの額（固定 ¥90,000）。適用判定は caller-established。 -/
def oldSupplyAreaChangePermitFee : Money := 90_000

/-- 百四（三） 電気事業法第三条（事業の許可）の一般送配電事業の許可又は同法第八条第一項（供給区域の変更）の変更の許可（同法第六条第二項第五号（許可証）に掲げる供給区域の増加に係るもの（当該市町村内における増加を除く。）に限る。）の件数につきの額（固定 ¥150,000）。適用判定は caller-established。 -/
def generalTransmissionPermitFee : Money := 150_000

/-- 百四（四） 電気事業法第二十四条第一項（供給区域外に設置する電線路による供給）の供給区域外の供給の許可の件数につきの額（固定 ¥15,000）。 -/
def outsideAreaSupplyPermitFee : Money := 15_000

/-- 百四（五） 電気事業法第二十七条の四（事業の許可）の送電事業の許可又は同法第二十七条の七の三第一項（振替供給の相手方の変更）の変更の許可（同法第二十七条の七第二項第五号（許可証）に掲げる振替供給の相手方である一般送配電事業者又は配電事業者の増加に係るものに限る。）の件数につきの額（固定 ¥150,000）。適用判定は caller-established。 -/
def transmissionBizPermitFee : Money := 150_000

/-- 百四（六） 電気事業法第二十七条の十二の二（事業の許可）の配電事業の許可又は同法第二十七条の十二の七第一項（供給区域の変更）の変更の許可（同法第二十七条の十二の五第二項第五号（許可証）に掲げる供給区域の増加に係るもの（当該市町村内における増加を除く。）に限る。）の件数につきの額（固定 ¥150,000）。適用判定は caller-established。 -/
def distributionBizPermitFee : Money := 150_000

/-- 百四（七） 電気事業法第二十七条の十二の十三（準用）において準用する同法第二十四条第一項の供給区域外の供給の許可の件数につきの額（固定 ¥15,000）。 -/
def specificTransmissionOutsideSupplyPermitFee : Money := 15_000

/-- 百四（八） 電気事業法第二十七条の十五（小売供給の登録）の特定送配電事業者による小売供給の登録の件数につきの額（固定 ¥15,000）。 -/
def specificTransmissionRetailRegFee : Money := 15_000

/-- 百四（九） 電気事業法第二十七条の三十三第一項（特定供給）の電気を供給する事業の許可の件数につきの額（固定 ¥15,000）。 -/
def specificSupplyPermitFee : Money := 15_000

/-- 百四（十） 電気事業法第五十五条の三（認定）の認定高度保安実施設置者の認定（更新の認定を除く。）の件数につきの額（固定 ¥90,000）。更新該当性は caller-established。 -/
def highSecurityFacilityCertFee : Money := 90_000

/-- 百四（十一） 電気事業法第三十七条の四（認定電気使用者情報利用者等協会の認定）の認定電気使用者情報利用者等協会の認定の件数につきの額（固定 ¥150,000）。 -/
def certElectricUserInfoAssocFee : Money := 150_000

/-- 百四（十二） 電気事業法第四十八条の二第一項（登録適合性確認機関の登録）の登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。更新該当性は caller-established。 -/
def registrationConformityOrgFee : Money := 90_000

/-- 百四（十三） 電気事業法第五十一条第三項（登録安全管理審査機関の登録）又は第五十五条第四項（登録安全管理審査機関の登録）の登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。更新該当性は caller-established。 -/
def registeredSafetyAuditOrgFee : Money := 90_000

/-- 百四（十四） 電気事業法第五十七条の二第一項（登録調査機関の登録）の登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。更新該当性は caller-established。 -/
def registeredInvestigationOrgFee : Money := 90_000

/-- 百五 電気工事業の業務の適正化に関する法律（昭和四十五年法律第九十六号）第三条第一項（登録）の経済産業大臣がする登録電気工事業者の登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。更新該当性は caller-established。 -/
def electricWorkContractorRegFee : Money := 90_000

/-- 百六 エネルギーの使用の合理化及び非化石エネルギーへの転換等に関する法律（昭和五十四年法律第四十九号）第八十四条第一項（登録調査機関の登録）の登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。更新該当性は caller-established。 -/
def factoryInvestigationOrgRegFee : Money := 90_000

/-- 百七 工業用水道事業法（昭和三十三年法律第八十四号）第三条第二項の工業用水道事業の許可又は同法第六条第二項の規定による給水区域の変更の許可（同法第四条第一項第二号の給水区域の増加に係るもの（当該市町村内における増加を除く。）に限る。）の件数につきの額（固定 ¥90,000）。適用判定は caller-established。 -/
def industrialWaterPermitFee : Money := 90_000

/-- 百八 深海底鉱業暫定措置法（昭和五十七年法律第六十四号）第四条第一項の深海底鉱業の許可又は同法第十四条第一項の規定による深海底鉱区の変更の許可（同法第十三条第二項第六号（許可証）の深海底鉱区の面積の増加に係るものに限る。）の件数につきの額（固定 ¥90,000）。適用判定は caller-established。 -/
def deepSeabedMiningPermitFee : Money := 90_000

/-- 百八の二 二酸化炭素の貯留事業に関する法律第九十一条第一項（登録導管輸送工作物検査機関の登録）の登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。更新該当性は caller-established。 -/
def co2PipelineInspectOrgRegFee : Money := 90_000

/-- 百九（一） アルコール事業法（平成十二年法律第三十六号）第三条第一項（製造の許可）のアルコールの製造の事業の許可又は同法第十六条第一項（輸入の許可）のアルコールの輸入の事業の許可の件数につきの額（固定 ¥150,000）。 -/
def alcoholMfgImportPermitFee : Money := 150_000

/-- 百九（二） アルコール事業法第二十一条第一項（販売の許可）のアルコールの販売の事業の許可の件数につきの額（固定 ¥90,000）。 -/
def alcoholSalesPermitFee : Money := 90_000

/-- 百九（三） アルコール事業法第二十六条第一項（使用の許可）のアルコールの使用の許可又は同法第三十条（準用）において準用する同法第八条第一項（変更の許可等）の変更の許可（同法第二十六条第二項第六号の使用施設ごとのアルコールの用途の増加に係るものに限る。）の件数につきの額（固定 ¥15,000）。適用判定は caller-established。 -/
def alcoholUsePermitFee : Money := 15_000

/-- 百十 航空機製造事業法（昭和二十七年法律第二百三十七号）第二条の二（事業の許可）の航空機若しくは特定機器の製造若しくは修理の事業の許可又は同法第二条の八第一項（事業の区分の変更）の規定による変更の許可（同法第二条の六第二項第三号（許可証）の事業の区分の増加に係るものに限る。）の件数につきの額（固定 ¥90,000）。適用判定は caller-established。 -/
def aircraftMfgRepairPermitFee : Money := 90_000

theorem heatSupplyRegFee_pos : heatSupplyRegFee > 0 := by decide
theorem retailElectricRegFee_pos : retailElectricRegFee > 0 := by decide
theorem oldSupplyAreaChangePermitFee_pos : oldSupplyAreaChangePermitFee > 0 := by decide
theorem generalTransmissionPermitFee_pos : generalTransmissionPermitFee > 0 := by decide
theorem outsideAreaSupplyPermitFee_pos : outsideAreaSupplyPermitFee > 0 := by decide
theorem transmissionBizPermitFee_pos : transmissionBizPermitFee > 0 := by decide
theorem distributionBizPermitFee_pos : distributionBizPermitFee > 0 := by decide
theorem specificTransmissionOutsideSupplyPermitFee_pos : specificTransmissionOutsideSupplyPermitFee > 0 := by decide
theorem specificTransmissionRetailRegFee_pos : specificTransmissionRetailRegFee > 0 := by decide
theorem specificSupplyPermitFee_pos : specificSupplyPermitFee > 0 := by decide
theorem highSecurityFacilityCertFee_pos : highSecurityFacilityCertFee > 0 := by decide
theorem certElectricUserInfoAssocFee_pos : certElectricUserInfoAssocFee > 0 := by decide
theorem registrationConformityOrgFee_pos : registrationConformityOrgFee > 0 := by decide
theorem registeredSafetyAuditOrgFee_pos : registeredSafetyAuditOrgFee > 0 := by decide
theorem registeredInvestigationOrgFee_pos : registeredInvestigationOrgFee > 0 := by decide
theorem electricWorkContractorRegFee_pos : electricWorkContractorRegFee > 0 := by decide
theorem factoryInvestigationOrgRegFee_pos : factoryInvestigationOrgRegFee > 0 := by decide
theorem industrialWaterPermitFee_pos : industrialWaterPermitFee > 0 := by decide
theorem deepSeabedMiningPermitFee_pos : deepSeabedMiningPermitFee > 0 := by decide
theorem co2PipelineInspectOrgRegFee_pos : co2PipelineInspectOrgRegFee > 0 := by decide
theorem alcoholMfgImportPermitFee_pos : alcoholMfgImportPermitFee > 0 := by decide
theorem alcoholSalesPermitFee_pos : alcoholSalesPermitFee > 0 := by decide
theorem alcoholUsePermitFee_pos : alcoholUsePermitFee > 0 := by decide
theorem aircraftMfgRepairPermitFee_pos : aircraftMfgRepairPermitFee > 0 := by decide

example : heatSupplyRegFee = 90_000 := by decide
example : retailElectricRegFee = 90_000 := by decide
example : oldSupplyAreaChangePermitFee = 90_000 := by decide
example : generalTransmissionPermitFee = 150_000 := by decide
example : outsideAreaSupplyPermitFee = 15_000 := by decide
example : transmissionBizPermitFee = 150_000 := by decide
example : distributionBizPermitFee = 150_000 := by decide
example : specificTransmissionOutsideSupplyPermitFee = 15_000 := by decide
example : specificTransmissionRetailRegFee = 15_000 := by decide
example : specificSupplyPermitFee = 15_000 := by decide
example : highSecurityFacilityCertFee = 90_000 := by decide
example : certElectricUserInfoAssocFee = 150_000 := by decide
example : registrationConformityOrgFee = 90_000 := by decide
example : registeredSafetyAuditOrgFee = 90_000 := by decide
example : registeredInvestigationOrgFee = 90_000 := by decide
example : electricWorkContractorRegFee = 90_000 := by decide
example : factoryInvestigationOrgRegFee = 90_000 := by decide
example : industrialWaterPermitFee = 90_000 := by decide
example : deepSeabedMiningPermitFee = 90_000 := by decide
example : co2PipelineInspectOrgRegFee = 90_000 := by decide
example : alcoholMfgImportPermitFee = 150_000 := by decide
example : alcoholSalesPermitFee = 90_000 := by decide
example : alcoholUsePermitFee = 15_000 := by decide
example : aircraftMfgRepairPermitFee = 90_000 := by decide

end JapanTaxLaw
