import JapanTaxLaw.TaxFinance

/-!
# CustomsProcedureRates — 関税法 art. 7の17 / art. 11 / art. 14の5（手続規定の bounded L4 モデル）

Source (pinned):

  Law id: 329AC0000000061
  Revision: 329AC0000000061_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01
  Raw snapshot: data/raw/329AC0000000061_20260601_508AC0000000005.law.json

Scope decision (per assignment): model ONLY provisions carrying an explicit
computation formula (amount × rate / deduction / cap). Provisions that are pure
procedure, notice, or delegation are NOT MODELLED (details in docs/STAGING_WD.md):

  * 第七条の十七（輸入の許可前に引き取られた貨物に係る税額等の通知）
      → NOT MODELLED: 税関長の書面通知義務。「申告に係る税額」は caller-established
        Money で、金額×率・控除・上限の計算式なし（「政令で定める事項」も委任のみ）。
  * 第十一条（関税の徴収）
      → NOT MODELLED: 徴収手続を「国税徴収の例による」と指定するのみ。計算式なし。
  * 第十四条の五（換価代金からの充当又は徴収の特例）
      → MODELED: 充当・徴収する関税の額は
          （公売・売却代金 − 関税に先だつて徴収される費用）を限度とする。
        控除（saturating Nat 減算）＋上限（min / ≤）をモデル化。

Models the computable core of art. 14の5 — pinned bytes 逐語:

  「…充て又は徴収する関税の額は、当該貨物又は物件の公売又は売却による代金の額
    （公売又は売却の費用その他関税に先だつて徴収される費用がある場合には、
    これらの費用を控除した額）を限度とする。」

Computation (Money = Nat, no coercion):

  replacementNetProceeds gross priorCosts = gross - priorCosts
      -- 費用控除後の代金 = 充当・徴収額の「限度額」（saturating Nat 減算）
  cappedReplacementDuty gross priorCosts duty =
    min duty (replacementNetProceeds gross priorCosts)
      -- 限度額に収まる実際の充当額（「を限度とする」）
  replacementDutyWithinCap gross priorCosts duty =
    decide (duty ≤ replacementNetProceeds gross priorCosts)

Scope & honest boundaries:

  * 「公売又は売却による代金の額」(grossProceeds) は caller-established Money。
  * 「公売又は売却の費用その他関税に先だつて徴収される費用」(priorCosts) も
    caller-established Money。費用の算定方法・明細は本条文に数式がなく射程外。
  * 第八十五条第一項・第八十八条（準用）・第百三十四条第五項/第六項の
    「充て又は徴収する関税」（「不足額」の算定等）は本条の前提で別条・
    caller-established。本モジュールは「代金（費用控除後）を限度とする」という
    上限構造のみを固定する。
  * 「不足額がある場合に…」の適用判定、担保の有無、国税通則法第三十八条第一項各号
    該当性は法的判断 — caller-established。Bool は計算式に入れない。
  * Underflow: 費用が代金を超える場合、本モデルは 0 を返す（saturating subtraction）。
    `replacementNetProceeds_exact` は priorCosts ≤ grossProceeds のときだけ正確であることを
    示す。0 を返すことが実務上の額を主張するものではなく、入力の妥当性は caller が担保する。
  * 本3条には税率数値がなく、本モジュールは税率を定めない（「Rates」は担当ファイル名に由来）。
  * 転記監査は fidelity-only であり法的正しさを保証しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 14の5 — 控除後代金 = 公売・売却代金 − 関税に先だつ費用（saturating Nat 減算）。
    これが充当・徴収する関税の額の「限度額」。 -/
def replacementNetProceeds (grossProceeds priorCosts : Money) : Money :=
  grossProceeds - priorCosts

/-- art. 14の5 — 限度額に収まる実際の充当・徴収額（関税額を代金が上限する）。 -/
def cappedReplacementDuty (grossProceeds priorCosts duty : Money) : Money :=
  min duty (replacementNetProceeds grossProceeds priorCosts)

/-- art. 14の5 — 関税額が限度額（控除後代金）以内か。 -/
def replacementDutyWithinCap (grossProceeds priorCosts duty : Money) : Bool :=
  decide (duty ≤ replacementNetProceeds grossProceeds priorCosts)

