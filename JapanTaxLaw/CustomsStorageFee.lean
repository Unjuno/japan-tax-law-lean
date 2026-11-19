import JapanTaxLaw.TaxFinance

/-!
# CustomsStorageFee — 関税法施行令 art.70の3（収容に要した費用）bounded L4 モデル

Sources (pinned):
  Law id: 329CO0000000150
  Revision: 329CO0000000150_20260701_508CO0000000217
  Raw snapshot: data/raw/329CO0000000150_20260701_508CO0000000217.law.json
  Article Num 70_3, flat/normalized leaf text 240 chars, U+3000 count 0.

原文逐語:
  §1 「収容に要した費用は、収容貨物の保管、運搬及び…公告に要した費用並びに通信費とする。」
  §2 「保管に要した費用の額は、…保管期間一日につき、収容貨物の重量一トン又は容積一立方
       メートルまでごとに百八十円とする。」
  §3 「前条第二項の規定は、前項の保管に要した費用について準用する。」

Computation（原文逐語から導出。coordinator の数式は信じていない）:
  「一トンまでごとに」= 一トン未満も一トンとして扱う（切り上げ）。
  chargeableUnits = if 端数 = 0 then 整数部分 else 整数部分 + 1
  storageFee = 保管日数 × chargeableUnits × 180

Scope: 保管日数・重量/容積（整数部+端数）は caller-established。
重量か容積かの選択・収容場所の該当性は caller-established（Bool は金額式に入れない）。
§1 の運搬費・公告費・通信費の具体額、§3 の端数処理の準用内容は NOT MODELLED。
-/

namespace JapanTaxLaw.CustomsStorageFee

open JapanTaxLaw.TaxFinance

/-- 一日・一トン（一立方メートル）あたりの保管料 = 百八十円。 -/
def unitRate : Money := 180

/-- 「一トンまでごとに」の課金単位数。端数 > 0 なら切り上げ。 -/
def chargeableUnits (whole frac : Money) : Money :=
  if frac = 0 then whole else whole + 1

/-- 保管に要した費用 = 日数 × 課金単位数 × 180円。 -/
def storageFee (days whole frac : Money) : Money :=
  days * chargeableUnits whole frac * unitRate

example : unitRate = 180 := by decide
example : chargeableUnits 10 0 = 10 := by decide
example : chargeableUnits 10 1 = 11 := by decide
example : storageFee 1 1 0 = 180 := by decide
example : storageFee 1 1 1 = 360 := by decide   -- 1トン未満も1トン → 2トン分
example : storageFee 3 2 0 = 1080 := by decide
example : storageFee 0 5 3 = 0 := by decide

end JapanTaxLaw.CustomsStorageFee
