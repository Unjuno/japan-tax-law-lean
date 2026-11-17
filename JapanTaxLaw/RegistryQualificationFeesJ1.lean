import JapanTaxLaw.TaxFinance

/-!
# RegistryQualificationFeesJ1 — 登録免許税法 別表第一（二）三十三〜三十八 の flat fee モデル (W-AB)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  担当範囲原文: reg_qual_A.txt（三十三〜三十八、UTF-8、4564 文字）。

Models 別表第一（二）第三十三号〜第三十八号 の flat fee 項目。原文の「〜につき△△円」を
読み、各 1 行を 1 つの `Money` 固定額定数としてモデル化する（pinned raw bytes 逐語、
金額は日本語数字で検証して Arabic に変換）。本範囲に割合（千分の X / 百分の X）は存在しない。

  金額内訳（全 55 行）:
    十五万円 (150,000) 36 件 / 九万円 (90,000) 17 件 / 一万五千円 (15,000) 2 件。

  内訳の内訳:
    三十三 1 / 三十四 1 / 三十四の二 1 / 三十四の三 4 / 三十五 16 /
    三十六 5 / 三十六の二 6 / 三十六の三 8 / 三十七 7 / 三十八 6 = 55 行。

Scope & honest boundaries:

* 一件（または一箇所）につきの固定額であることを検証するのみ。登録・免許・許可・認可・
  認定の要件・適用・手続は **caller-established** とし、ここではモデル化しない。
* 「政令で定めるものに限る。」「更新の登録（免許／許可／認定）を除く。」「臨時の営業所の
  設置に係る認可その他の政令で定める認可を除く。」「国の行政機関による認可として政令で
  定めるものに限る。」「…財務省令で定めるものを除く。」「…者に係るものに限る。」等の
  適用判定はすべて caller-established とし、金額定数には反映しない（**Bool を式に入れない**）。
  軽減額の別 def も作らない。
* 三十七 の「（注）…みなす。」はデーミング規定で金額がない。doc-comment に記載するが
  fee def は作っていない。金額なしの fee 行は他に存在しない。
* 三十五（四）イ・ロ、（五）イ・ロ、（八）は「〜数一箇所につき」である。定数は 1 箇所
  あたりの額を表し、箇所数は caller-established（Nat 掛け算は行わない）として
  `...PerPlace` Suffix を付ける。
* 既存 `RegistrationQualificationFees.lean` は本範囲の一部を既にモデル化しているが、
  本モジュールは独立の名前空間 `JapanTaxLaw.RegistryQualificationFeesJ1` で再モデル化した
  ものであり、既存モジュールを変更していない。**完成・網羅を主張しない**。
  三十二 以前・三十九 以降は NOT YET COVERED。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw.RegistryQualificationFeesJ1

open JapanTaxLaw.TaxFinance

-- === 三十三 認定個人情報保護団体の認定 ===

/-- 三十三 個人情報の保護に関する法律（平成十五年法律第五十七号）第四十七条第一項（認定）の
    認定個人情報保護団体の認定（政令で定めるものに限る。）認定件数一件につき九万円
    （固定 ¥90,000）。「政令で定めるものに限る。」の該当性は caller-established。 -/
def certifiedPersonalInfoProtectionOrgCertFee : Money := 90_000

-- === 三十四 警備員等に係る登録講習機関の登録 ===

/-- 三十四 警備業法（昭和四十七年法律第百十七号）第二十三条第三項（登録講習機関の登録）の登録
    （更新の登録を除く。）登録件数一件につき九万円（固定 ¥90,000）。
    「更新の登録を除く。」の該当性は caller-established。 -/
def securityGuardTrainingOrgRegFee : Money := 90_000

-- === 三十四の二 登録誘引情報提供機関の登録 ===

/-- 三十四の二 インターネット異性紹介事業を利用して児童を誘引する行為の規制等に関する法律
    （平成十五年法律第八十三号）第十八条第一項（登録誘引情報提供機関の登録）の
    登録誘引情報提供機関の登録登録件数一件につき一万五千円（固定 ¥15,000）。 -/
def datingInducementInfoProviderRegFee : Money := 15_000

-- === 三十四の三 カジノ事業等の免許・許可・認定 ===

/-- 三十四の三（一） 特定複合観光施設区域整備法（平成三十年法律第八十号）第三十九条（免許等）の
    カジノ事業の免許（更新の免許を除く。）免許件数一件につき十五万円（固定 ¥150,000）。
    「更新の免許を除く。」は caller-established。 -/