-- ==== verified facts ====

/-- 費用が代金以下のとき、saturating subtraction は通常の減算と一致する。 -/
theorem replacementNetProceeds_exact (grossProceeds priorCosts : Money)
    (_h : priorCosts ≤ grossProceeds) :
    replacementNetProceeds grossProceeds priorCosts = grossProceeds - priorCosts := rfl

/-- 費用が 0 なら代金そのもの（限度額は代金と同額）。 -/
theorem replacementNetProceeds_zero_costs (grossProceeds : Money) :
    replacementNetProceeds grossProceeds 0 = grossProceeds := by
  exact Nat.sub_zero grossProceeds

/-- 限度額は常に代金以下。 -/
theorem replacementNetProceeds_le_gross (grossProceeds priorCosts : Money) :
    replacementNetProceeds grossProceeds priorCosts ≤ grossProceeds := by
  exact Nat.sub_le _ _

/-- 費用が代金以上なら限度額は 0（入力妥当性は caller-established）。 -/
theorem replacementNetProceeds_zero_of_over (grossProceeds priorCosts : Money)
    (h : grossProceeds ≤ priorCosts) :
    replacementNetProceeds grossProceeds priorCosts = 0 := by
  unfold replacementNetProceeds
  exact Nat.sub_eq_zero_of_le h

/-- 実際の充当額は限度額以下。 -/
theorem cappedReplacementDuty_le_cap (grossProceeds priorCosts duty : Money) :
    cappedReplacementDuty grossProceeds priorCosts duty ≤
      replacementNetProceeds grossProceeds priorCosts := by
  exact Nat.min_le_right _ _

/-- 実際の充当額は元の関税額以下。 -/
theorem cappedReplacementDuty_le_duty (grossProceeds priorCosts duty : Money) :
    cappedReplacementDuty grossProceeds priorCosts duty ≤ duty := by
  exact Nat.min_le_left _ _

/-- 関税額が限度額以内なら、充当額は関税額に等しい（上限が効かない）。 -/
theorem cappedReplacementDuty_eq_of_within (grossProceeds priorCosts duty : Money)
    (h : duty ≤ replacementNetProceeds grossProceeds priorCosts) :
    cappedReplacementDuty grossProceeds priorCosts duty = duty := by
  exact Nat.min_eq_left h

/-- 関税額が限度額を超えるなら、充当額は限度額に等しい（上限が効く）。 -/
theorem cappedReplacementDuty_eq_of_over (grossProceeds priorCosts duty : Money)
    (h : replacementNetProceeds grossProceeds priorCosts ≤ duty) :
    cappedReplacementDuty grossProceeds priorCosts duty =
      replacementNetProceeds grossProceeds priorCosts := by
  exact Nat.min_eq_right h

/-- within-cap 判定は上限不等式と同値（rfl）。 -/
theorem replacementDutyWithinCap_eq (grossProceeds priorCosts duty : Money) :
    replacementDutyWithinCap grossProceeds priorCosts duty =
      decide (duty ≤ replacementNetProceeds grossProceeds priorCosts) := rfl

-- ==== kernel-decided smoke checks ====

example : replacementNetProceeds 1_000_000 200_000 = 800_000 := by decide
example : replacementNetProceeds 1_000_000 0 = 1_000_000 := by decide
example : replacementNetProceeds 1_000_000 1_000_000 = 0 := by decide
-- underflow: 費用 > 代金 → 0（入力妥当性は caller-established）
example : replacementNetProceeds 1_000_000 1_200_000 = 0 := by decide
-- 上限: 関税額 900,000 は限度額 800,000 に丸められる
example : cappedReplacementDuty 1_000_000 200_000 900_000 = 800_000 := by decide
example : cappedReplacementDuty 1_000_000 200_000 500_000 = 500_000 := by decide
-- within-cap 判定
example : replacementDutyWithinCap 1_000_000 200_000 800_000 = true := by decide
example : replacementDutyWithinCap 1_000_000 200_000 800_001 = false := by decide
example : replacementDutyWithinCap 1_000_000 200_000 0 = true := by decide

end JapanTaxLaw
