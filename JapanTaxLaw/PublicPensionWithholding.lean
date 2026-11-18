import JapanTaxLaw.TaxFinance

/-!
# PublicPensionWithholding — 所得税法 art. 203の3（公的年金等の徴収税額）L4 computation slice

Sources (pinned):

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01
  Law title: 所得税法
  Raw snapshot: data/raw/340AC0000000033_20261001_507AC0000000070.law.json

Verbatim operative sentence (pinned bytes; 原文の冒頭):

  「（徴収税額）第二百三条の三前条の規定により徴収すべき所得税の額は、
  公的年金等の金額から、次の各号に掲げる公的年金等の区分に応じ当該各号に定める金額を
  控除した残額に百分の五（第三号又は第六号に掲げる公的年金等の当該残額が
  十六万二千五百円に当該公的年金等の金額に係る月数を乗じて計算した金額を超える場合に
  おけるその超える部分の金額及び第七号に掲げる公的年金等の当該残額については、
  百分の十）の税率を乗じて計算した金額とする。」

Computation modelled here (the rate/rounding skeleton only):

  netAmount        := caller-established 控除後残額（各号の控除額計算は NOT MODELLED）
  basic            := floor(netAmount * 5 / 100)                         -- 百分の五
  threshold(months) := 162500 * months                                   -- 十六万二千五百円 × 月数
  items 3/6        := floor(min(netAmount, threshold) * 5 / 100)
                       + floor((netAmount - threshold) * 10 / 100)       -- 超過分は百分の十
  item 7           := floor(netAmount * 10 / 100)                        -- 残額全体に百分の十

Rounding is `TaxRate.applyFloor` (切り捨て); the statute says 「乗じて計算した金額」 and
does not prescribe another rounding in this article, so the shared floor primitive is used.
The two `Bool`s in `PensionWithholdingFacts` only *select* which of the three pre-built
money functions applies (第三号/第六号/第七号); they never enter an arithmetic expression
(Bool is not coerced into a money formula).

Out of scope / NOT MODELLED (caller-established inputs, no statute-to-code transcription):

  * 各号の控除額 — 政令で定める月割額、障害者 22,500／特別障害者 35,000、寡婦 22,500、
    ひとり親 30,000、源泉控除対象配偶者 32,500／老人 40,000、源泉控除対象親族
    32,500／特定扶養親族・特定親族 52,500／老人扶養親族 40,000、
    同一生計配偶者・扶養親族の障害者 22,500／同居特別障害者 62,500／
    その他特別障害者 35,000、第七号の 25% — 政令の月割額算定および各号の該当性判定は
    本モデルでは計算せず、`netAmount` / `months` / 区分 Bool として外部確定
    (caller-established)で受け取る。
  * 第二号・第五号・第六号の「政令で定める金額を控除した金額」— 政令依存のため非モデル化。
  * 前条（art. 203の2）の徴収手続、復興特別所得税の附帯徴収、納付期限 — 非モデル化。

Pinned evidence lives in doc comments only; all theorems below claim model properties only.
This is a bounded L4 model — not a complete or human-legally-reviewed formalisation.
-/

namespace JapanTaxLaw.PublicPensionWithholding

open JapanTaxLaw.TaxFinance

/-- art. 203の3 の基本税率 百分の五。 -/
def pensionWithholdingBasicRate : TaxRate := ⟨5, 100, by decide⟩

/-- art. 203の3 の超過分税率 百分の十
    （第三号・第六号の超過部分、および第七号の残額）。 -/
def pensionWithholdingExcessRate : TaxRate := ⟨10, 100, by decide⟩

/-- 「十六万二千五百円」(one month)。 -/
def pensionExcessThresholdUnit : Money := 162_500

/-- 十六万二千五百円に月数を乗じて計算した金額。 -/
def excessThreshold (months : Money) : Money := pensionExcessThresholdUnit * months

/-- 百分の五を控除後残額に乗じて計算した金額（切り捨て）。
    第一号・第二号・第四号・第五号の税率区分。 -/
def pensionWithholdingTax (netAmount : Money) : Money :=
  pensionWithholdingBasicRate.applyFloor netAmount

/-- 第三号・第六号: 基礎分は百分の五、超過分は百分の十。
    `netAmount - threshold` は Nat 減算なので saturating（超過が無ければ 0）。 -/
def pensionWithholdingWithExcess (netAmount months : Money) : Money :=
  pensionWithholdingBasicRate.applyFloor (min netAmount (excessThreshold months))
    + pensionWithholdingExcessRate.applyFloor (netAmount - excessThreshold months)

