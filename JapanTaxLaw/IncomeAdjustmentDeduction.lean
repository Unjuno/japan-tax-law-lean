import JapanTaxLaw.TaxFinance

/-!
# IncomeAdjustmentDeduction — 租税特別措置法 art. 41の3の11（所得金額調整控除）の bounded L4 モデル

Sources (pinned):

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Raw snapshot: data/raw/332AC0000000026_20261101_507AC0000000013.law.json
  （租税特別措置法, enforcement 2026-11-01 per data/INVENTORY.json;
   same pin as DeemedCapitalGainsCost.lean / SpecialGiftRate.lean / 他多数）

Namespace note: a dedicated sub-namespace `JapanTaxLaw.IncomeAdjustmentDeduction` is
used on purpose so this slice cannot collide with other flat-namespace `deduction`
constants of the project.

Pinned bytes 逐語 (needle evidence, transcribed one-for-one from the pinned source;
担当範囲原文 `C5_adj_income.txt` の本文と当該条 leaf-text は `re.sub(r"[\s　]+", "", ...)`
正規化後も一字不変で同一（1361 文字、U+3000 不包含）。各 needle は原文から
一字も変えず抽出し、pinned JSON 正規化テキストに `.find()` で各 1 回確認済み):

  art. 41の3の11(1) 該当性 「その年中の給与等の収入金額が八百五十万円を超える居住者で、特別障害者に該当するもの又は年齢二十三歳未満の扶養親族を有するもの若しくは特別障害者である同一生計配偶者若しくは扶養親族を有するものに係る総所得金額を計算する場合には、」
  art. 41の3の11(1) 金額   「その年中の給与等の収入金額（当該給与等の収入金額が千万円を超える場合には、千万円）から八百五十万円を控除した金額の百分の十に相当する金額を、その年分の給与所得の金額から控除する。」
  art. 41の3の11(2) 該当性 「その年分の給与所得控除後の給与等の金額及び公的年金等に係る雑所得の金額がある居住者で、当該給与所得控除後の給与等の金額及び当該公的年金等に係る雑所得の金額の合計額が十万円を超えるものに係る総所得金額を計算する場合には、」
  art. 41の3の11(2) 金額   「当該給与所得控除後の給与等の金額（当該給与所得控除後の給与等の金額が十万円を超える場合には、十万円）及び当該公的年金等に係る雑所得の金額（当該公的年金等に係る雑所得の金額が十万円を超える場合には、十万円）の合計額から十万円を控除した残額」
  art. 41の3の11(3) 判定日 「第一項の場合において、居住者が特別障害者に該当するかどうか又はその者が年齢二十三歳未満の扶養親族に該当するかどうか若しくは特別障害者である同一生計配偶者若しくは扶養親族に該当するかどうかの判定は、その年十二月三十一日」

金額の読み取り（日本語数字 → Arabic、原文どおり）:

  八百五十万円 = 8_500_000（第1項の適用閾値）
  千万円       = 10_000_000（第1項の給与収入の上限）
  百分の十     = 10 / 100
  十万円       = 100_000（第2項の各金額の上限・控除額）

Computational result (bounded):

  incomeAdjustmentDeduction1 salary =
    (min salary 10_000_000 - 8_500_000) * 10 / 100
      （saturating Nat 減算。salary ≤ 8_500_000 → 0;
       8_500_000 < salary ≤ 10_000_000 → 体力分の 10%;
       salary ≥ 10_000_000 → 150_000 で頭打ち）

  incomeAdjustmentDeduction2 salaryAfter pensionOther =
    min salaryAfter 100_000 + min pensionOther 100_000 - 100_000
      （saturating Nat 減算。合計が 100_000 以下 → 0）

