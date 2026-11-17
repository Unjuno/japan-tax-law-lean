/-!
# CustomsExchangeRate — 関税定率法 art. 4の7（価格の換算に用いる外国為替相場）L4 モデル

Source (pinned):

  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json

Models the rate-date selection rule of art. 4の7 — pinned bytes 逐語:

  「第四条から前条までの規定により課税価格を計算する場合において、外国通貨により表示された
    価格の本邦通貨への換算は、当該輸入貨物に係る輸入申告の日（関税法第五条第一号
    （適用法令の特例）に掲げる貨物の課税価格を計算する場合にあつては、同号に定める日）
    における外国為替相場によるものとする。
    ２前項の外国為替相場は、財務省令で定める。」

What is modelled (fidelity to pinned bytes):

  * 換算に適用すべき相場の**日付の選択**:
    通常は輸入申告の日、関税法第五条第一号に掲げる貨物は同号に定める日。
    `exchangeRateDate` は caller-established Bool `article5Goods` で選択する。

What is NOT modelled (honest boundary — 勝手な算術・丸めを作らない):

  * **換算の具体的な算術（外国価格 × 相場）と丸め**: 原文は「…における外国為替相場による」
    としか書かず、第2項で相場自体を財務省令に委任している。pinned 条文に数式・丸め規則が
    ないため、架空の換算式を作ることは検証規則違反。本モジュールは「どの日の相場を
    適用するか」のみを固定する。
  * 外国為替相場の値そのもの（財務省令で定める）— caller-established。
  * 輸入申告の日・第五条第一号に定める日の特定、第五条第一号貨物への該当性 —
    すべて caller-established。日付は不透明な `Nat` 添字（カレンダー演算は本モジュール外）。
  * 転記監査は fidelity-only であり法的正しさを保証しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

/-- art. 4の7 — 換算に適用する相場の日付。通常は輸入申告の日、第五条第一号貨物は同号の日。 -/
def exchangeRateDate (article5Goods : Bool) (declarationDay article5Day : Nat) : Nat :=
  if article5Goods then article5Day else declarationDay

-- ==== verified facts ====

/-- 通常貨物は輸入申告の日の相場。 -/
theorem exchangeRateDate_normal (declarationDay article5Day : Nat) :
    exchangeRateDate false declarationDay article5Day = declarationDay := rfl

/-- 第五条第一号貨物は同号に定める日の相場。 -/
theorem exchangeRateDate_article5 (declarationDay article5Day : Nat) :
    exchangeRateDate true declarationDay article5Day = article5Day := rfl

/-- 選択される日は二つの候補のいずれか。 -/
theorem exchangeRateDate_is_one_of (b : Bool) (d a : Nat) :
    exchangeRateDate b d a = d ∨ exchangeRateDate b d a = a := by
  cases b <;> simp [exchangeRateDate]

-- ==== kernel-decided smoke checks ====

example : exchangeRateDate false 100 200 = 100 := by decide
example : exchangeRateDate true 100 200 = 200 := by decide
example : exchangeRateDate false 0 200 = 0 := by decide
example : exchangeRateDate true 100 100 = 100 := by decide

end JapanTaxLaw
