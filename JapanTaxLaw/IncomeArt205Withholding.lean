import JapanTaxLaw.TaxFinance

/-!
# IncomeArt205Withholding — 所得税法 art. 205（徴収税額: 源泉徴収 10%／20%）の bounded L4 モデル

Sources (pinned):

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 94C4A7AD83726CDE60787967ED4E959585AD0AF9279D25DB9AA02264B3FE606B
  (data/raw/340AC0000000033_20261001_507AC0000000070.law.json;
   same pin as IncomeArt213Withholding.lean / IncomeWithholdingRates.lean /
   IndividualIncomeTax.lean)

Pinned bytes 逐語 (needle evidence, transcribed one-for-one from the normalized source):

  art. 205 柱書 「（徴収税額）第二百五条前条第一項の規定により徴収すべき所得税の額は、
    次の各号の区分に応じ当該各号に掲げる金額とする。」
  art. 205 一号対象 「一前条第一項第一号、第二号、第四号若しくは第五号又は第七号に掲げる
    報酬若しくは料金又は契約金（次号に掲げる報酬及び料金を除く。）」
  art. 205 一号税率 「その金額に百分の十（同一人に対し一回に支払われる金額が百万円を超える
    場合には、その超える部分の金額については、百分の二十）の税率を乗じて計算した金額」
  art. 205 二号対象 「二前条第一項第二号に掲げる司法書士、土地家屋調査士若しくは海事代理士の
    業務に関する報酬若しくは料金、同項第三号に掲げる診療報酬、同項第四号に掲げる職業拳けん闘家、
    外交員、集金人若しくは電力量計の検針人の業務に関する報酬若しくは料金、同項第六号に掲げる
    報酬若しくは料金又は同項第八号に掲げる賞金」
  art. 205 二号税額 「その金額（…政令で定めるところにより計算した金額）から政令で定める
    金額を控除した残額に百分の十の税率を乗じて計算した金額」

Computational result (bounded, total Nat):

  一号: art205Tax amount
          = basic.applyFloor (min amount 1_000_000)
          + excess.applyFloor (amount - 1_000_000)      -- saturating
        amount ≤ 1,000,000 → 10% × amount
        amount > 1,000,000 → 100,000 + 20% × (amount − 1,000,000)
  二号: art205TaxAfterDeduction amount deduction
          = basic.applyFloor (amount - deduction)        -- saturating
        deduct は政令で定める金額（caller-established）。

Out of scope / honesty notes:

  * 一号／二号の区分、政令で定める控除額、各号・各号の該当性は caller-established とし、
    Bool は金額式には入れず（本モジュールでは呼び出し側が目的の def を選択する）、
    金額は全て Nat（Money）。
  * 賞金が金銭以外で支払われる場合の価額算定（「政令で定めるところにより計算した金額」）は
    **NOT MODELLED**；価額・控除額は caller-established な金額として受け取るのみ。
  * 政令で定める金額の価額算定・前条第一項各号の該当性判定は **NOT MODELLED**。
  * 丸めは切り捨て（TaxRate.applyFloor）。租税条約上の軽減・免除、端数処理（通則法
    art. 118 / 119）、復興特別所得税・防衛特別所得税、確定申告上の調整も非モデル化。
  * 所得税法全体の完成・網羅を主張しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
All arithmetic is total Nat; no `sorry`, `admit`, `Classical.choice` or `propext`.
-/ 

namespace JapanTaxLaw.IncomeArt205Withholding

open JapanTaxLaw.TaxFinance

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

-- ============================================================
-- 税率定数・閾値
-- ============================================================

/-- art. 205 一号の基本税率: 百分の十。 -/
def art205BasicRate : TaxRate := ⟨10, 100, by decide⟩

/-- art. 205 一号の超過部分税率: 百分の二十。 -/
def art205ExcessRate : TaxRate := ⟨20, 100, by decide⟩

/-- art. 205 一号の閾値: 百万円。 -/
def art205Threshold : Money := 1_000_000

-- --- positivity ---