Out of scope / honesty notes:

  * 給与等の収入金額・給与所得控除後の給与等の金額・公的年金等に係る雑所得の金額・
    居住者であること・特別障害者／23歳未満扶養親族／同一生計配偶者等に該当するか、
    そして第1項・第2項の適用の有無は **caller-established** とし、該当性や適用可否の
    Bool は金額算出式に入れません。Caller が適用する条項を選びます。
  * **第3項の判定基準日（その年 12 月 31 日／死亡・出国の時／死亡者は死亡の時の現況）
    は NOT MODELLED**。これは日付・現況判定を含む法的判断であり、金額式ではありません。
    本モジュールは金額式のみを扱い、判定基準日をモデル化しません。
  * 第2項の「第1項の規定の適用がある場合には、同項の規定による控除をした残額」
    は caller-established な入力（salaryAfter）として受け取ります。
  * 本モデルは**所得金額調整控除の額のみ**を扱い、総所得金額自体の算定、所得税法
    第22条・第121条第3項の読み替え、税額計算、他の所得控除との調整、端数処理
    （通則法 art. 118 / 119）、政令（第7項）は一切含みません。
  * 完成・網羅を主張しません。

Pinned evidence in doc-comments only; all theorems claim model properties only.
All arithmetic is total Nat; no `sorry`, `admit`, `Classical.choice` or `propext`.
-/

namespace JapanTaxLaw.IncomeAdjustmentDeduction

open JapanTaxLaw.TaxFinance

-- ============================================================
-- art. 41の3の11 — 原文の日本語数字を Arabic 化した定数
-- ============================================================

/-- art. 41の3の11(1): 八百五十万円（適用閾値）。 -/
def salaryIncomeThreshold : Money := 8_500_000

/-- art. 41の3の11(1): 千万円（給与収入の上限）。 -/
def salaryIncomeCap : Money := 10_000_000

/-- art. 41の3の11(1): 百分の十の分子。 -/
def adjustmentRateNumerator : Money := 10

/-- art. 41の3の11(1): 百分の十の分母。 -/
def adjustmentRateDenominator : Money := 100

/-- art. 41の3の11(2): 十万円（各金額の上限・控除額）。 -/
def smallIncomeCap : Money := 100_000

-- ============================================================
-- art. 41の3の11 — 控除額（bounded）
-- ============================================================

/-- art. 41の3の11(1): 所得金額調整控除額（第1項）。
    控除 = (min 給与収入 千万円 − 八百五十万円) × 10 / 100。
    Nat の減算は saturating なので、給与収入が閾値以下なら 0。
    適用の有無（850万円超・特別障害者／23歳未満扶養親族等を有するか）は
    caller-established で、この金額式には Bool を入れません。 -/
def incomeAdjustmentDeduction1 (salary : Money) : Money :=
  (min salary salaryIncomeCap - salaryIncomeThreshold) *
    adjustmentRateNumerator / adjustmentRateDenominator

/-- art. 41の3の11(2): 所得金額調整控除額（第2項）。
    控除 = min 給与所得控除後 十万 + min 公的年金雑所得 十万 − 十万。
    Nat の減算は saturating なので、合計が十万円以下なら 0。
    salaryAfter は第1項の控除を適用済みの残額を caller-established に受け取ります。 -/
def incomeAdjustmentDeduction2 (salaryAfter pensionOther : Money) : Money :=
  min salaryAfter smallIncomeCap + min pensionOther smallIncomeCap - smallIncomeCap

-- --- positivity（定数は正、閾値 < 上限） ---

theorem salaryIncomeThreshold_pos : 0 < salaryIncomeThreshold := by decide
theorem salaryIncomeCap_pos : 0 < salaryIncomeCap := by decide
theorem adjustmentRateNumerator_pos : 0 < adjustmentRateNumerator := by decide
theorem adjustmentRateDenominator_pos : 0 < adjustmentRateDenominator := by decide
theorem smallIncomeCap_pos : 0 < smallIncomeCap := by decide
theorem salaryIncomeThreshold_lt_cap : salaryIncomeThreshold < salaryIncomeCap := by decide
theorem smallIncomeCap_lt_salaryThreshold : smallIncomeCap < salaryIncomeThreshold := by decide

-- --- 第1項: saturating 境界の characterization ---

