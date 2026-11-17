import JapanTaxLaw.TaxFinance

/-
# RegistryTrustMarriageFees — 登録免許税法 別表第一（二）投資法人・有限責任事業組合・投資事業有限責任組合・限定責任信託・個人の商業登記・船舶管理人・夫婦財産契約の手数料 (L4)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  (revision CurrentEnforced per data/INVENTORY.json; same pin as
   RegistrationTax / RegistrationCommercialTax / RegistrationCommercialTaxTable.)

担当範囲原文: reg_rem_C.txt（UTF-8）。二十六 投資法人の登記 〜 三十一 夫婦財産契約の登記 を
一字も誤らず読み、各「申請件数一件につき…円」を Money 定数（一件あたり単価）としてモデル化する。

Scope note: 割当の見出しは「二十六〜二十九（投資法人・有限責任事業組合・信託・夫婦財産契約）」だが、
括弧内の「信託」= 二十八の二 限定責任信託、「夫婦財産契約」= 三十一 は数値範囲外であり、
提供された原文 reg_rem_C.txt も二十六〜三十一を含む。したがって原文に存在する各 fee string
（二十六／二十七／二十八／二十八の二／二十九／三十／三十一）を漏れなく対象とする。
原文冒頭の「つき一万円」は二十五（三）の末尾、末尾の「三十二　人の資格の…」は三十二号の見出しであり、
いずれも不完全な断片のためモデル化しない。

Modeling discipline:
* Money = Nat（円）。各定数は「申請件数一件につき」の 1 件あたり単価のみ。
  件数を掛ける Nat 掛け算は行わない（呼び出し側が判断）。
* どの号・区分に該当するか（設立／その他／抹消／清算／更正など）、申請件数、および
  対象範囲に収まるかはすべて caller-established とする。本モジュールは Bool を
  金額式に一切含めず、与えられた区分に対応する単価を返すだけである。
* 本範囲には小数点率（千分の二・五等）は存在せず、すべて定額である。したがって
  TaxRate 定数は導入しない（分母 10000 の警戒対象なし）。
* Pinned evidence is in doc-comments only. 各定理はモデルの性質のみを主張し、
  実法律の意味・解釈の正しさを主張しない。
-/

namespace JapanTaxLaw.RegistryTrustMarriageFees

open JapanTaxLaw.TaxFinance

-- ============================================================
-- 二十六 投資法人の登記
-- ============================================================

/-- 二十六（一）投資法人の設立の登記。申請件数一件につき三万円。 -/
def investmentCorporationFormationFee : Money := 30_000

/-- 二十六（二）（一）及び（三）に掲げる登記以外の登記。申請件数一件につき一万五千円。 -/
def investmentCorporationOtherRegistrationFee : Money := 15_000

/-- 二十六（三）登記の抹消。申請件数一件につき一万円。 -/
def investmentCorporationErasureFee : Money := 10_000

-- ============================================================
-- 二十七 有限責任事業組合契約の登記
-- ============================================================

/-- 二十七（一）イ 組合契約の効力の発生の登記（（二）に掲げる登記を除く）。
    申請件数一件につき六万円。 -/
def llpContractEffectivenessFee : Money := 60_000

/-- 二十七（一）ロ 従たる事務所の設置の登記。申請件数一件につき六万円。 -/
def llpBranchInstallationFee : Money := 60_000

/-- 二十七（一）ハ 主たる事務所又は従たる事務所の移転の登記。申請件数一件につき三万円。 -/
def llpRelocationFee : Money := 30_000

/-- 二十七（一）ニ 組合員に関する事項の変更の登記。申請件数一件につき一万円。 -/
def llpPartnerMattersChangeFee : Money := 10_000

/-- 二十七（一）ホ 組合員の業務執行の停止又は業務代行者の選任の登記。
    申請件数一件につき三万円。 -/
def llpPartnerSuspensionOrDeputyFee : Money := 30_000

/-- 二十七（一）ヘ イからホまで、ト及びチに掲げる登記以外の登記。
    申請件数一件につき三万円。 -/
