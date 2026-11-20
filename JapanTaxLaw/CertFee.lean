import JapanTaxLaw.TaxFinance

/-!
# CertFee — 関税法施行令 art.7（証明書類等の交付手数料）bounded L4 モデル

Sources (pinned):
  Law id: 329CO0000000164
  Revision: 329CO0000000164_20250401_507CO0000000141
  Raw snapshot: data/raw/329CO0000000164_20250401_507CO0000000141.law.json
  Article Num 7, flat/normalized leaf text 313 chars, U+3000 count 0.

原文逐語:
  §1 「法第百二条第二項…の規定により納付すべき手数料の額は、証明書類一枚ごとに
       四百円とする。ただし、電子情報処理組織を使用して交付の申請を行う場合に
       あつては、三百円とする。」
  §2 「…記録媒体一巻ごと又は…記録媒体一枚ごとに二万三千五百円とする。」

Computation（原文逐語から導出）:
  paperCertificateFeeYen      = 400   （証明書類一枚ごとに四百円）
  electronicCertificateFeeYen = 300   （電子情報処理組織…三百円）
  statisticsMediumFeeYen      = 23_500（記録媒体…二万三千五百円）

Scope: 本スライスは §1 の証明書類交付手数料（紙 400 円 / 電子 300 円）と
§2 の統計記録媒体手数料（23,500 円）の数値・区分のみを扱う。
§2 の「区分ごと（輸出/輸入の別、記録媒体の種類別）」の集計手続、
申請の具体認定、財務大臣の集計行為は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.CertFee

open JapanTaxLaw.TaxFinance

/-- 証明書類一枚あたりの手数料（紙）= 四百円。 -/
def paperCertificateFeeYen : Money := 400
/-- 証明書類一枚あたりの手数料（電子申請）= 三百円。 -/
def electronicCertificateFeeYen : Money := 300
/-- 統計の記録媒体一巻/一枚あたりの手数料 = 二万三千五百円。 -/
def statisticsMediumFeeYen : Money := 23_500

/-- 一枚あたりの手数料。電子申請なら 300 円、それ以外なら 400 円。 -/
def certificateFeeYen (electronic : Bool) : Money :=
  if electronic then electronicCertificateFeeYen else paperCertificateFeeYen

/-- n 枚分の合計手数料。 -/
def totalCertificateFeeYen (electronic : Bool) (n : Nat) : Money :=
  n * certificateFeeYen electronic

example : paperCertificateFeeYen = 400 := by decide
example : electronicCertificateFeeYen = 300 := by decide
example : statisticsMediumFeeYen = 23_500 := by decide
example : certificateFeeYen false = 400 := by decide
example : certificateFeeYen true = 300 := by decide
example : totalCertificateFeeYen false 3 = 1200 := by decide
example : totalCertificateFeeYen true 3 = 900 := by decide

end JapanTaxLaw.CertFee
