import JapanTaxLaw.TaxFinance

/-!
# LocalAddedValueStandard — 地方税法 art. 72の20（収益配分額のうち報酬給与額の割合が高い法人の付加価値割の課税標準の算定）の bounded L4 モデル

Sources (pinned):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  (revision CurrentEnforced per data/INVENTORY.json; 地方税法)

原文（担当範囲・正規化済み・UTF-8）: C:\Users\junny\AppData\Local\Temp\opencode\C3_addedvalue.txt
（第七十二条の二十、469 文字）。本モジュールの doc-comment に引用する needles は
このファイルから一字も変えず抽出したもの（pinned JSON の flatten テキストとも一致確認済み、
各 1 回出現）。全角空白 U+3000 は含まない。

Pinned bytes 逐語（needle evidence, transcribed one-for-one from the normalized source,
doc-comments only）:

  1項（70%超の判定と算定の対象）:
    「当該事業年度の収益配分額のうちに当該事業年度の報酬給与額の占める割合が百分の七十を超える法人の付加価値割の課税標準の算定については、」
  1項（前条控除後・雇用安定控除額の控除）:
    「当該事業年度の付加価値額（前条の規定により控除すべき金額があるときは、これを控除した後の金額とする。）から雇用安定控除額を控除するものとする。」
  2項（雇用安定控除額）:
    「前項の雇用安定控除額は、当該事業年度の報酬給与額から当該事業年度の収益配分額に百分の七十の割合を乗じて得た金額を控除した金額とする。」
  3項（特定内国法人の国外事業分の控除）:
    「前二項の当該事業年度の収益配分額又は報酬給与額は、特定内国法人にあつては当該特定内国法人の事業の収益配分額又は報酬給与額の総額からこの法律の施行地外の事業に帰属する収益配分額又は報酬給与額を、それぞれ控除して得た額とする。」
  3項（政令みなし額）:
    「この場合において、当該特定内国法人について前条後段の規定の適用があるときは、政令で定めるところにより計算した金額をもつて、当該特定内国法人のこの法律の施行地外の事業に帰属する収益配分額又は報酬給与額とみなす。」

Modelled (only the explicit statutory arithmetic):

  * 1項の適用判定「報酬給与額の占める割合が百分の七十を超える」:
      `salary * 100 > 70 * distribution`
    交差掛け（除算を避ける）にするため分母 `distribution = 0` でも安全（停止する）。
    境界は「ちょうど 70% → false」「70% 超 → true」（原文「超える」は厳密不等式）。
  * 2項の雇用安定控除額:
      `salary - distribution * 70 / 100`
    `Nat` の飽和減算（控除すべき額が報酬給与額を超えれば 0）。
  * 1項の課税標準:
      `addedValue - deduction`（`Nat` の飽和減算）。

Scope & honest boundaries:

  * 前条の控除額・控除後の付加価値額・報酬給与額・収益配分額、および
    「70% 超の法人に該当するか」の確定は **caller-established**。
    本モジュールは与えられた金額に対する算術判定・算術のみ行う。
  * Bool は金額式に入れない。70% 超判定は `salaryRatioExceeds70` に閉じ込め、
    「適用がある場合」の分岐は呼び出し側が行う（本モジュールは判定値のみを返す）。
  * 3項の「政令で定めるところにより計算した金額をもつて…みなす」は
    **NOT MODELLED**。政令の計算内容は原文に無く、特定内国法人の国外事業分の
    帰属額の認定・前条後段の規定の適用の有無もすべて caller-established。
  * Money = Nat。厳密不等式と飽和減算のみを用い、端数規則の普遍的なモデル化は行わない
    （2項の 70% は `distribution * 70 / 100` の自然数除算・切り捨てとして符号化）。
  * 飽和減算のため結果は 0 になり得る。strict positivity は主張せず、
    代わりに「結果 ≤ 被減数」を定理として示す。
  * `agree*` は有限サンプル上の `==` 一致確認であり、法的意味の等価証明ではない。
  * 転記監査は fidelity-only であり法的正しさを保証しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
All arithmetic is total Nat.

-/

namespace JapanTaxLaw.LocalAddedValueStandard

open JapanTaxLaw.TaxFinance