def llpOtherRegistrationFee : Money := 30_000

/-- 二十七（一）ト 登記の更正の登記。申請件数一件につき二万円。 -/
def llpCorrectionFee : Money := 20_000

/-- 二十七（一）チ 登記の抹消。申請件数一件につき二万円。 -/
def llpErasureFee : Money := 20_000

/-- 二十七（二）イ 組合契約の清算に係る登記の清算人の登記。申請件数一件につき六千円。 -/
def llpLiquidatorRegistrationFee : Money := 6_000

/-- 二十七（二）ロ イ、ハ及びニに掲げる登記以外の登記。申請件数一件につき六千円。 -/
def llpLiquidationOtherFee : Money := 6_000

/-- 二十七（二）ハ 清算結了の登記。申請件数一件につき二千円。 -/
def llpLiquidationCompletionFee : Money := 2_000

/-- 二十七（二）ニ 登記の更正の登記又は登記の抹消。申請件数一件につき六千円。 -/
def llpLiquidationCorrectionOrErasureFee : Money := 6_000

-- ============================================================
-- 二十八 投資事業有限責任組合契約の登記
-- ============================================================

/-- 二十八（一）イ 組合契約の効力の発生の登記（（二）に掲げる登記を除く）。
    申請件数一件につき三万円。 -/
def viclpContractEffectivenessFee : Money := 30_000

/-- 二十八（一）ロ イ、ハ及びニに掲げる登記以外の登記。申請件数一件につき一万五千円。 -/
def viclpOtherRegistrationFee : Money := 15_000

/-- 二十八（一）ハ 登記の更正の登記。申請件数一件につき一万円。 -/
def viclpCorrectionFee : Money := 10_000

/-- 二十八（一）ニ 登記の抹消。申請件数一件につき一万円。 -/
def viclpErasureFee : Money := 10_000

/-- 二十八（二）イ 組合契約の清算に係る清算人の登記。申請件数一件につき六千円。 -/
def viclpLiquidatorRegistrationFee : Money := 6_000

/-- 二十八（二）ロ イ、ハ及びニに掲げる登記以外の登記。申請件数一件につき六千円。 -/
def viclpLiquidationOtherFee : Money := 6_000

/-- 二十八（二）ハ 清算結了の登記。申請件数一件につき二千円。 -/
def viclpLiquidationCompletionFee : Money := 2_000

/-- 二十八（二）ニ 登記の更正の登記又は登記の抹消。申請件数一件につき六千円。 -/
def viclpLiquidationCorrectionOrErasureFee : Money := 6_000

-- ============================================================
-- 二十八の二 限定責任信託の登記
-- ============================================================

/-- 二十八の二（一）信託法第二百三十二条の限定責任信託の定めの登記。
    申請件数一件につき三万円。 -/
def limitedLiabilityTrustProvisionFee : Money := 30_000

/-- 二十八の二（二）信託法第二百三十三条第一項の規定による新事務処理地においてする
    同法第二百三十二条各号に掲げる事項の登記。申請件数一件につき一万五千円。 -/
def limitedLiabilityTrustNewOfficeFee : Money := 15_000

/-- 二十八の二（三）（一）、（二）及び（四）から（六）までに掲げる登記以外の登記。
    申請件数一件につき一万五千円。 -/
def limitedLiabilityTrustOtherRegistrationFee : Money := 15_000

/-- 二十八の二（四）登記の更正の登記（（六）ニに掲げる登記を除く。）。
    申請件数一件につき一万円。 -/
def limitedLiabilityTrustCorrectionFee : Money := 10_000

/-- 二十八の二（五）登記の抹消（（六）ニに掲げる登記を除く。）。
    申請件数一件につき一万円。 -/
def limitedLiabilityTrustErasureFee : Money := 10_000

/-- 二十八の二（六）イ 清算受託者の登記。申請件数一件につき六千円。 -/
def limitedLiabilityTrustLiquidatorRegistrationFee : Money := 6_000

