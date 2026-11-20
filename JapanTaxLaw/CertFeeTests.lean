import JapanTaxLaw.CertFee

/-!
# CertFee tests — 関税法施行令 art.7 smoke checks
Decidable smoke tests, pinned to law 329CO0000000164 / revision 329CO0000000164_20250401_507CO0000000141.
境界: 0枚, 1枚, 紙/電子の差 (400 vs 300), 統計媒体 23,500 円。有限領域の smoke。
-/

namespace JapanTaxLaw.CertFee

example : paperCertificateFeeYen = 400 := by decide
example : electronicCertificateFeeYen = 300 := by decide
example : statisticsMediumFeeYen = 23_500 := by decide
example : certificateFeeYen false = 400 := by decide
example : certificateFeeYen true = 300 := by decide
example : totalCertificateFeeYen false 0 = 0 := by decide
example : totalCertificateFeeYen false 1 = 400 := by decide
example : totalCertificateFeeYen true 1 = 300 := by decide
example : totalCertificateFeeYen false 3 = 1200 := by decide
example : totalCertificateFeeYen true 3 = 900 := by decide
example : totalCertificateFeeYen false 10 = 4000 := by decide
example : totalCertificateFeeYen true 10 = 3000 := by decide

end JapanTaxLaw.CertFee