def casinoBusinessLicenseFee : Money := 150_000

/-- 三十四の三（二） 特定複合観光施設区域整備法第百二十四条（免許）のカジノ施設供用事業の免許
    （更新の免許を除く。）免許件数一件につき十五万円（固定 ¥150,000）。
    「更新の免許を除く。」は caller-established。 -/
def casinoFacilityOperationBusinessLicenseFee : Money := 150_000

/-- 三十四の三（三） 特定複合観光施設区域整備法第百四十三条第一項（許可）のカジノ関連機器等
    製造業、カジノ関連機器等輸入業、カジノ関連機器等販売業又はカジノ関連機器等修理業の許可
    （更新の許可を除く。）許可件数一件につき十五万円（固定 ¥150,000）。
    「更新の許可を除く。」は caller-established。 -/
def casinoRelatedEquipmentBusinessPermitFee : Money := 150_000

/-- 三十四の三（四） 特定複合観光施設区域整備法第百五十条第一項（カジノ関連機器等外国製造業の
    認定）のカジノ関連機器等外国製造業の認定（更新の認定を除く。）認定件数一件につき十五万円
    （固定 ¥150,000）。「更新の認定を除く。」は caller-established。 -/
def casinoRelatedEquipmentForeignManufacturerCertFee : Money := 150_000

-- === 三十五 銀行等の営業若しくは事業の免許等 ===

/-- 三十五（一） 銀行（長期信用銀行を含む。（四）において同じ。）及び銀行法（昭和五十六年法律
    第五十九号）第十条第二項第八号（業務の範囲）に規定する外国銀行の営業の免許
    免許件数一件につき十五万円（固定 ¥150,000）。 -/
def foreignBankBusinessLicenseFee : Money := 150_000

/-- 三十五（二） 銀行法第五十二条の二第一項又は第二項（外国銀行代理業務に係る認可等）の
    外国銀行代理業務の認可認可件数一件につき十五万円（固定 ¥150,000）。 -/
def bankForeignBankAgencyBusinessApprovalFee : Money := 150_000

/-- 三十五（三） 長期信用銀行法（昭和二十七年法律第百八十七号）第六条の三第一項又は第二項
    （外国銀行代理業務に係る認可等）の外国銀行代理業務の認可
    認可件数一件につき十五万円（固定 ¥150,000）。 -/
def longTermCreditBankForeignBankAgencyApprovalFee : Money := 150_000

/-- 三十五（四）イ 銀行の外国における支店の設置の認可支店の数一箇所につき十五万円
    （1 箇所あたり固定 ¥150,000）。支店数は caller-established（Nat 掛け算は行わない）。 -/
def bankForeignBranchEstablishmentApprovalFeePerPlace : Money := 150_000

/-- 三十五（四）ロ 銀行の外国における支店以外の営業所の設置又は外国における支店以外の営業所の
    支店への変更の認可（臨時の営業所の設置に係る認可その他の政令で定める認可を除く。）
    営業所の数一箇所につき九万円（1 箇所あたり固定 ¥90,000）。
    「政令で定める認可を除く。」の該当性は caller-established。営業所数も caller-established。 -/
def bankForeignOfficeEstablishmentApprovalFeePerPlace : Money := 90_000

/-- 三十五（四）ハ 銀行の外国における業務の委託契約の締結に係る認可
    認可件数一件につき九万円（固定 ¥90,000）。 -/
def bankForeignBusinessOutsourcingContractApprovalFee : Money := 90_000

/-- 三十五（五）イ 銀行法第四十七条の三（従たる外国銀行支店の設置等）の規定による
    銀行法第十条第二項第八号に規定する外国銀行の支店の設置の認可
    支店の数一箇所につき十五万円（1 箇所あたり固定 ¥150,000）。
    支店数は caller-established（Nat 掛け算は行わない）。 -/
def subsidiaryForeignBankBranchEstablishmentApprovalFeePerPlace : Money := 150_000

/-- 三十五（五）ロ 銀行法第十条第二項第八号に規定する外国銀行の支店以外の営業所の設置又は
    支店以外の営業所の支店への変更の認可（臨時の営業所の設置に係る認可その他の政令で定める
    認可を除く。）営業所の数一箇所につき九万円（1 箇所あたり固定 ¥90,000）。
    「政令で定める認可を除く。」の該当性は caller-established。営業所数も caller-established。 -/
def subsidiaryForeignBankOfficeEstablishmentApprovalFeePerPlace : Money := 90_000