/-- 第七号: 当該残額全体に百分の十。 -/
def pensionWithholdingSeventh (netAmount : Money) : Money :=
  pensionWithholdingExcessRate.applyFloor netAmount

/-- 外部確定(caller-established)の事実。各号の控除額計算・該当性判定は NOT MODELLED。 -/
structure PensionWithholdingFacts where
  /-- 公的年金等の金額から各号の金額を控除した残額。 -/
  netAmount : Money
  /-- 当該公的年金等の金額に係る月数。 -/
  months : Money
  /-- 第三号又は第六号に該当するか（税率区分、caller-established）。 -/
  isThirdOrSixth : Bool
  /-- 第七号に該当するか（税率区分、caller-established）。第七号が優先。 -/
  isSeventh : Bool
  deriving DecidableEq, Repr

/-- 税率区分は caller-established Bool でのみ選択し、Bool を金額式には入れない。 -/
def pensionWithholdingByCategory (f : PensionWithholdingFacts) : Money :=
  if f.isSeventh then pensionWithholdingSeventh f.netAmount
  else if f.isThirdOrSixth then pensionWithholdingWithExcess f.netAmount f.months
  else pensionWithholdingTax f.netAmount

-- ==== verified model facts (positivity / smoke) ====

theorem pensionWithholdingBasicRate_numDen :
    pensionWithholdingBasicRate.num = 5 ∧ pensionWithholdingBasicRate.den = 100 := by
  decide

theorem pensionWithholdingExcessRate_numDen :
    pensionWithholdingExcessRate.num = 10 ∧ pensionWithholdingExcessRate.den = 100 := by
  decide

theorem pensionExcessThresholdUnit_value : pensionExcessThresholdUnit = 162_500 := rfl

theorem excessThreshold_zero : excessThreshold 0 = 0 := by decide

theorem excessThreshold_twelve : excessThreshold 12 = 1_950_000 := by decide

theorem excessThreshold_mono {a b : Money} (h : a ≤ b) :
    excessThreshold a ≤ excessThreshold b :=
  Nat.mul_le_mul_left pensionExcessThresholdUnit h

theorem pensionWithholdingTax_nonneg (n : Money) : 0 ≤ pensionWithholdingTax n :=
  Nat.zero_le _

theorem pensionWithholdingTax_mono {n m : Money} (h : n ≤ m) :
    pensionWithholdingTax n ≤ pensionWithholdingTax m := by
  change n * 5 / 100 ≤ m * 5 / 100
  exact Nat.div_le_div_right (Nat.mul_le_mul_right 5 h)

theorem pensionWithholdingWithExcess_nonneg (n months : Money) :
    0 ≤ pensionWithholdingWithExcess n months :=
  Nat.zero_le _

theorem pensionWithholdingSeventh_nonneg (n : Money) :
    0 ≤ pensionWithholdingSeventh n :=
  Nat.zero_le _

theorem pensionWithholdingByCategory_nonneg (f : PensionWithholdingFacts) :
    0 ≤ pensionWithholdingByCategory f :=
  Nat.zero_le _

-- smoke: 百分の五 / 百分の十
example : pensionWithholdingTax 1_000_000 = 50_000 := by decide
example : pensionWithholdingTax 1_000_001 = 50_000 := by decide
example : pensionWithholdingSeventh 1_000_000 = 100_000 := by decide
example : pensionWithholdingSeventh 100_001 = 10_000 := by decide

-- smoke: 境界 — threshold ちょうど / threshold 超 / months 0
example : pensionWithholdingWithExcess 162_500 1 = 8_125 := by decide
example : pensionWithholdingWithExcess 162_501 1 = 8_125 := by decide
example : pensionWithholdingWithExcess 1_162_500 1 = 108_125 := by decide
example : pensionWithholdingWithExcess 0 0 = 0 := by decide
example : pensionWithholdingWithExcess 100_000 0 = 10_000 := by decide

-- smoke: 税率区分の選択（Bool は選択にのみ使用）
example : pensionWithholdingByCategory ⟨1_000_000, 1, false, false⟩ = 50_000 := by decide
example : pensionWithholdingByCategory ⟨1_162_500, 1, true, false⟩ = 108_125 := by decide
example : pensionWithholdingByCategory ⟨1_000_000, 1, false, true⟩ = 100_000 := by decide
example : pensionWithholdingByCategory ⟨1_162_500, 1, true, true⟩ = 116_250 := by decide

end JapanTaxLaw.PublicPensionWithholding
