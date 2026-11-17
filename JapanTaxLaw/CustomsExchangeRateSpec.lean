import JapanTaxLaw.CustomsExchangeRate

/-!
# CustomsExchangeRate spec — 関税定率法 art. 4の7

Sources (pinned; identical to CustomsExchangeRate.lean):

  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01

Independent restatement of:
  * 換算日の選択: 第五条第一号貨物なら同号の日、そうでなければ輸入申告の日
  impl が if を使うのに対し、spec は match による独立定式。

数値換算・丸め・相場値は NOT MODELLED（原文に数式なし・財務省令委任）。
Scope boundaries identical to the implementation.
-/

namespace JapanTaxLaw

/-- Spec: 換算日の選択（独立定式）。 -/
def specExchangeRateDate (article5Goods : Bool) (declarationDay article5Day : Nat) : Nat :=
  match article5Goods with
  | true => article5Day
  | false => declarationDay

-- ==== points (kernel-decided) ====

example : specExchangeRateDate false 100 200 = 100 := by decide
example : specExchangeRateDate true 100 200 = 200 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeCustomsExchangeRate : Bool :=
  exchangeRateDate false 100 200 == specExchangeRateDate false 100 200
    && exchangeRateDate true 100 200 == specExchangeRateDate true 100 200
    && exchangeRateDate false 0 999 == specExchangeRateDate false 0 999
    && exchangeRateDate true 50 50 == specExchangeRateDate true 50 50

example : agreeCustomsExchangeRate = true := by decide

end JapanTaxLaw