/-- 二十八の二（六）ロ イ、ハ及びニに掲げる登記以外の登記。申請件数一件につき六千円。 -/
def limitedLiabilityTrustLiquidationOtherFee : Money := 6_000

/-- 二十八の二（六）ハ 清算結了の登記。申請件数一件につき二千円。 -/
def limitedLiabilityTrustLiquidationCompletionFee : Money := 2_000

/-- 二十八の二（六）ニ 登記の更正の登記又は登記の抹消。申請件数一件につき六千円。 -/
def limitedLiabilityTrustLiquidationCorrectionOrErasureFee : Money := 6_000

-- ============================================================
-- 二十九 個人の商業登記
-- ============================================================

/-- 二十九（一）イ 本店の所在地においてする商号の新設の登記又はその取得による変更の登記。
    申請件数一件につき三万円。 -/
def individualNameEstablishmentOrChangeFee : Money := 30_000

/-- 二十九（一）ロ 支配人の選任又はその代理権の消滅の登記。申請件数一件につき三万円。 -/
def individualManagerFee : Money := 30_000

/-- 二十九（一）ハ 商法第五条（未成年者登記）又は第六条第一項（後見人登記）の規定による登記。
    申請件数一件につき一万八千円。 -/
def individualMinorOrGuardianFee : Money := 18_000

/-- 二十九（一）ニ 商法第十七条第二項（営業譲渡の際の免責の登記）の登記。
    申請件数一件につき一万八千円。 -/
def individualBusinessTransferLiabilityFee : Money := 18_000

/-- 二十九（一）ホ 商号の廃止の登記又は登記の更正、変更若しくは消滅の登記
    （これらの登記のうちイ又はロに掲げるものを除く。）。申請件数一件につき六千円。 -/
def individualNameAbolitionOrCorrectionFee : Money := 6_000

/-- 二十九（一）ヘ 登記の抹消。申請件数一件につき六千円。 -/
def individualErasureFee : Money := 6_000

/-- 二十九（二）イ 支店の所在地においてする（一）イからニまでに掲げる登記。
    申請件数一件につき九千円。 -/
def individualBranchOfficeFee : Money := 9_000

/-- 二十九（二）ロ （一）ホに掲げる登記又は登記の抹消。申請件数一件につき六千円。 -/
def individualBranchOfficeErasureFee : Money := 6_000

-- ============================================================
-- 三十 船舶管理人の登記
-- ============================================================

/-- 三十（一）船舶管理人の選任又はその代理権の消滅の登記。申請件数一件につき三万円。 -/
def shipManagerFee : Money := 30_000

/-- 三十（二）抹消された登記の回復の登記又は登記事項の更正若しくは変更の登記。
    申請件数一件につき六千円。 -/
def shipManagerCorrectionOrChangeFee : Money := 6_000

-- ============================================================
-- 三十一 夫婦財産契約の登記
-- ============================================================

/-- 三十一（一）民法第七百五十六条（夫婦財産契約の対抗要件）の登記。
    申請件数一件につき一万八千円。 -/
def matrimonialPropertyContractFee : Money := 18_000

/-- 三十一（二）登記事項の更正又は変更の登記。申請件数一件につき六千円。 -/
def matrimonialPropertyContractCorrectionOrChangeFee : Money := 6_000

/-- 三十一（三）登記の抹消。申請件数一件につき六千円。 -/
def matrimonialPropertyContractErasureFee : Money := 6_000

-- ============================================================
-- positivity（全件が正額であることの kernel-decide 確認）
-- ============================================================

theorem investmentCorporationFormationFee_pos : investmentCorporationFormationFee > 0 := by decide
theorem investmentCorporationOtherRegistrationFee_pos : investmentCorporationOtherRegistrationFee > 0 := by decide
theorem investmentCorporationErasureFee_pos : investmentCorporationErasureFee > 0 := by decide

