import JapanTaxLaw.TaxFinance

/-!
# IncomeArt213Withholding — 所得税法 art. 213（非居住者の国内源泉所得に対する徴収税額）の bounded L4 モデル

Sources (pinned):

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 94C4A7AD83726CDE60787967ED4E959585AD0AF9279D25DB9AA02264B3FE606B
  (data/raw/340AC0000000033_20261001_507AC0000000070.law.json;
   same pin as IncomeWithholdingRates.lean / IndividualIncomeTax.lean)

Pinned bytes 逐語 (needle evidence, transcribed one-for-one from the normalized source):

  art. 213 見出し・一号 leading 「（徴収税額）第二百十三条前条第一項の規定により徴収すべき
    所得税の額は、次の各号の区分に応じ当該各号に定める金額とする。」
  art. 213 一号 「前条第一項に規定する国内源泉所得（次号及び第三号に掲げるものを除く。）
    その金額（次に掲げる国内源泉所得については、それぞれ次に定める金額）に百分の二十の税率を
    乗じて計算した金額」
  art. 213 一号イ 「イ第百六十一条第一項第十二号ロ（国内源泉所得）に掲げる年金その支払われる
    年金の額から五万円にその支払われる年金の額に係る月数を乗じて計算した金額を控除した残額」
  art. 213 一号ロ 「ロ第百六十一条第一項第十三号に掲げる賞金その金額（…政令で定めるところに
    より計算した金額）から五十万円を控除した残額」
  art. 213 一号ハ 「ハ第百六十一条第一項第十四号に掲げる年金…その支払われる年金の額に対応する
    ものとして政令で定めるところにより計算した金額を控除した残額」
  art. 213 二号 「二第百六十一条第一項第五号に掲げる国内源泉所得その金額に百分の十の税率を
    乗じて計算した金額」

Computational result (bounded):

  一号（一般 / イ / ロ / ハ）: 控除後金額 × 20 / 100 (floor, TaxRate.applyFloor)
    イ 年金: 年金の額 − 5万円 × 月数 (saturating Nat)
    ロ 賞金: 金額 − 50万円 (saturating Nat)
    ハ 年金: 年金の額 − 保険料対応額 (saturating Nat, caller-established)
  二号: 金額 × 10 / 100 (floor, TaxRate.applyFloor)

Out of scope / honesty notes:

  * 号・区分（一号/二号、イ/ロ/ハ）の該当性判定は caller-established Bool とし、
    Bool は金額式には入れず分岐条件にのみ現れる（金額は全て Nat）。
  * 一号ハの「政令で定めるところにより計算した金額」（保険料対応額）の算定、および
    第百六十一条各号・各号ロ/ハの該当性判定は **NOT MODELLED**；
    保険料対応額は caller-established な Money パラメータとして受け取るのみ。
  * 賞金が金銭以外で支払われる場合の価額算定（政令で定めるところにより計算した金額）も
    **NOT MODELLED**；価額は caller-established な金額として受け取る。
  * art. 213 第一項 三号（第百六十一条第一項第八号及び第十五号、百分の十五）および
    第二項（前条第三項の利子等・配当等・賞金）は担当範囲外につき **NOT MODELLED**。
  * 課税標準となる金額・月数、租税条約上の軽減・免除、端数処理（通則法 art. 118 / 119）、
    復興特別所得税・防衛特別所得税、確定申告上の調整も非モデル化。
  * 丸めは切り捨て（TaxRate.applyFloor）。所得税法全体の完成・網羅を主張しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
All arithmetic is total Nat; no `sorry`, `admit`, `Classical.choice` or `propext`.
-/

namespace JapanTaxLaw.IncomeArt213Withholding

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
-- 税率定数（art. 213 第一項 一号 20% / 二号 10%）
-- ============================================================

/-- art. 213 第一項 一号（一般・イ・ロ・ハ共通）: 百分の二十。 -/
def art213GeneralRate : TaxRate := ⟨20, 100, by decide⟩

/-- art. 213 第一項 二号（第百六十一条第一項第五号）: 百分の十。 -/
def art213ReducedRate : TaxRate := ⟨10, 100, by decide⟩

-- --- positivity ---

theorem art213GeneralRate_num_pos : 0 < art213GeneralRate.num := by decide
theorem art213GeneralRate_den_pos : 0 < art213GeneralRate.den := by decide
theorem art213ReducedRate_num_pos : 0 < art213ReducedRate.num := by decide
theorem art213ReducedRate_den_pos : 0 < art213ReducedRate.den := by decide

-- ============================================================
-- 控除額
-- ============================================================

/-- art. 213 一号イ: 五万円 × 月数。 -/
def pensionDeduction (months : Nat) : Money := 50_000 * months

/-- art. 213 一号ロ: 五十万円。 -/
def prizeDeduction : Money := 500_000

