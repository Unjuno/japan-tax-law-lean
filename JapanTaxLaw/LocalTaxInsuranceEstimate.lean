import JapanTaxLaw.TaxFinance

/-!
# LocalTaxInsuranceEstimate — 地方税法施行令 第五十六条の八十九の六（支払回数割保険税額の見込額の算定方法）bounded L4 モデル

Source (pinned):

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  (data/raw/325CO0000000245_20261101_508CO0000000083.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

原文（一字も改めていない。pinned JSON と local_order_K4.txt で一致確認済み）:

  「（支払回数割保険税額の見込額の算定方法）第五十六条の八十九の六法第七百十八条の八第二項に規定する政令で定めるところにより算定した額は、当該年度の前年度分の国民健康保険税額を十二（当該国民健康保険税の納税義務が当該前年度の初日後に発生したものである場合にあつては、その発生した日の属する月から当該前年度の三月までの月数）で除して得た額に十二を乗じて得た額（当該金額に百円未満の端数があるときは、その端数金額を切り捨てた金額）とする。」

算定式（原文忠実）:

  見込額 = 百円未満切り捨て( (前年度分国民健康保険税額 ÷ 除数) × 十二 )
  - 除数は通常十二。納税義務が前年度の初日後に発生した場合は
    「その発生した日の属する月から当該前年度の三月までの月数」。
  - Nat 除算は切り捨て。原文の「除して得た額に…乗じて得た額」を忠実に表現。
  - 乗数は原文どおり十二（「十二を乗じて得た額」）。

委譲元要約との相違（重要）:

  委譲元の要約には「残りの納期の数を乗じて得た額」とあったが、pinned 原文（および
  local_order_K4.txt）は「十二を乗じて得た額（当該金額に百円未満の端数があるときは、
  その端数金額を切り捨てた金額）」である。一字も誤らぬ原文を優先し、乗数十二を固定した
  `insuranceTaxEstimate` を原文忠実形とする。要約の読みにも対応できるよう、乗数を
  caller-established で受け取る `insuranceTaxEstimateWithMultiplier` も併せて用意する。

caller-established（法的判断は自動化しない）:

  - 前年度分の国民健康保険税額
  - 除数（十二、または納税義務発生月から前年度三月までの月数）
  - 納税義務の発生时期（前年度初日後か否か、発生月）
  - 法第七百十八条の八第二項の「政令で定めるところ」による算定
  - 見込額の算定・適用、納期の判断
  計算式に Bool / if は入れていない。

第五十二条の十の二（水道又は工業用水道の用に供する家屋及び償却資産の部分の定義）は
定義規定であり金額算術（税額の算定）を含まないため **NOT MODELLED**。
詳細は docs/STAGING_WAG.md を参照。
-/

namespace JapanTaxLaw.LocalTaxInsuranceEstimate

open JapanTaxLaw.TaxFinance

/-- 原文「当該金額に百円未満の端数があるときは、その端数金額を切り捨てた金額」。 -/
def estimateHundredYenFloor (x : Money) : Money := x / 100 * 100

/-- 一般形: 前年度税額を `divisor` で除し（Nat 除算は切り捨て）、`multiplier` を乗じ、
    百円未満の端数を切り捨てる。pinned 原文は `multiplier = 12`。
    `divisor` / `multiplier` は caller-established（正性は呼び出し側が担保）。 -/
def insuranceTaxEstimateWithMultiplier (priorYearTax divisor multiplier : Money) : Money :=
  estimateHundredYenFloor ((priorYearTax / divisor) * multiplier)

/-- pinned 原文どおり: 十二で除して得た額に十二を乗じ、百円未満の端数を切り捨てる。 -/
def insuranceTaxEstimate (priorYearTax divisor : Money) : Money :=
  insuranceTaxEstimateWithMultiplier priorYearTax divisor 12

/-- 納税義務が前年度の初日後に発生しない通常ケース（除数十二）。 -/
def standardInsuranceTaxEstimate (priorYearTax : Money) : Money :=
  insuranceTaxEstimate priorYearTax 12

-- ==== verified model facts ====

/-- 百円未満切り捨ては 0 を保つ。 -/
theorem estimateHundredYenFloor_zero : estimateHundredYenFloor 0 = 0 := by decide

/-- 百円未満切り捨ては元の額を超えない。 -/
theorem estimateHundredYenFloor_le (x : Money) : estimateHundredYenFloor x ≤ x := by
  unfold estimateHundredYenFloor
  exact Nat.div_mul_le_self x 100

/-- 百円の倍数では切り捨てが恒等。 -/
theorem estimateHundredYenFloor_id (x : Money) (h : x % 100 = 0) :
    estimateHundredYenFloor x = x := by
  unfold estimateHundredYenFloor
  exact Nat.div_mul_cancel (Nat.dvd_of_mod_eq_zero h)

/-- 結果は常に非負（Money = Nat）。 -/
theorem estimateHundredYenFloor_nonneg (x : Money) : 0 ≤ estimateHundredYenFloor x := Nat.zero_le _

/-- 一般形の展開。 -/
theorem insuranceTaxEstimateWithMultiplier_eq (p d m : Money) :
    insuranceTaxEstimateWithMultiplier p d m = ((p / d) * m) / 100 * 100 := by
  rfl

/-- 前年度税額 0 → 見込額 0（除数・乗数は任意の caller-established 値）。 -/
theorem insuranceTaxEstimateWithMultiplier_zero_left (d m : Money) :
    insuranceTaxEstimateWithMultiplier 0 d m = 0 := by
  simp [insuranceTaxEstimateWithMultiplier, estimateHundredYenFloor]

/-- 乗数 0 → 見込額 0。 -/
theorem insuranceTaxEstimateWithMultiplier_zero_multiplier (p d : Money) :
    insuranceTaxEstimateWithMultiplier p d 0 = 0 := by
  simp [insuranceTaxEstimateWithMultiplier, estimateHundredYenFloor]

theorem insuranceTaxEstimateWithMultiplier_nonneg (p d m : Money) :
    0 ≤ insuranceTaxEstimateWithMultiplier p d m := Nat.zero_le _

/-- 原文忠実形の展開。 -/
theorem insuranceTaxEstimate_eq (p d : Money) :
    insuranceTaxEstimate p d = ((p / d) * 12) / 100 * 100 := by
  rfl

/-- 前年度税額 0 → 見込額 0。 -/
theorem insuranceTaxEstimate_zero (d : Money) : insuranceTaxEstimate 0 d = 0 := by
  simp [insuranceTaxEstimate, insuranceTaxEstimateWithMultiplier, estimateHundredYenFloor]

theorem insuranceTaxEstimate_nonneg (p d : Money) : 0 ≤ insuranceTaxEstimate p d := Nat.zero_le _

/-- 通常ケースの展開。 -/
theorem standardInsuranceTaxEstimate_eq (p : Money) :
    standardInsuranceTaxEstimate p = ((p / 12) * 12) / 100 * 100 := by
  rfl

theorem standardInsuranceTaxEstimate_zero : standardInsuranceTaxEstimate 0 = 0 := by decide

theorem standardInsuranceTaxEstimate_nonneg (p : Money) : 0 ≤ standardInsuranceTaxEstimate p := Nat.zero_le _

-- ==== kernel-decided smoke checks ====

example : estimateHundredYenFloor 0 = 0 := by decide
example : estimateHundredYenFloor 99 = 0 := by decide
example : estimateHundredYenFloor 100 = 100 := by decide
example : estimateHundredYenFloor 1199 = 1100 := by decide
example : estimateHundredYenFloor 1200 = 1200 := by decide

example : standardInsuranceTaxEstimate 0 = 0 := by decide
example : standardInsuranceTaxEstimate 1 = 0 := by decide
example : standardInsuranceTaxEstimate 12 = 0 := by decide         -- 割り切れるが百円未満
example : standardInsuranceTaxEstimate 100 = 0 := by decide        -- 割り切れない額
example : standardInsuranceTaxEstimate 199 = 100 := by decide
example : standardInsuranceTaxEstimate 1199 = 1100 := by decide
example : standardInsuranceTaxEstimate 1200 = 1200 := by decide
example : standardInsuranceTaxEstimate 12000 = 12000 := by decide
example : standardInsuranceTaxEstimate 120000 = 120000 := by decide
example : standardInsuranceTaxEstimate 1000000 = 999900 := by decide

example : insuranceTaxEstimate 0 12 = 0 := by decide
example : insuranceTaxEstimate 100 12 = 0 := by decide
example : insuranceTaxEstimate 1199 12 = 1100 := by decide
example : insuranceTaxEstimate 120000 6 = 240000 := by decide

example : insuranceTaxEstimateWithMultiplier 0 0 12 = 0 := by decide
example : insuranceTaxEstimateWithMultiplier 120000 12 3 = 30000 := by decide
example : insuranceTaxEstimateWithMultiplier 36000 12 5 = 15000 := by decide

end JapanTaxLaw.LocalTaxInsuranceEstimate