/-- 三十五（六） 信用金庫の事業の免許免許件数一件につき十五万円（固定 ¥150,000）。 -/
def creditCooperativeBusinessLicenseFee : Money := 150_000

/-- 三十五（七） 信用金庫法（昭和二十六年法律第二百三十八号）第五十四条の二第一項
    （外国銀行代理業務に係る認可等）の外国銀行代理業務の認可
    認可件数一件につき十五万円（固定 ¥150,000）。 -/
def creditCooperativeForeignBankAgencyApprovalFee : Money := 150_000

/-- 三十五（八） 信用金庫の従たる事務所の設置に係る定款変更の認可
    事務所の数一箇所につき九万円（1 箇所あたり固定 ¥90,000）。
    事務所数は caller-established（Nat 掛け算は行わない）。 -/
def creditCooperativeSubOfficeEstablishmentApprovalFeePerPlace : Money := 90_000

/-- 三十五（九） 金融機関の合併及び転換に関する法律（昭和四十三年法律第八十六号）第五条第一項
    （認可）の規定による転換（当該転換後の法人が労働金庫又は信用協同組合であるものを除く。）の
    認可転換の件数一件につき十五万円（固定 ¥150,000）。
    「労働金庫又は信用協同組合であるものを除く。」は caller-established。 -/
def financialInstitutionConversionApprovalFee : Money := 150_000

/-- 三十五（十） 金融商品取引法（昭和二十三年法律第二十五号）第三十三条の二
    （金融機関の登録）の登録登録件数一件につき十五万円（固定 ¥150,000）。 -/
def financialInstitutionRegistrationFee : Money := 150_000

/-- 三十五（十一） 金融機関の信託業務の兼営等に関する法律（昭和十八年法律第四十三号）
    第一条第一項（兼営の認可）の規定による営業の認可認可件数一件につき十五万円
    （固定 ¥150,000）。 -/
def trustBusinessConcurrentOperationApprovalFee : Money := 150_000

/-- 三十五（十二） 銀行法第五十二条の十七第一項又は第三項ただし書（銀行持株会社に係る認可等）の
    認可認可件数一件につき十五万円（固定 ¥150,000）。 -/
def bankHoldingCompanyApprovalFee : Money := 150_000

/-- 三十五（十三） 長期信用銀行法第十六条の二の四第一項又は第三項ただし書
    （長期信用銀行持株会社に係る認可等）の認可認可件数一件につき十五万円（固定 ¥150,000）。 -/
def longTermCreditBankHoldingCompanyApprovalFee : Money := 150_000

-- === 三十六 金融機関の代理業の許可 ===

/-- 三十六（一） 銀行法第五十二条の三十六第一項（許可）の銀行代理業の許可
    許可件数一件につき九万円（固定 ¥90,000）。 -/
def bankAgencyBusinessPermitFee : Money := 90_000

/-- 三十六（二） 長期信用銀行法第十六条の五第一項（長期信用銀行代理業の許可）の
    長期信用銀行代理業の許可許可件数一件につき九万円（固定 ¥90,000）。 -/
def longTermCreditBankAgencyBusinessPermitFee : Money := 90_000

/-- 三十六（三） 信用金庫法第八十五条の二第一項（許可）の信用金庫代理業の許可
    許可件数一件につき九万円（固定 ¥90,000）。 -/
def creditCooperativeAgencyBusinessPermitFee : Money := 90_000

/-- 三十六（四） 労働金庫法（昭和二十八年法律第二百二十七号）第八十九条の三第一項（許可）の
    労働金庫代理業の許可許可件数一件につき九万円（固定 ¥90,000）。 -/
def laborBankAgencyBusinessPermitFee : Money := 90_000

/-- 三十六（五） 協同組合による金融事業に関する法律（昭和二十四年法律第百八十三号）
    第六条の三第一項（信用協同組合代理業の許可）の信用協同組合代理業の許可
    許可件数一件につき九万円（固定 ¥90,000）。 -/
def creditCooperativeFinancialBusinessAgencyPermitFee : Money := 90_000

-- === 三十六の二 電子決済等取扱業者等の登録又は認定 ===

/-- 三十六の二（一） 銀行法第五十二条の六十の三（登録）の電子決済等取扱業者の登録
    登録件数一件につき十五万円（固定 ¥150,000）。 -/
def electronicPaymentOperatorRegFee : Money := 150_000

