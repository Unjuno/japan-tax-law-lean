import JapanTaxLaw.TaxFinance

/-!
# InheritanceAnnuityDeathException — 相続税法 art. 24(2)（死亡による給付終了の特例）L4 モデル

Source (pinned):

  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json
  原文（担当範囲・正規化済み・UTF-8・1583文字）: inherit_art24.txt

Models the computable core of art. 24(2) — pinned bytes 逐語:

  「…その目的とされた者が…申告書の提出期限までに死亡し、その死亡により
    その給付が終了した場合においては…同号の規定にかかわらず、その権利者が…
    取得した時後給付を受け、又は受けるべき金額（…遺族その他の第三者が…
    死亡により給付を受ける場合には、その給付を受け、又は受けるべき金額を
    含む。）による。」

Computation (Money = Nat):

  deathExceptionValue holderAmount thirdPartyAmount =
    holderAmount + thirdPartyAmount        -- 権利者分 + 遺族等分（加算構造）

  deathExceptionSelected thirdPartyBenefit holderAmount thirdPartyAmount =
    if thirdPartyBenefit then deathExceptionValue holderAmount thirdPartyAmount
    else holderAmount                        -- 第三者給付がある場合のみ加算

Scope & honest boundaries:

* 権利者が取得した時後受け／受けるべき金額（holderAmount）・遺族その他の第三者が
  受け／受けるべき金額（thirdPartyAmount）は **すべて caller-established Money**。
* 「申告書の提出期限までに死亡した」こと（diedBeforeDeadline）、「その死亡により
  給付が終了した」こと（benefitEndedByDeath）、「遺族その他の第三者が給付を
  受ける場合」であること（thirdPartyBenefit）は **caller-established Bool**。
  Bool は金額算式には入れず、いずれの金額式を選ぶか（選択）にのみ用いる。
* 通常の価額（第3号の終身定期金として算出した金額。予定利率・複利年金現価率・
  余命年数は政令／財務省令依存）は caller-established Money（normalValue）とし、
  本モデルは加算構造のみを扱う。丸めは行わない（加算のみ）。
* art. 24(5)（契約以外の定期金に関する権利への「準用する」）は法的参照規定で
  数式がなく、本 L4 モデルでは **NOT MODELLED**（STAGING_ANDEATH.md に明記）。

Pinned evidence in doc-comments only; all theorems here claim properties of
the model only, never of the real legal semantics（誠実性の原則）。
-/ 

namespace JapanTaxLaw.InheritanceAnnuityDeathException

open JapanTaxLaw.TaxFinance

/-- art. 24(2) — 給付終了時の価額の中核となる加算構造:
    「権利者が…受け、又は受けるべき金額」＋「遺族その他の第三者が…受け、
    又は受けるべき金額」。 -/
def deathExceptionValue (holderAmount thirdPartyAmount : Money) : Money :=
  holderAmount + thirdPartyAmount

/-- art. 24(2) — 第三者給付の有無（caller-established Bool）で加算するかを選択する。
    Bool は金額式に入れず、加算式を採るか権利者分のみを採るかの選択にのみ使う。 -/
def deathExceptionSelected (thirdPartyBenefit : Bool) (holderAmount thirdPartyAmount : Money) : Money :=
  if thirdPartyBenefit then deathExceptionValue holderAmount thirdPartyAmount else holderAmount

/-- art. 24(2) — 特例の適用判定（死亡時期・給付終了の事実は caller-established Bool）。 -/
def deathExceptionApplies (diedBeforeDeadline benefitEndedByDeath : Bool) : Bool :=
  diedBeforeDeadline && benefitEndedByDeath

/-- art. 24(2) — 特例適用時の価額と通常価額（第3号）の選択を含む最上位の定式。
    normalValue（通常の価額）は caller-established Money。 -/
def art24_2Value
    (diedBeforeDeadline benefitEndedByDeath thirdPartyBenefit : Bool)
    (holderAmount thirdPartyAmount normalValue : Money) : Money :=
  if deathExceptionApplies diedBeforeDeadline benefitEndedByDeath then
    deathExceptionSelected thirdPartyBenefit holderAmount thirdPartyAmount
  else
    normalValue

-- ==== verified facts ====

theorem deathExceptionValue_eq_add (h t : Money) :
    deathExceptionValue h t = h + t := rfl

theorem deathExceptionSelected_true (h t : Money) :
    deathExceptionSelected true h t = h + t := rfl

theorem deathExceptionSelected_false (h t : Money) :
    deathExceptionSelected false h t = h := rfl

theorem deathExceptionApplies_true_true : deathExceptionApplies true true = true := rfl
theorem deathExceptionApplies_true_false : deathExceptionApplies true false = false := rfl
theorem deathExceptionApplies_false_true : deathExceptionApplies false true = false := rfl
theorem deathExceptionApplies_false_false : deathExceptionApplies false false = false := rfl

theorem deathExceptionSelected_ge_holder (b : Bool) (h t : Money) :
    h ≤ deathExceptionSelected b h t := by
  cases b with
  | false => exact Nat.le_refl h
  | true =>
      change h ≤ h + t
      exact Nat.le_add_right h t

-- ==== kernel-decided smoke checks ====

example : deathExceptionValue 0 0 = 0 := by decide
example : deathExceptionValue 100 0 = 100 := by decide
example : deathExceptionValue 0 50 = 50 := by decide
example : deathExceptionValue 100 50 = 150 := by decide

example : deathExceptionSelected true 100 50 = 150 := by decide
example : deathExceptionSelected false 100 50 = 100 := by decide
example : deathExceptionSelected true 0 0 = 0 := by decide

example : art24_2Value true true true 100 50 999 = 150 := by decide
example : art24_2Value true true false 100 50 999 = 100 := by decide
example : art24_2Value true false true 100 50 999 = 999 := by decide
example : art24_2Value false true true 100 50 999 = 999 := by decide
example : art24_2Value false false false 0 0 7 = 7 := by decide

end JapanTaxLaw.InheritanceAnnuityDeathException