/-- `a ≤ b → a - b = 0` の axiom-free 証明。core の `Nat.sub_eq_zero_of_le` は
    `propext` に依存するため、`Nat.zero_sub` / `Nat.succ_sub_succ` を用いた
    帰納法で自前で示す。 -/
private theorem natSubEqZeroOfLeFree {a b : Nat} (h : a ≤ b) : a - b = 0 := by
  induction b generalizing a with
  | zero =>
      cases a with
      | zero => rfl
      | succ a => exact (Nat.not_succ_le_zero a h).elim
  | succ b ih =>
      cases a with
      | zero => exact Nat.zero_sub (Nat.succ b)
      | succ a =>
          rw [Nat.succ_sub_succ]
          exact ih (Nat.succ_le_succ_iff.mp h)

/-- 給与収入が八百五十万円以下なら第1項の控除は 0（850万円ちょうどを含む）。 -/
theorem incomeAdjustmentDeduction1_of_le_threshold (salary : Money)
    (h : salary ≤ salaryIncomeThreshold) :
    incomeAdjustmentDeduction1 salary = 0 := by
  unfold incomeAdjustmentDeduction1
  have hmin : min salary salaryIncomeCap ≤ salaryIncomeThreshold :=
    Nat.le_trans (Nat.min_le_left _ _) h
  rw [natSubEqZeroOfLeFree hmin]
  decide

/-- 給与収入が千万円以上なら第1項の控除は 150_000（上限で頭打ち）。 -/
theorem incomeAdjustmentDeduction1_of_ge_cap (salary : Money)
    (h : salaryIncomeCap ≤ salary) :
    incomeAdjustmentDeduction1 salary = 150_000 := by
  unfold incomeAdjustmentDeduction1
  rw [Nat.min_eq_right h]
  decide

-- --- 第2項: saturating 境界の characterization ---

/-- 上限適用後の合計が十万以下なら第2項の控除は 0。 -/
theorem incomeAdjustmentDeduction2_of_sum_le_cap (salaryAfter pensionOther : Money)
    (h : min salaryAfter smallIncomeCap + min pensionOther smallIncomeCap ≤ smallIncomeCap) :
    incomeAdjustmentDeduction2 salaryAfter pensionOther = 0 := by
  unfold incomeAdjustmentDeduction2
  exact natSubEqZeroOfLeFree h

/-- 両方が十万超なら控除は十万（上限で頭打ち）。 -/
theorem incomeAdjustmentDeduction2_of_both_ge_cap (salaryAfter pensionOther : Money)
    (hs : smallIncomeCap ≤ salaryAfter) (hp : smallIncomeCap ≤ pensionOther) :
    incomeAdjustmentDeduction2 salaryAfter pensionOther = 100_000 := by
  unfold incomeAdjustmentDeduction2
  rw [Nat.min_eq_right hs, Nat.min_eq_right hp]
  decide

-- ==== kernel-decided smoke checks ====

example : incomeAdjustmentDeduction1 0 = 0 := by decide
example : incomeAdjustmentDeduction1 8_499_999 = 0 := by decide
example : incomeAdjustmentDeduction1 8_500_000 = 0 := by decide
example : incomeAdjustmentDeduction1 8_500_001 = 0 := by decide
example : incomeAdjustmentDeduction1 8_500_010 = 1 := by decide
example : incomeAdjustmentDeduction1 9_000_000 = 50_000 := by decide
example : incomeAdjustmentDeduction1 10_000_000 = 150_000 := by decide
example : incomeAdjustmentDeduction1 10_000_001 = 150_000 := by decide

example : incomeAdjustmentDeduction2 0 0 = 0 := by decide
example : incomeAdjustmentDeduction2 100_000 0 = 0 := by decide
example : incomeAdjustmentDeduction2 200_000 0 = 0 := by decide
example : incomeAdjustmentDeduction2 200_000 50_000 = 50_000 := by decide
example : incomeAdjustmentDeduction2 200_000 200_000 = 100_000 := by decide
example : incomeAdjustmentDeduction2 99_999 2 = 1 := by decide

end JapanTaxLaw.IncomeAdjustmentDeduction