-- --- positivity / smoke ---

theorem pensionDeduction_zero : pensionDeduction 0 = 0 := rfl
theorem pensionDeduction_succ (months : Nat) :
    pensionDeduction (months + 1) = pensionDeduction months + 50_000 := by
  unfold pensionDeduction
  rw [Nat.mul_succ]

example : pensionDeduction 12 = 600_000 := by decide
example : prizeDeduction = 500_000 := by decide

-- ============================================================
-- 控除後金額（saturating Nat 減算）
-- ============================================================

/-- art. 213 一号イ: 年金の額 − 5万円 × 月数（控除が金額を超えれば 0）。 -/
def art213Pension12Base (annuity : Money) (months : Nat) : Money :=
  annuity - pensionDeduction months

/-- art. 213 一号ロ: 金額 − 50万円（控除が金額を超えれば 0）。 -/
def art213Prize13Base (prize : Money) : Money :=
  prize - prizeDeduction

/-- art. 213 一号ハ: 年金の額 − 保険料対応額（控除が金額を超えれば 0）。
    保険料対応額は caller-established；その算定は NOT MODELLED。 -/
def art213Pension14Base (annuity : Money) (premiumCorrespondingAmount : Money) : Money :=
  annuity - premiumCorrespondingAmount

-- --- saturating 減算の2分岐を明示 ---

theorem art213Pension12Base_of_ge (annuity : Money) (months : Nat)
    (_h : pensionDeduction months ≤ annuity) :
    art213Pension12Base annuity months = annuity - pensionDeduction months := rfl

theorem art213Pension12Base_of_lt (annuity : Money) (months : Nat)
    (h : annuity < pensionDeduction months) :
    art213Pension12Base annuity months = 0 := by
  unfold art213Pension12Base
  exact natSubEqZeroOfLeFree (Nat.le_of_lt h)

theorem art213Prize13Base_of_ge (prize : Money) (_h : prizeDeduction ≤ prize) :
    art213Prize13Base prize = prize - prizeDeduction := rfl

theorem art213Prize13Base_of_lt (prize : Money) (h : prize < prizeDeduction) :
    art213Prize13Base prize = 0 := by
  unfold art213Prize13Base
  exact natSubEqZeroOfLeFree (Nat.le_of_lt h)

theorem art213Pension14Base_of_ge (annuity premiumCorrespondingAmount : Money)
    (_h : premiumCorrespondingAmount ≤ annuity) :
    art213Pension14Base annuity premiumCorrespondingAmount =
      annuity - premiumCorrespondingAmount := rfl

theorem art213Pension14Base_of_lt (annuity premiumCorrespondingAmount : Money)
    (h : annuity < premiumCorrespondingAmount) :
    art213Pension14Base annuity premiumCorrespondingAmount = 0 := by
  unfold art213Pension14Base
  exact natSubEqZeroOfLeFree (Nat.le_of_lt h)

-- --- 控除後金額は元の金額以下 ---

theorem art213Pension12Base_le (annuity : Money) (months : Nat) :
    art213Pension12Base annuity months ≤ annuity := by
  unfold art213Pension12Base
  exact Nat.sub_le _ _

theorem art213Prize13Base_le (prize : Money) :
    art213Prize13Base prize ≤ prize := by
  unfold art213Prize13Base
  exact Nat.sub_le _ _

theorem art213Pension14Base_le (annuity premiumCorrespondingAmount : Money) :
    art213Pension14Base annuity premiumCorrespondingAmount ≤ annuity := by
  unfold art213Pension14Base
  exact Nat.sub_le _ _

-- ============================================================
-- 一号の控除後金額の選択（区分は caller-established Bool）
-- ============================================================

/-- art. 213 第一項 一号の控除後金額。イ/ロ/ハ/一般の区分は caller-established Bool。
    Bool は金額式ではなく分岐条件にのみ現れる。
    優先順: イ → ロ → ハ → 一般（一件のみ該当する caller-established な入力を想定）。 -/
def art213Item1Base (amount : Money) (months : Nat)
    (premiumCorrespondingAmount : Money)
    (isPension12 : Bool) (isPrize13 : Bool) (isPension14 : Bool) : Money :=
  if isPension12 then art213Pension12Base amount months
  else if isPrize13 then art213Prize13Base amount
  else if isPension14 then art213Pension14Base amount premiumCorrespondingAmount
  else amount

-- --- 区分選択の characterization ---

theorem art213Item1Base_pension12 (amount : Money) (months : Nat)
    (premiumCorrespondingAmount : Money) (p13 p14 : Bool) :
    art213Item1Base amount months premiumCorrespondingAmount true p13 p14 =
      art213Pension12Base amount months := by simp [art213Item1Base]