theorem art205BasicRate_num_pos : 0 < art205BasicRate.num := by decide
theorem art205BasicRate_den_pos : 0 < art205BasicRate.den := by decide
theorem art205ExcessRate_num_pos : 0 < art205ExcessRate.num := by decide
theorem art205ExcessRate_den_pos : 0 < art205ExcessRate.den := by decide
theorem art205Threshold_pos : 0 < art205Threshold := by decide

-- ============================================================
-- 一号: art205Tax
-- ============================================================

/-- art. 205 一号の徴収税額。
    `basic.applyFloor (min amount 1_000_000) + excess.applyFloor (amount - 1_000_000)`。
    Nat 減算は saturating なので、閾値以下の金額には超過部分の 20% はかからない。 -/
def art205Tax (amount : Money) : Money :=
  art205BasicRate.applyFloor (min amount art205Threshold) +
    art205ExcessRate.applyFloor (amount - art205Threshold)

-- --- 閾値以下の characterization ---

theorem art205Tax_of_le (amount : Money) (h : amount ≤ art205Threshold) :
    art205Tax amount = amount * 10 / 100 := by
  unfold art205Tax
  rw [Nat.min_eq_left h]
  have hsub : amount - art205Threshold = 0 := natSubEqZeroOfLeFree h
  rw [hsub]
  simp [art205BasicRate, art205ExcessRate, TaxRate.applyFloor]

-- --- 閾値超えの characterization ---

theorem art205Tax_of_gt (amount : Money) (h : art205Threshold < amount) :
    art205Tax amount = 100_000 + (amount - art205Threshold) * 20 / 100 := by
  unfold art205Tax
  rw [Nat.min_eq_right (Nat.le_of_lt h)]
  simp [art205Threshold, art205BasicRate, art205ExcessRate, TaxRate.applyFloor]

-- --- 境界・基本性質 ---

theorem art205Tax_zero : art205Tax 0 = 0 := by decide

theorem art205Tax_at_threshold : art205Tax 1_000_000 = 100_000 := by decide

theorem art205Tax_one_above_threshold : art205Tax 1_000_001 = 100_000 := by decide

-- --- smoke ---

example : art205BasicRate.num = 10 := by decide
example : art205BasicRate.den = 100 := by decide
example : art205ExcessRate.num = 20 := by decide
example : art205ExcessRate.den = 100 := by decide
example : art205Threshold = 1_000_000 := by decide
example : art205Tax 100_000 = 10_000 := by decide
example : art205Tax 1_000_000 = 100_000 := by decide
example : art205Tax 1_100_000 = 120_000 := by decide
example : art205Tax 2_000_000 = 300_000 := by decide

-- ============================================================
-- 二号: art205TaxAfterDeduction（政令控除額は caller-established）
-- ============================================================

/-- art. 205 二号の徴収税額。政令で定める金額 `deduction` を控除した残額に 10%。
    `deduction > amount` なら saturating 減算で 0。
    政令控除額の価額算定は NOT MODELLED（caller-established）。 -/
def art205TaxAfterDeduction (amount deduction : Money) : Money :=
  art205BasicRate.applyFloor (amount - deduction)

-- --- saturating 減算の2分岐 ---

theorem art205TaxAfterDeduction_of_ge (amount deduction : Money)
    (_h : deduction ≤ amount) :
    art205TaxAfterDeduction amount deduction = (amount - deduction) * 10 / 100 := by
  rfl

theorem art205TaxAfterDeduction_of_lt (amount deduction : Money)
    (h : amount < deduction) : art205TaxAfterDeduction amount deduction = 0 := by
  unfold art205TaxAfterDeduction
  rw [natSubEqZeroOfLeFree (Nat.le_of_lt h)]
  simp [art205BasicRate, TaxRate.applyFloor]

-- --- 基本性質 ---

theorem art205TaxAfterDeduction_zero : art205TaxAfterDeduction 0 0 = 0 := by decide

-- --- smoke ---

example : art205TaxAfterDeduction 1_000_000 200_000 = 80_000 := by decide
example : art205TaxAfterDeduction 100 200 = 0 := by decide   -- 控除 > 金額 → 0
example : art205TaxAfterDeduction 9 0 = 0 := by decide        -- 端数切り捨て
example : art205TaxAfterDeduction 100 50 = 5 := by decide

end JapanTaxLaw.IncomeArt205Withholding