/-- 三十六の二（二） 信用金庫法第八十五条の三第一項（登録）の信用金庫電子決済等取扱業者の登録
    登録件数一件につき十五万円（固定 ¥150,000）。 -/
def creditCooperativeElectronicPaymentOperatorRegFee : Money := 150_000

/-- 三十六の二（三） 協同組合による金融事業に関する法律第六条の四の三第一項
    （信用協同組合電子決済等取扱業の登録）の信用協同組合電子決済等取扱業者の登録
    登録件数一件につき十五万円（固定 ¥150,000）。 -/
def creditCooperativeFinancialBusinessElectronicPaymentOperatorRegFee : Money := 150_000

/-- 三十六の二（四） 銀行法第五十二条の六十の二十五（認定電子決済等取扱事業者協会の認定）の
    認定電子決済等取扱事業者協会の認定認定件数一件につき十五万円（固定 ¥150,000）。 -/
def certifiedElectronicPaymentOperatorAssociationCertFee : Money := 150_000

/-- 三十六の二（五） 信用金庫法第八十五条の三の四（認定信用金庫電子決済等取扱事業者協会の認定）の
    認定信用金庫電子決済等取扱事業者協会の認定認定件数一件につき十五万円（固定 ¥150,000）。 -/
def certifiedCreditCooperativeElectronicPaymentOperatorAssociationCertFee : Money := 150_000

/-- 三十六の二（六） 協同組合による金融事業に関する法律第六条の四の六
    （認定信用協同組合電子決済等取扱事業者協会の認定）の
    認定信用協同組合電子決済等取扱事業者協会の認定認定件数一件につき十五万円
    （固定 ¥150,000）。 -/
def certifiedCreditCooperativeFinancialBusinessElectronicPaymentAssociationCertFee : Money := 150_000

-- === 三十六の三 電子決済等代行業者等の登録又は認定 ===

/-- 三十六の三（一） 銀行法第五十二条の六十一の二（登録）の電子決済等代行業者の登録
    登録件数一件につき九万円（固定 ¥90,000）。 -/
def electronicPaymentProxyOperatorRegFee : Money := 90_000

/-- 三十六の三（二） 信用金庫法第八十五条の四第一項（登録）の信用金庫電子決済等代行業者の登録
    登録件数一件につき九万円（固定 ¥90,000）。 -/
def creditCooperativeElectronicPaymentProxyOperatorRegFee : Money := 90_000

/-- 三十六の三（三） 労働金庫法第八十九条の五第一項（登録）の労働金庫電子決済等代行業者の登録
    登録件数一件につき九万円（固定 ¥90,000）。 -/
def laborBankElectronicPaymentProxyOperatorRegFee : Money := 90_000

/-- 三十六の三（四） 協同組合による金融事業に関する法律第六条の五の二第一項
    （信用協同組合電子決済等代行業の登録）の信用協同組合電子決済等代行業者の登録
    登録件数一件につき九万円（固定 ¥90,000）。 -/
def creditCooperativeFinancialBusinessElectronicPaymentProxyOperatorRegFee : Money := 90_000

/-- 三十六の三（五） 銀行法第五十二条の六十一の十九（認定電子決済等代行事業者協会の認定）の
    認定電子決済等代行事業者協会の認定認定件数一件につき十五万円（固定 ¥150,000）。 -/
def certifiedElectronicPaymentProxyOperatorAssociationCertFee : Money := 150_000

/-- 三十六の三（六） 信用金庫法第八十五条の九（認定信用金庫電子決済等代行事業者協会の認定）の
    認定信用金庫電子決済等代行事業者協会の認定認定件数一件につき十五万円（固定 ¥150,000）。 -/
def certifiedCreditCooperativeElectronicPaymentProxyAssociationCertFee : Money := 150_000

/-- 三十六の三（七） 労働金庫法第八十九条の十（認定労働金庫電子決済等代行事業者協会の認定）の
    認定労働金庫電子決済等代行事業者協会の認定認定件数一件につき十五万円（固定 ¥150,000）。 -/
def certifiedLaborBankElectronicPaymentProxyAssociationCertFee : Money := 150_000

/-- 三十六の三（八） 協同組合による金融事業に関する法律第六条の五の七
    （認定信用協同組合電子決済等代行事業者協会の認定）の
    認定信用協同組合電子決済等代行事業者協会の認定認定件数一件につき十五万円
    （固定 ¥150,000）。 -/
def certifiedCreditCooperativeFinancialBusinessElectronicPaymentProxyAssociationCertFee : Money := 150_000