theorem art213Item1Base_prize13 (amount : Money) (months : Nat)
    (premiumCorrespondingAmount : Money) (p14 : Bool) :
    art213Item1Base amount months premiumCorrespondingAmount false true p14 =
      art213Prize13Base amount := by simp [art213Item1Base]

theorem art213Item1Base_pension14 (amount : Money) (months : Nat)
    (premiumCorrespondingAmount : Money) :
    art213Item1Base amount months premiumCorrespondingAmount false false true =
      art213Pension14Base amount premiumCorrespondingAmount := by simp [art213Item1Base]

theorem art213Item1Base_general (amount : Money) (months : Nat)
    (premiumCorrespondingAmount : Money) :
    art213Item1Base amount months premiumCorrespondingAmount false false false = amount := by simp [art213Item1Base]

-- ============================================================
-- 徴収税額
-- ============================================================

/-- art. 213 第一項 一号（20%）の徴収税額。 -/
def art213Item1WithholdingTax (amount : Money) (months : Nat)
    (premiumCorrespondingAmount : Money)
    (isPension12 : Bool) (isPrize13 : Bool) (isPension14 : Bool) : Money :=
  art213GeneralRate.applyFloor
    (art213Item1Base amount months premiumCorrespondingAmount isPension12 isPrize13 isPension14)

/-- art. 213 第一項 二号（10%）の徴収税額。 -/
def art213Item2WithholdingTax (amount : Money) : Money :=
  art213ReducedRate.applyFloor amount

/-- art. 213 第一項の徴収税額。一号/二号の区分は caller-established Bool。
    true = 二号（10%）、false = 一号（20%）。
    三号（15%）と第二項は NOT MODELLED。 -/
def article213WithholdingTax (amount : Money) (months : Nat)
    (premiumCorrespondingAmount : Money)
    (isItem2 : Bool) (isPension12 : Bool) (isPrize13 : Bool) (isPension14 : Bool) : Money :=
  if isItem2 then art213Item2WithholdingTax amount
  else art213Item1WithholdingTax amount months premiumCorrespondingAmount
         isPension12 isPrize13 isPension14

-- --- 率選択の characterization ---

theorem article213WithholdingTax_item2 (amount : Money) (months : Nat)
    (premiumCorrespondingAmount : Money) (p12 p13 p14 : Bool) :
    article213WithholdingTax amount months premiumCorrespondingAmount true p12 p13 p14 =
      amount * 10 / 100 := rfl

theorem article213WithholdingTax_item1 (amount : Money) (months : Nat)
    (premiumCorrespondingAmount : Money) (p12 p13 p14 : Bool) :
    article213WithholdingTax amount months premiumCorrespondingAmount false p12 p13 p14 =
      art213Item1Base amount months premiumCorrespondingAmount p12 p13 p14 * 20 / 100 := rfl

theorem article213WithholdingTax_item1_general (amount : Money) :
    article213WithholdingTax amount 0 0 false false false false = amount * 20 / 100 := rfl

-- ==== kernel-decided smoke checks ====

example : art213GeneralRate.num = 20 := by decide
example : art213GeneralRate.den = 100 := by decide
example : art213ReducedRate.num = 10 := by decide
example : art213ReducedRate.den = 100 := by decide

example : art213Pension12Base 1_000_000 12 = 400_000 := by decide
example : art213Pension12Base 100_000 3 = 0 := by decide
example : art213Prize13Base 1_000_000 = 500_000 := by decide
example : art213Prize13Base 400_000 = 0 := by decide
example : art213Pension14Base 1_000_000 250_000 = 750_000 := by decide
example : art213Pension14Base 100 200 = 0 := by decide

example : article213WithholdingTax 1_000_000 12 0 false true false false = 80_000 := by decide
example : article213WithholdingTax 1_000_000 0 0 false true false false = 200_000 := by decide
example : article213WithholdingTax 1_000_000 0 0 false false true false = 100_000 := by decide
example : article213WithholdingTax 1_000_000 0 250_000 false false false true = 150_000 := by decide
example : article213WithholdingTax 1_000_000 0 0 false false false false = 200_000 := by decide
example : article213WithholdingTax 1_000_000 0 0 true false false false = 100_000 := by decide
example : article213WithholdingTax 100_000 3 0 false true false false = 0 := by decide
example : article213WithholdingTax 400_000 0 0 false false true false = 0 := by decide
example : article213WithholdingTax 100 0 200 false false false true = 0 := by decide
example : article213WithholdingTax 0 0 0 false false false false = 0 := by decide
example : article213WithholdingTax 0 0 0 true false false false = 0 := by decide
example : article213WithholdingTax 9 0 0 false false false false = 1 := by decide
example : article213WithholdingTax 9 0 0 true false false false = 0 := by decide

end JapanTaxLaw.IncomeArt213Withholding
