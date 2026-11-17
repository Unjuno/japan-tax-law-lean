import JapanTaxLaw.TaxFinance

/-!
# CustomsValueAfterDamage — 関税定率法 art. 4の5（変質又は損傷に係る輸入貨物の課税価格の決定）L4 モデル

Source (pinned):

  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  (revision CurrentEnforced per data/INVENTORY.json)

Models the computable core of art. 4の5 — pinned bytes 逐語:

  「第四条から前条までの規定により課税価格を計算する場合において、その輸入貨物に係る取引の
    状況その他の事情からみて輸入申告の時（関税法第四条第一項第二号から第八号まで…に掲げる
    貨物にあつては、当該各号に定める時。）までに当該輸入貨物に変質又は損傷があつたと
    認められるときは、当該輸入貨物の課税価格は、当該変質又は損傷がなかつたものとした場合に
    計算される課税価格からその変質又は損傷があつたことによる減価に相当する額を控除して
    得られる価格とする。」

Computation (Money = Nat, no coercion):

  customsValueAfterDamage hypothetical depreciation = hypothetical - depreciation
    -- saturating Nat subtraction

Scope & honest boundaries:

* 「変質又は損傷がなかつたものとした場合に計算される課税価格」(hypothetical) は
  caller-established Money。art. 4〜4の4 の計算は本スライスの射程外（別モジュール）。
* 「変質又は損傷があつたことによる減価に相当する額」(depreciation) も caller-established Money。
  減価額の算定方法は本条文に数式がなく、政令・通達に依存し得るため、ここでは受け取るだけ。
* 「輸入申告の時までに変質・損傷があつたと認められる」は法的判断 — caller-established。
  Bool は式に入れない（法令は「減価額を控除した価格」という金額定義であり条件付きゼロではない）。
* **Underflow**: 減価額が仮想課税価格を超える場合、本モデルは 0 を返す（saturating subtraction）。
  `customsValueAfterDamage_exact` は depreciation ≤ hypothetical のときだけ正確であることを
  証明する。0 を返すことが「課税価格ゼロ」を主張するものではない（そのようなケースは
  法令上想定されておらず、caller が入力の妥当性を担保する）。
* 転記監査は fidelity-only であり法的正しさを保証しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 4の5 — 変質・損傷後の課税価格 = 仮想課税価格 − 減価額（saturating Nat 減算）。 -/
def customsValueAfterDamage (hypothetical depreciation : Money) : Money :=
  hypothetical - depreciation

-- ==== verified facts ====

/-- 減価額が仮想価格以下のとき、saturating subtraction は通常の減算と一致する。 -/
theorem customsValueAfterDamage_exact (hypothetical depreciation : Money)
    (_h : depreciation ≤ hypothetical) :
    customsValueAfterDamage hypothetical depreciation = hypothetical - depreciation := rfl

/-- 減価額が仮想価格以下のとき、結果は仮想価格以下。 -/
theorem customsValueAfterDamage_le_hypothetical (hypothetical depreciation : Money)
    (h : depreciation ≤ hypothetical) :
    customsValueAfterDamage hypothetical depreciation ≤ hypothetical := by
  rw [customsValueAfterDamage_exact _ _ h]
  exact Nat.sub_le _ _

/-- 減価額が 0 なら仮想価格そのまま。 -/
theorem customsValueAfterDamage_zero_depreciation (hypothetical : Money) :
    customsValueAfterDamage hypothetical 0 = hypothetical := by
  exact Nat.sub_zero hypothetical

/-- 減価額が仮想価格を超えるときは 0（還付等の主張ではない — doc-comment 参照）。 -/
theorem customsValueAfterDamage_zero_of_over (hypothetical depreciation : Money)
    (h : hypothetical ≤ depreciation) :
    customsValueAfterDamage hypothetical depreciation = 0 := by
  unfold customsValueAfterDamage
  exact Nat.sub_eq_zero_of_le h

/-- 仮想価格が 0 なら結果も 0。 -/
theorem customsValueAfterDamage_zero_hypothetical (depreciation : Money) :
    customsValueAfterDamage 0 depreciation = 0 := by
  exact Nat.zero_sub depreciation

-- ==== kernel-decided smoke checks ====

example : customsValueAfterDamage 100_000 20_000 = 80_000 := by decide
example : customsValueAfterDamage 100_000 0 = 100_000 := by decide
example : customsValueAfterDamage 100_000 100_000 = 0 := by decide
-- underflow: 減価 > 仮想 → 0（入力妥当性は caller-established）
example : customsValueAfterDamage 10_000 20_000 = 0 := by decide
example : customsValueAfterDamage 0 5_000 = 0 := by decide

end JapanTaxLaw
