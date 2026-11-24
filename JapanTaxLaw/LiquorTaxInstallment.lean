import JapanTaxLaw.TaxFinance

/-!
# LiquorTaxInstallment — 酒税法 附則（昭和四三年法律第二七号）第八条第三項
### 手持品課税の酒税額徴収区分（分割月数）L4 モデル

Sources (pinned):
  Law id: 328AC0000000006 (酒税法)
  Revision: 328AC0000000006_20260525_506AC0000000052
  Raw snapshot: data/raw/328AC0000000006_20260525_506AC0000000052.law.json
  Article: 附則 昭和四三年四月二六日法律第二七号 第八条 第三項
  Normative unit: de48b1a2a49e… (CONDITION, 十万円以下)

原文（当該条項, whitespace-normalised verbatim）:
  「３ 第一項の規定による酒税額については、税務署長は、…酒税額の合計額が、
    同一人につき、三万円以下のときは、その該当することとなつた日の属する月の
    翌月末日限り、三万円をこえるときは、次の各号に掲げる区分に応じ、当該翌月の
    一日から当該各号に掲げる期間内の各月にその税額を等分して、それぞれその月の
    末日を納期限として、これを徴収する。
    一 その税額が十万円以下のとき。 二月
    二 その税額が十万円をこえ三十万円以下のとき。 三月
    三 その税額が三十万円をこえ五十万円以下のとき。 四月
    四 その税額が五十万円をこえるとき。 五月」

Computation derived verbatim (税額 → 分割月数, 円):
  tax ≤ 30_000                    → 1 (翌月末日限り, 一括)
  30_000 < tax ≤ 100_000          → 2 (二月)
  100_000 < tax ≤ 300_000         → 3 (三月)
  300_000 < tax ≤ 500_000         → 4 (四月)
  500_000 < tax                   → 5 (五月)

Unit / domain: tax is an amount in 円 (Nat); result is a number of months (Nat).
Scope: only the installment-month classification of §3 is modelled. Eligibility
(手持品課税の成立), 申告書 (§4), もどし入れ (§5) are NOT MODELLED. The actual
equal-division amount and due dates are caller-established. This is not legal advice.
-/

namespace JapanTaxLaw.LiquorTaxInstallment

/-- 三万円（一括徴収の境界）。 -/
def thresholdSingle : Nat := 30_000
/-- 十万円。 -/
def threshold2 : Nat := 100_000
/-- 三十万円。 -/
def threshold3 : Nat := 300_000
/-- 五十万円。 -/
def threshold4 : Nat := 500_000

/-- 実装: 原文の各号をそのまま階層条件として写した分割月数。 -/
def installmentMonths (tax : Nat) : Nat :=
  if tax ≤ thresholdSingle then 1
  else if tax ≤ threshold2 then 2
  else if tax ≤ threshold3 then 3
  else if tax ≤ threshold4 then 4
  else 5

end JapanTaxLaw.LiquorTaxInstallment
