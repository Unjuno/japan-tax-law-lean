import JapanTaxLaw.ConditionalApprovalFee
import JapanTaxLaw.ConditionalApprovalFeeSpec

/-
# ConditionalApprovalFeeTests — kernel-decided checks for art.17（承認手数料）

Pinned: law 346CO0000000257, revision 346CO0000000257_20171008_428CO0000000240,
sha256 24fe53fb7ff3bb0a896e8110ead0fab89807e8ea9c62ccc1472e5b12771b4c74,
Article Num 17, needle「当該承認一件ごとに十二万七百円（電子申請の場合にあつては、十一万千八百円）」.
All checks are closed Nat/Bool expressions decided by the kernel or applications of
named theorems. Coverage: the two Bool selections, constant values, the reduced-fee
inequality, zero / small-input / threshold-neighbourhood inputs, and impl/spec agreement.
-/

namespace JapanTaxLaw.ConditionalApprovalFee

-- (a) Bool 選択の手数料（定理を証明項として適用）
example : feeFor true = 111_800 := feeFor_true
example : feeFor false = 120_700 := feeFor_false

-- (b) 定数値とFee低減（定理を証明項として適用）
example : standardFee = 120_700 := standardFee_value
example : electronicFee = 111_800 := electronicFee_value
example : electronicFee < standardFee := electronicFee_lt_standardFee

-- (c) kernel-decided: zero / small input / 円額のしきい値近傍
example : 0 + 120_700 = standardFee := by decide
example : 1 + 120_699 = standardFee := by decide
example : 120_700 = standardFee := by decide
example : 120_701 - 1 = standardFee := by decide
example : 111_799 + 1 = electronicFee := by decide
example : 111_800 = electronicFee := by decide
example : 111_801 - 1 = electronicFee := by decide

-- (d) impl/spec 一致
example : standardFee = specStandard := agreeStandard
example : electronicFee = specElectronic := agreeElectronic
example : feeFor true = specFee true := by decide
example : feeFor false = specFee false := by decide
example (electronic : Bool) : feeFor electronic = specFee electronic := agreeFee electronic

end JapanTaxLaw.ConditionalApprovalFee