-- ============================================================
-- art. 72の20 — 70%超判定・雇用安定控除額・課税標準
-- ============================================================

/-- art. 72の20 第1項: 「報酬給与額の占める割合が百分の七十を超える」か否かの判定。
    除算を避ける交差掛け `salary * 100 > 70 * distribution` を用いるため、
    分母 `distribution = 0` でも停止する。
    境界: ちょうど 70% → false、70% 超 → true（原文「超える」は厳密不等式）。 -/
def salaryRatioExceeds70 (distribution salary : Money) : Bool :=
  decide (salary * 100 > 70 * distribution)

/-- art. 72の20 第2項: 雇用安定控除額 =
    報酬給与額 − 収益配分額 × 百分の七十。
    `Nat` の飽和減算を用い、控除すべき額が報酬給与額を超える場合は 0。 -/
def employmentStabilityDeduction (distribution salary : Money) : Money :=
  salary - distribution * 70 / 100

/-- art. 72の20 第1項: 付加価値割の課税標準 =
    付加価値額（前条の控除後）− 雇用安定控除額。
    `Nat` の飽和減算を用い、控除額が付加価値額を超える場合は 0。 -/
def addedValueStandard (addedValue deduction : Money) : Money :=
  addedValue - deduction

-- ==== verified facts (model properties only) ====

theorem salaryRatioExceeds70_eq (distribution salary : Money) :
    salaryRatioExceeds70 distribution salary =
      decide (salary * 100 > 70 * distribution) := rfl

/-- `salaryRatioExceeds70 = true` と交差掛け厳密不等式は同値。 -/
theorem salaryRatioExceeds70_true_iff (distribution salary : Money) :
    salaryRatioExceeds70 distribution salary = true ↔
      salary * 100 > 70 * distribution := by
  unfold salaryRatioExceeds70
  simp

theorem employmentStabilityDeduction_eq (distribution salary : Money) :
    employmentStabilityDeduction distribution salary =
      salary - distribution * 70 / 100 := rfl

/-- 雇用安定控除額 ≤ 報酬給与額（Nat の飽和減算）。 -/
theorem employmentStabilityDeduction_le_salary (distribution salary : Money) :
    employmentStabilityDeduction distribution salary ≤ salary := by
  unfold employmentStabilityDeduction
  exact Nat.sub_le _ _

theorem addedValueStandard_eq (addedValue deduction : Money) :
    addedValueStandard addedValue deduction = addedValue - deduction := rfl

/-- 課税標準 ≤ 付加価値額（Nat の飽和減算）。 -/
theorem addedValueStandard_le_addedValue (addedValue deduction : Money) :
    addedValueStandard addedValue deduction ≤ addedValue := by
  unfold addedValueStandard
  exact Nat.sub_le _ _

-- ==== kernel-decided smoke checks ====

-- 境界: ちょうど 70% → false、70% 超 → true、70% 未満 → false
example : salaryRatioExceeds70 100 70 = false := by decide
example : salaryRatioExceeds70 100 71 = true := by decide
example : salaryRatioExceeds70 100 69 = false := by decide
example : salaryRatioExceeds70 1000 700 = false := by decide
example : salaryRatioExceeds70 1000 701 = true := by decide

-- 収益配分額零でも安全（停止する）
example : salaryRatioExceeds70 0 0 = false := by decide
example : salaryRatioExceeds70 0 1 = true := by decide

-- 第2項: 雇用安定控除額（100 の 70% = 70）
example : employmentStabilityDeduction 100 71 = 1 := by decide
example : employmentStabilityDeduction 100 70 = 0 := by decide
example : employmentStabilityDeduction 0 50 = 50 := by decide
-- 控除すべき額が報酬給与額を超える → 飽和して 0
example : employmentStabilityDeduction 100 10 = 0 := by decide

-- 第1項: 課税標準（飽和減算）
example : addedValueStandard 1000 70 = 930 := by decide
-- 控除額 > 付加価値額 → 0
example : addedValueStandard 50 100 = 0 := by decide
example : addedValueStandard 0 1 = 0 := by decide

-- 第1項・第2項の合成
example : addedValueStandard 1000 (employmentStabilityDeduction 100 71) = 999 := by decide

end JapanTaxLaw.LocalAddedValueStandard