-- === 三十七 保険会社等 ===

/- 三十七（注） デーミング規定（金額なし、fee def なし）:
    「保険業法第二百七十六条（登録）の特定保険募集人の登録を受けている者（…に限る。）が、
    当該所属保険会社等からの委託又は当該保険募集再委託者からの再委託を受けたことに伴い
    同法第二百八十条第一項第一号（変更等の届出等）の規定による届出をした場合における
    同条第二項の規定による登録は、新たな同法第二百七十六条の特定保険募集人の登録とみなす。」
    適用判定は caller-established。 -/

/-- 三十七（一） 保険業法第三条第一項（免許）、第百八十五条第一項（免許）又は第二百十九条第一項
    （免許）の規定による保険業の新規免許免許件数一件につき十五万円（固定 ¥150,000）。 -/
def newInsuranceBusinessLicenseFee : Money := 150_000

/-- 三十七（二） 保険業法第二百七十二条第一項（登録）の少額短期保険業者の登録
    登録件数一件につき十五万円（固定 ¥150,000）。 -/
def smallShortTermInsuranceBusinessOperatorRegFee : Money := 150_000

/-- 三十七（三） 保険業法等の一部を改正する法律（平成十七年法律第三十八号）附則第二条第一項
    （特定保険業を行つていた一般社団法人等に関する特例）の特定保険業の認可
    （国の行政機関による認可として政令で定めるものに限る。）認可件数一件につき十五万円
    （固定 ¥150,000）。「政令で定めるものに限る。」は caller-established。 -/
def specialInsuranceBusinessApprovalFee : Money := 150_000

/-- 三十七（四） 保険業法第二百八十六条（登録）の保険仲立人の登録
    登録件数一件につき九万円（固定 ¥90,000）。 -/
def insuranceBrokerRegFee : Money := 90_000

/-- 三十七（五） 保険業法第二百七十六条の特定保険募集人の登録（同法第二条第二十四項に規定する
    所属保険会社等からの委託又は同法第二百七十五条第三項に規定する保険募集再委託者からの
    再委託（一時的な必要に基づき期限を付して行われる委託又は再委託で財務省令で定めるものを
    除く。）を受けた者に係るものに限る。）登録件数一件につき一万五千円（固定 ¥15,000）。
    「財務省令で定めるものを除く。」「…者に係るものに限る。」は caller-established。 -/
def specialInsuranceSolicitorRegFee : Money := 15_000

/-- 三十七（六） 保険業法第九十九条第七項（業務の範囲等）の保険金信託業務の認可
    認可件数一件につき十五万円（固定 ¥150,000）。 -/
def insuranceClaimsTrustBusinessApprovalFee : Money := 150_000

/-- 三十七（七） 保険業法第二百七十一条の十八第一項又は第三項ただし書（保険持株会社に係る
    認可等）の認可認可件数一件につき十五万円（固定 ¥150,000）。 -/
def insuranceHoldingCompanyApprovalFee : Money := 150_000

-- === 三十八 信託会社等 ===

/-- 三十八（一） 信託業法（平成十六年法律第百五十四号）第三条（免許）又は第五十三条第一項
    （免許）の規定による信託業の免許免許件数一件につき十五万円（固定 ¥150,000）。 -/
def trustBusinessLicenseFee : Money := 150_000

/-- 三十八（二） 信託業法第七条第一項（登録）の管理型信託会社の登録（更新の登録を除く。）
    登録件数一件につき十五万円（固定 ¥150,000）。「更新の登録を除く。」は caller-established。 -/
def managementTypeTrustCompanyRegFee : Money := 150_000

/-- 三十八（三） 信託業法第五十四条第一項（登録）の管理型外国信託会社の登録
    （更新の登録を除く。）登録件数一件につき十五万円（固定 ¥150,000）。
    「更新の登録を除く。」は caller-established。 -/
def managementTypeForeignTrustCompanyRegFee : Money := 150_000

/-- 三十八（四） 信託業法第五十条の二第一項（信託法第三条第三号に掲げる方法によつてする信託に
    ついての特例）の自己信託に係る事務に関する事業の登録（更新の登録を除く。）
    登録件数一件につき十五万円（固定 ¥150,000）。「更新の登録を除く。」は caller-established。 -/
def selfTrustBusinessRegFee : Money := 150_000

/-- 三十八（五） 信託業法第五十二条第一項（特定大学技術移転事業に係る信託についての特例）の
    特定大学技術移転事業承認事業者の登録登録件数一件につき十五万円（固定 ¥150,000）。 -/