theorem llpContractEffectivenessFee_pos : llpContractEffectivenessFee > 0 := by decide
theorem llpBranchInstallationFee_pos : llpBranchInstallationFee > 0 := by decide
theorem llpRelocationFee_pos : llpRelocationFee > 0 := by decide
theorem llpPartnerMattersChangeFee_pos : llpPartnerMattersChangeFee > 0 := by decide
theorem llpPartnerSuspensionOrDeputyFee_pos : llpPartnerSuspensionOrDeputyFee > 0 := by decide
theorem llpOtherRegistrationFee_pos : llpOtherRegistrationFee > 0 := by decide
theorem llpCorrectionFee_pos : llpCorrectionFee > 0 := by decide
theorem llpErasureFee_pos : llpErasureFee > 0 := by decide
theorem llpLiquidatorRegistrationFee_pos : llpLiquidatorRegistrationFee > 0 := by decide
theorem llpLiquidationOtherFee_pos : llpLiquidationOtherFee > 0 := by decide
theorem llpLiquidationCompletionFee_pos : llpLiquidationCompletionFee > 0 := by decide
theorem llpLiquidationCorrectionOrErasureFee_pos : llpLiquidationCorrectionOrErasureFee > 0 := by decide

theorem viclpContractEffectivenessFee_pos : viclpContractEffectivenessFee > 0 := by decide
theorem viclpOtherRegistrationFee_pos : viclpOtherRegistrationFee > 0 := by decide
theorem viclpCorrectionFee_pos : viclpCorrectionFee > 0 := by decide
theorem viclpErasureFee_pos : viclpErasureFee > 0 := by decide
theorem viclpLiquidatorRegistrationFee_pos : viclpLiquidatorRegistrationFee > 0 := by decide
theorem viclpLiquidationOtherFee_pos : viclpLiquidationOtherFee > 0 := by decide
theorem viclpLiquidationCompletionFee_pos : viclpLiquidationCompletionFee > 0 := by decide
theorem viclpLiquidationCorrectionOrErasureFee_pos : viclpLiquidationCorrectionOrErasureFee > 0 := by decide

theorem limitedLiabilityTrustProvisionFee_pos : limitedLiabilityTrustProvisionFee > 0 := by decide
theorem limitedLiabilityTrustNewOfficeFee_pos : limitedLiabilityTrustNewOfficeFee > 0 := by decide
theorem limitedLiabilityTrustOtherRegistrationFee_pos : limitedLiabilityTrustOtherRegistrationFee > 0 := by decide
theorem limitedLiabilityTrustCorrectionFee_pos : limitedLiabilityTrustCorrectionFee > 0 := by decide
theorem limitedLiabilityTrustErasureFee_pos : limitedLiabilityTrustErasureFee > 0 := by decide
theorem limitedLiabilityTrustLiquidatorRegistrationFee_pos :
    limitedLiabilityTrustLiquidatorRegistrationFee > 0 := by decide
theorem limitedLiabilityTrustLiquidationOtherFee_pos :
    limitedLiabilityTrustLiquidationOtherFee > 0 := by decide
theorem limitedLiabilityTrustLiquidationCompletionFee_pos :
    limitedLiabilityTrustLiquidationCompletionFee > 0 := by decide
theorem limitedLiabilityTrustLiquidationCorrectionOrErasureFee_pos :
    limitedLiabilityTrustLiquidationCorrectionOrErasureFee > 0 := by decide

theorem individualNameEstablishmentOrChangeFee_pos : individualNameEstablishmentOrChangeFee > 0 := by decide
theorem individualManagerFee_pos : individualManagerFee > 0 := by decide
theorem individualMinorOrGuardianFee_pos : individualMinorOrGuardianFee > 0 := by decide
theorem individualBusinessTransferLiabilityFee_pos : individualBusinessTransferLiabilityFee > 0 := by decide
theorem individualNameAbolitionOrCorrectionFee_pos : individualNameAbolitionOrCorrectionFee > 0 := by decide
theorem individualErasureFee_pos : individualErasureFee > 0 := by decide
theorem individualBranchOfficeFee_pos : individualBranchOfficeFee > 0 := by decide
theorem individualBranchOfficeErasureFee_pos : individualBranchOfficeErasureFee > 0 := by decide

