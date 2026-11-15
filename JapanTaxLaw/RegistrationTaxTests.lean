import JapanTaxLaw.RegistrationTax

/-!
# RegistrationTax tests — 登録免許税法 別表第一（一）/ art. 15/18/19 smoke checks

Decidable smoke tests for the real-estate registration tax model, pinned to
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01

Each `example` covers an art. 9/15/19 boundary: representative kinds across
別表第一（一）, the 千円 floor of art. 15 (any amount below ¥1,000 counts as ¥1,000),
the ¥1,000 minimum tax of art. 19, and art. 18's summation of multiple registrations
in one application.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- (一）所有権の保存の登記: 100,000,000 × 4/1000 = 400,000
example : registrationTax .saveOwnership 100_000_000 = 400_000 := by decide
example : registrationTaxWithMinimum .saveOwnership 100_000_000 = 400_000 := by decide

-- (二）ハ その他の原因による移転の登記: 50,000,000 × 20/1000 = 1,000,000
example : registrationTax .transferOther 50_000_000 = 1_000_000 := by decide
-- (二）イ 相続又は法人の合併による移転の登記: 千分の四
example : registrationTax .transferByInheritance 50_000_000 = 200_000 := by decide
-- (二）ロ 共有物の分割による移転の登記: 千分の四
example : registrationTax .transferByPartition 50_000_000 = 200_000 := by decide

-- art. 15: 課税標準の全額が千円に満たないときは千円とする
example : taxableBase 0 = 1_000 := by decide
example : taxableBase 999 = 1_000 := by decide
example : taxableBase 1_000 = 1_000 := by decide
example : taxableBase 1_001 = 1_001 := by decide
-- 30,000 円の課税標準 → 30,000 × 4/1000 = 120 → 120 円（art. 15 満たす）
example : registrationTax .transferByInheritance 30_000 = 120 := by decide
-- art. 19: 計算した金額が千円に満たない場合には千円とする
example : registrationTaxWithMinimum .transferByInheritance 30_000 = 1_000 := by decide
-- 課税標準 0 円 → 1,000 × 20/1000 = 20 → art. 19 → 1,000 円
example : registrationTaxWithMinimum .transferOther 0 = 1_000 := by decide
-- ちょうど 1,000 円 → art. 19 の適用はない（千円未満でない）
example : registrationTaxWithMinimum .saveOwnership 250_000 = 1_000 := by decide

-- (三）イ 地上権等の設定又は転貸: 千分の十
example : registrationTax .leaseholdSetup 12_000_000 = 120_000 := by decide
-- (三）ロ 相続による移転: 千分の二
example : registrationTax .leaseholdTransferByInheritance 12_000_000 = 24_000 := by decide
-- (三）ハ 共有分割: 千分の二
example : registrationTax .leaseholdTransferByPartition 12_000_000 = 24_000 := by decide
-- (三）ニ その他: 千分の十
example : registrationTax .leaseholdTransferOther 12_000_000 = 120_000 := by decide

-- (三の二）配偶者居住権の設定: 千分の二
example : registrationTax .spouseResidenceSetup 30_000_000 = 60_000 := by decide

-- (五）抵当権の設定等: 債権金額 千分の四
example : registrationTax .mortgageSetup 30_000_000 = 120_000 := by decide
-- (六）イ 抵当権の移転（相続）: 千分の一
example : registrationTax .mortgageTransferByInheritance 5_000_000_000 = 5_000_000 := by decide
-- (六）ロ その他の原因による移転: 千分の二
example : registrationTax .mortgageTransferOther 5_000_000_000 = 10_000_000 := by decide

-- (十）イ 所有権の信託: 千分の四
example : registrationTax .trustOwnership 100_000_000 = 400_000 := by decide
-- (十）ロ 抵当権の信託: 債権金額 千分の二
example : registrationTax .trustMortgage 100_000_000 = 200_000 := by decide
-- (十）ハ その他の権利の信託: 千分の二
example : registrationTax .trustOtherRights 100_000_000 = 200_000 := by decide

-- art. 18: 同一申請書により二以上の登記を受ける場合は合計
example : sumRegistrationTaxes
    [(.saveOwnership, 100_000_000)] = 400_000 := by decide
example : sumRegistrationTaxes
    [(.saveOwnership, 100_000_000), (.transferOther, 50_000_000)] = 1_400_000 := by decide
-- 最低税額の適用は各登記ごとに行ってから合計する
example : sumRegistrationTaxes
    [(.transferByInheritance, 30_000), (.transferOther, 0)] = 2_000 := by decide
example : sumRegistrationTaxes [] = 0 := by decide

-- art. 15 の境界: 課税標準がちょうど 1,000 円 / 1 円の端点
example : taxableBase 999 = 1_000 := by decide
example : taxableBase 1_000 = 1_000 := by decide

end JapanTaxLaw