def universityTechnologyTransferApprovedBusinessRegFee : Money := 150_000

/-- 三十八（六） 信託業法第六十七条第一項（登録）の信託契約代理店の登録
    登録件数一件につき九万円（固定 ¥90,000）。 -/
def trustContractAgencyRegFee : Money := 90_000

-- === positivity ===

theorem certifiedPersonalInfoProtectionOrgCertFee_pos : certifiedPersonalInfoProtectionOrgCertFee > 0 := by decide
theorem securityGuardTrainingOrgRegFee_pos : securityGuardTrainingOrgRegFee > 0 := by decide
theorem datingInducementInfoProviderRegFee_pos : datingInducementInfoProviderRegFee > 0 := by decide
theorem casinoBusinessLicenseFee_pos : casinoBusinessLicenseFee > 0 := by decide
theorem casinoFacilityOperationBusinessLicenseFee_pos : casinoFacilityOperationBusinessLicenseFee > 0 := by decide
theorem casinoRelatedEquipmentBusinessPermitFee_pos : casinoRelatedEquipmentBusinessPermitFee > 0 := by decide
theorem casinoRelatedEquipmentForeignManufacturerCertFee_pos : casinoRelatedEquipmentForeignManufacturerCertFee > 0 := by decide
theorem foreignBankBusinessLicenseFee_pos : foreignBankBusinessLicenseFee > 0 := by decide
theorem bankForeignBankAgencyBusinessApprovalFee_pos : bankForeignBankAgencyBusinessApprovalFee > 0 := by decide
theorem longTermCreditBankForeignBankAgencyApprovalFee_pos : longTermCreditBankForeignBankAgencyApprovalFee > 0 := by decide
theorem bankForeignBranchEstablishmentApprovalFeePerPlace_pos : bankForeignBranchEstablishmentApprovalFeePerPlace > 0 := by decide
theorem bankForeignOfficeEstablishmentApprovalFeePerPlace_pos : bankForeignOfficeEstablishmentApprovalFeePerPlace > 0 := by decide
theorem bankForeignBusinessOutsourcingContractApprovalFee_pos : bankForeignBusinessOutsourcingContractApprovalFee > 0 := by decide
theorem subsidiaryForeignBankBranchEstablishmentApprovalFeePerPlace_pos : subsidiaryForeignBankBranchEstablishmentApprovalFeePerPlace > 0 := by decide
theorem subsidiaryForeignBankOfficeEstablishmentApprovalFeePerPlace_pos : subsidiaryForeignBankOfficeEstablishmentApprovalFeePerPlace > 0 := by decide
theorem creditCooperativeBusinessLicenseFee_pos : creditCooperativeBusinessLicenseFee > 0 := by decide
theorem creditCooperativeForeignBankAgencyApprovalFee_pos : creditCooperativeForeignBankAgencyApprovalFee > 0 := by decide
theorem creditCooperativeSubOfficeEstablishmentApprovalFeePerPlace_pos : creditCooperativeSubOfficeEstablishmentApprovalFeePerPlace > 0 := by decide
theorem financialInstitutionConversionApprovalFee_pos : financialInstitutionConversionApprovalFee > 0 := by decide
theorem financialInstitutionRegistrationFee_pos : financialInstitutionRegistrationFee > 0 := by decide
theorem trustBusinessConcurrentOperationApprovalFee_pos : trustBusinessConcurrentOperationApprovalFee > 0 := by decide
theorem bankHoldingCompanyApprovalFee_pos : bankHoldingCompanyApprovalFee > 0 := by decide
theorem longTermCreditBankHoldingCompanyApprovalFee_pos : longTermCreditBankHoldingCompanyApprovalFee > 0 := by decide
theorem bankAgencyBusinessPermitFee_pos : bankAgencyBusinessPermitFee > 0 := by decide
theorem longTermCreditBankAgencyBusinessPermitFee_pos : longTermCreditBankAgencyBusinessPermitFee > 0 := by decide
theorem creditCooperativeAgencyBusinessPermitFee_pos : creditCooperativeAgencyBusinessPermitFee > 0 := by decide
theorem laborBankAgencyBusinessPermitFee_pos : laborBankAgencyBusinessPermitFee > 0 := by decide
theorem creditCooperativeFinancialBusinessAgencyPermitFee_pos : creditCooperativeFinancialBusinessAgencyPermitFee > 0 := by decide
theorem electronicPaymentOperatorRegFee_pos : electronicPaymentOperatorRegFee > 0 := by decide
theorem creditCooperativeElectronicPaymentOperatorRegFee_pos : creditCooperativeElectronicPaymentOperatorRegFee > 0 := by decide
theorem creditCooperativeFinancialBusinessElectronicPaymentOperatorRegFee_pos : creditCooperativeFinancialBusinessElectronicPaymentOperatorRegFee > 0 := by decide
theorem certifiedElectronicPaymentOperatorAssociationCertFee_pos : certifiedElectronicPaymentOperatorAssociationCertFee > 0 := by decide
theorem certifiedCreditCooperativeElectronicPaymentOperatorAssociationCertFee_pos : certifiedCreditCooperativeElectronicPaymentOperatorAssociationCertFee > 0 := by decide
theorem certifiedCreditCooperativeFinancialBusinessElectronicPaymentAssociationCertFee_pos : certifiedCreditCooperativeFinancialBusinessElectronicPaymentAssociationCertFee > 0 := by decide
theorem electronicPaymentProxyOperatorRegFee_pos : electronicPaymentProxyOperatorRegFee > 0 := by decide
theorem creditCooperativeElectronicPaymentProxyOperatorRegFee_pos : creditCooperativeElectronicPaymentProxyOperatorRegFee > 0 := by decide
theorem laborBankElectronicPaymentProxyOperatorRegFee_pos : laborBankElectronicPaymentProxyOperatorRegFee > 0 := by decide
theorem creditCooperativeFinancialBusinessElectronicPaymentProxyOperatorRegFee_pos : creditCooperativeFinancialBusinessElectronicPaymentProxyOperatorRegFee > 0 := by decide
theorem certifiedElectronicPaymentProxyOperatorAssociationCertFee_pos : certifiedElectronicPaymentProxyOperatorAssociationCertFee > 0 := by decide
theorem certifiedCreditCooperativeElectronicPaymentProxyAssociationCertFee_pos : certifiedCreditCooperativeElectronicPaymentProxyAssociationCertFee > 0 := by decide
theorem certifiedLaborBankElectronicPaymentProxyAssociationCertFee_pos : certifiedLaborBankElectronicPaymentProxyAssociationCertFee > 0 := by decide
theorem certifiedCreditCooperativeFinancialBusinessElectronicPaymentProxyAssociationCertFee_pos : certifiedCreditCooperativeFinancialBusinessElectronicPaymentProxyAssociationCertFee > 0 := by decide
theorem newInsuranceBusinessLicenseFee_pos : newInsuranceBusinessLicenseFee > 0 := by decide
theorem smallShortTermInsuranceBusinessOperatorRegFee_pos : smallShortTermInsuranceBusinessOperatorRegFee > 0 := by decide
theorem specialInsuranceBusinessApprovalFee_pos : specialInsuranceBusinessApprovalFee > 0 := by decide
theorem insuranceBrokerRegFee_pos : insuranceBrokerRegFee > 0 := by decide
theorem specialInsuranceSolicitorRegFee_pos : specialInsuranceSolicitorRegFee > 0 := by decide
theorem insuranceClaimsTrustBusinessApprovalFee_pos : insuranceClaimsTrustBusinessApprovalFee > 0 := by decide
theorem insuranceHoldingCompanyApprovalFee_pos : insuranceHoldingCompanyApprovalFee > 0 := by decide
theorem trustBusinessLicenseFee_pos : trustBusinessLicenseFee > 0 := by decide
theorem managementTypeTrustCompanyRegFee_pos : managementTypeTrustCompanyRegFee > 0 := by decide
theorem managementTypeForeignTrustCompanyRegFee_pos : managementTypeForeignTrustCompanyRegFee > 0 := by decide
theorem selfTrustBusinessRegFee_pos : selfTrustBusinessRegFee > 0 := by decide
theorem universityTechnologyTransferApprovedBusinessRegFee_pos : universityTechnologyTransferApprovedBusinessRegFee > 0 := by decide
theorem trustContractAgencyRegFee_pos : trustContractAgencyRegFee > 0 := by decide