theorem shipManagerFee_pos : shipManagerFee > 0 := by decide
theorem shipManagerCorrectionOrChangeFee_pos : shipManagerCorrectionOrChangeFee > 0 := by decide

theorem matrimonialPropertyContractFee_pos : matrimonialPropertyContractFee > 0 := by decide
theorem matrimonialPropertyContractCorrectionOrChangeFee_pos :
    matrimonialPropertyContractCorrectionOrChangeFee > 0 := by decide
theorem matrimonialPropertyContractErasureFee_pos : matrimonialPropertyContractErasureFee > 0 := by decide

-- ============================================================
-- smoke（金額一致の kernel-decide 確認）
-- ============================================================

example : investmentCorporationFormationFee = 30_000 := by decide
example : investmentCorporationOtherRegistrationFee = 15_000 := by decide
example : investmentCorporationErasureFee = 10_000 := by decide

example : llpContractEffectivenessFee = 60_000 := by decide
example : llpBranchInstallationFee = 60_000 := by decide
example : llpRelocationFee = 30_000 := by decide
example : llpPartnerMattersChangeFee = 10_000 := by decide
example : llpPartnerSuspensionOrDeputyFee = 30_000 := by decide
example : llpOtherRegistrationFee = 30_000 := by decide
example : llpCorrectionFee = 20_000 := by decide
example : llpErasureFee = 20_000 := by decide
example : llpLiquidatorRegistrationFee = 6_000 := by decide
example : llpLiquidationOtherFee = 6_000 := by decide
example : llpLiquidationCompletionFee = 2_000 := by decide
example : llpLiquidationCorrectionOrErasureFee = 6_000 := by decide

example : viclpContractEffectivenessFee = 30_000 := by decide
example : viclpOtherRegistrationFee = 15_000 := by decide
example : viclpCorrectionFee = 10_000 := by decide
example : viclpErasureFee = 10_000 := by decide
example : viclpLiquidatorRegistrationFee = 6_000 := by decide
example : viclpLiquidationOtherFee = 6_000 := by decide
example : viclpLiquidationCompletionFee = 2_000 := by decide
example : viclpLiquidationCorrectionOrErasureFee = 6_000 := by decide

example : limitedLiabilityTrustProvisionFee = 30_000 := by decide
example : limitedLiabilityTrustNewOfficeFee = 15_000 := by decide
example : limitedLiabilityTrustOtherRegistrationFee = 15_000 := by decide
example : limitedLiabilityTrustCorrectionFee = 10_000 := by decide
example : limitedLiabilityTrustErasureFee = 10_000 := by decide
example : limitedLiabilityTrustLiquidatorRegistrationFee = 6_000 := by decide
example : limitedLiabilityTrustLiquidationOtherFee = 6_000 := by decide
example : limitedLiabilityTrustLiquidationCompletionFee = 2_000 := by decide
example : limitedLiabilityTrustLiquidationCorrectionOrErasureFee = 6_000 := by decide

example : individualNameEstablishmentOrChangeFee = 30_000 := by decide
example : individualManagerFee = 30_000 := by decide
example : individualMinorOrGuardianFee = 18_000 := by decide
example : individualBusinessTransferLiabilityFee = 18_000 := by decide
example : individualNameAbolitionOrCorrectionFee = 6_000 := by decide
example : individualErasureFee = 6_000 := by decide
example : individualBranchOfficeFee = 9_000 := by decide
example : individualBranchOfficeErasureFee = 6_000 := by decide

example : shipManagerFee = 30_000 := by decide
example : shipManagerCorrectionOrChangeFee = 6_000 := by decide

example : matrimonialPropertyContractFee = 18_000 := by decide
example : matrimonialPropertyContractCorrectionOrChangeFee = 6_000 := by decide
example : matrimonialPropertyContractErasureFee = 6_000 := by decide

end JapanTaxLaw.RegistryTrustMarriageFees
