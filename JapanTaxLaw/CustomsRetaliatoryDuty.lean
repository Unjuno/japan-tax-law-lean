import JapanTaxLaw.TaxFinance

/-!
# CustomsRetaliatoryDuty — 関税定率法 art. 6（報復関税等）L4 モデル

Source (pinned):

  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json

Models the computable cap in art. 6 — pinned bytes 逐語:

  1項: 「…別表の税率による関税のほか、当該貨物の課税価格と同額以下の関税を課することができる。」
  2項: 「…別表の税率による関税のほか、その貨物の課税価格と同額以下の関税を課することができる。
        ただし、前項第一号に規定する紛争解決機関の手続に委ねられるべき場合は、この限りでない。」

Computation (Money = Nat):

  retaliatoryDutyCap customsValue = customsValue     -- 追加関税の上限 = 課税価格と同額
  retaliatoryDutyWithinCap customsValue additionalDuty =
    decide (additionalDuty ≤ customsValue)

Scope & honest boundaries:

* 「別表の税率による関税」は別スライス（税率表の適用）。本モジュールは**追加関税の上限**
  のみを固定する（通常関税に加えて課される追加分が課税価格を超えない、という原文の制約）。
* 国・貨物の指定、WTO 協定上の承認の有無、紛争解決機関の手続に委ねられるかは
  法的判断 — caller-established。本モジュールは適用判定をしない。
* 「課税価格」は art. 4 系統で算出された caller-established Money。
* 追加関税の具体的な額（上限以下のどの額にするか）も caller-established。
* 転記監査は fidelity-only であり法的正しさを保証しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 6(1)(2) — 報復関税の追加額の上限 = 課税価格と同額。 -/
def retaliatoryDutyCap (customsValue : Money) : Money := customsValue

/-- art. 6 — 追加関税が上限（課税価格と同額）以内か。 -/
def retaliatoryDutyWithinCap (customsValue additionalDuty : Money) : Bool :=
  decide (additionalDuty ≤ retaliatoryDutyCap customsValue)

-- ==== verified facts ====

theorem retaliatoryDutyCap_eq (customsValue : Money) :
    retaliatoryDutyCap customsValue = customsValue := rfl

theorem retaliatoryDutyWithinCap_eq (customsValue additional : Money) :
    retaliatoryDutyWithinCap customsValue additional = decide (additional ≤ customsValue) := rfl

/-- 追加関税が上限以内なら、通常関税＋追加関税は 通常関税＋課税価格 以下。 -/
theorem totalDuty_le (baseDuty customsValue additional : Money)
    (h : additional ≤ customsValue) :
    baseDuty + additional ≤ baseDuty + customsValue := by
  exact Nat.add_le_add_left h baseDuty

-- ==== kernel-decided smoke checks ====

example : retaliatoryDutyCap 1_000_000 = 1_000_000 := by decide
example : retaliatoryDutyWithinCap 1_000_000 1_000_000 = true := by decide
example : retaliatoryDutyWithinCap 1_000_000 999_999 = true := by decide
example : retaliatoryDutyWithinCap 1_000_000 1_000_001 = false := by decide
example : retaliatoryDutyWithinCap 0 0 = true := by decide

end JapanTaxLaw