-- === kernel-decide smoke ===

example : certifiedPersonalInfoProtectionOrgCertFee = 90_000 := by decide
example : securityGuardTrainingOrgRegFee = 90_000 := by decide
example : datingInducementInfoProviderRegFee = 15_000 := by decide
example : casinoBusinessLicenseFee = 150_000 := by decide
example : casinoFacilityOperationBusinessLicenseFee = 150_000 := by decide
example : casinoRelatedEquipmentBusinessPermitFee = 150_000 := by decide
example : casinoRelatedEquipmentForeignManufacturerCertFee = 150_000 := by decide
example : foreignBankBusinessLicenseFee = 150_000 := by decide
example : bankForeignBankAgencyBusinessApprovalFee = 150_000 := by decide
example : longTermCreditBankForeignBankAgencyApprovalFee = 150_000 := by decide
example : bankForeignBranchEstablishmentApprovalFeePerPlace = 150_000 := by decide
example : bankForeignOfficeEstablishmentApprovalFeePerPlace = 90_000 := by decide
example : bankForeignBusinessOutsourcingContractApprovalFee = 90_000 := by decide
example : subsidiaryForeignBankBranchEstablishmentApprovalFeePerPlace = 150_000 := by decide
example : subsidiaryForeignBankOfficeEstablishmentApprovalFeePerPlace = 90_000 := by decide
example : creditCooperativeBusinessLicenseFee = 150_000 := by decide
example : creditCooperativeForeignBankAgencyApprovalFee = 150_000 := by decide
example : creditCooperativeSubOfficeEstablishmentApprovalFeePerPlace = 90_000 := by decide
example : financialInstitutionConversionApprovalFee = 150_000 := by decide
example : financialInstitutionRegistrationFee = 150_000 := by decide
example : trustBusinessConcurrentOperationApprovalFee = 150_000 := by decide
example : bankHoldingCompanyApprovalFee = 150_000 := by decide
example : longTermCreditBankHoldingCompanyApprovalFee = 150_000 := by decide
example : bankAgencyBusinessPermitFee = 90_000 := by decide
example : longTermCreditBankAgencyBusinessPermitFee = 90_000 := by decide
example : creditCooperativeAgencyBusinessPermitFee = 90_000 := by decide
example : laborBankAgencyBusinessPermitFee = 90_000 := by decide
example : creditCooperativeFinancialBusinessAgencyPermitFee = 90_000 := by decide
example : electronicPaymentOperatorRegFee = 150_000 := by decide
example : creditCooperativeElectronicPaymentOperatorRegFee = 150_000 := by decide
example : creditCooperativeFinancialBusinessElectronicPaymentOperatorRegFee = 150_000 := by decide
example : certifiedElectronicPaymentOperatorAssociationCertFee = 150_000 := by decide
example : certifiedCreditCooperativeElectronicPaymentOperatorAssociationCertFee = 150_000 := by decide
example : certifiedCreditCooperativeFinancialBusinessElectronicPaymentAssociationCertFee = 150_000 := by decide
example : electronicPaymentProxyOperatorRegFee = 90_000 := by decide
example : creditCooperativeElectronicPaymentProxyOperatorRegFee = 90_000 := by decide
example : laborBankElectronicPaymentProxyOperatorRegFee = 90_000 := by decide
example : creditCooperativeFinancialBusinessElectronicPaymentProxyOperatorRegFee = 90_000 := by decide
example : certifiedElectronicPaymentProxyOperatorAssociationCertFee = 150_000 := by decide
example : certifiedCreditCooperativeElectronicPaymentProxyAssociationCertFee = 150_000 := by decide
example : certifiedLaborBankElectronicPaymentProxyAssociationCertFee = 150_000 := by decide
example : certifiedCreditCooperativeFinancialBusinessElectronicPaymentProxyAssociationCertFee = 150_000 := by decide
example : newInsuranceBusinessLicenseFee = 150_000 := by decide
example : smallShortTermInsuranceBusinessOperatorRegFee = 150_000 := by decide
example : specialInsuranceBusinessApprovalFee = 150_000 := by decide
example : insuranceBrokerRegFee = 90_000 := by decide
example : specialInsuranceSolicitorRegFee = 15_000 := by decide
example : insuranceClaimsTrustBusinessApprovalFee = 150_000 := by decide
example : insuranceHoldingCompanyApprovalFee = 150_000 := by decide
example : trustBusinessLicenseFee = 150_000 := by decide
example : managementTypeTrustCompanyRegFee = 150_000 := by decide
example : managementTypeForeignTrustCompanyRegFee = 150_000 := by decide
example : selfTrustBusinessRegFee = 150_000 := by decide
example : universityTechnologyTransferApprovedBusinessRegFee = 150_000 := by decide
example : trustContractAgencyRegFee = 90_000 := by decide

end JapanTaxLaw.RegistryQualificationFeesJ1
