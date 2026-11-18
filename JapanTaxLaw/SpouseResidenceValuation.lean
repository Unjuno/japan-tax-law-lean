import JapanTaxLaw.TaxFinance

/-
# SpouseResidenceValuation — 相続税法 art. 23の2（配偶者居住権等の評価）bounded L4 モデル

Source (pinned):

  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json

担当範囲の原文（一字も誤らず、pinned JSON の当該条 leaf-text より転記。needle として転記監査に渡す）:

  （配偶者居住権等の評価）第二十三条の二配偶者居住権の価額は、第一号に掲げる価額から同号に掲げる価額に第二号に掲げる数及び第三号に掲げる割合を乗じて得た金額を控除した残額とする。一当該配偶者居住権の目的となつている建物の相続開始の時における当該配偶者居住権が設定されていないものとした場合の時価（当該建物の一部が賃貸の用に供されている場合又は被相続人が当該相続開始の直前において当該建物をその配偶者と共有していた場合には、当該建物のうち当該賃貸の用に供されていない部分又は当該被相続人の持分の割合に応ずる部分の価額として政令で定めるところにより計算した金額）二当該配偶者居住権が設定された時におけるイに掲げる年数をロに掲げる年数で除して得た数（イ又はロに掲げる年数が零以下である場合には、零）イ当該配偶者居住権の目的となつている建物の耐用年数（所得税法の規定に基づいて定められている耐用年数に準ずるものとして政令で定める年数をいう。ロにおいて同じ。）から建築後の経過年数（六月以上の端数は一年とし、六月に満たない端数は切り捨てる。ロにおいて同じ。）及び当該配偶者居住権の存続年数（当該配偶者居住権が存続する年数として政令で定める年数をいう。次号において同じ。）を控除した年数ロイの建物の耐用年数から建築後の経過年数を控除した年数三当該配偶者居住権が設定された時における当該配偶者居住権の存続年数に応じ、法定利率による複利の計算で現価を算出するための割合として財務省令で定めるもの２配偶者居住権の目的となつている建物の価額は、当該建物の相続開始の時における当該配偶者居住権が設定されていないものとした場合の時価から前項の規定により計算した当該配偶者居住権の価額を控除した残額とする。３配偶者居住権の目的となつている建物の敷地の用に供される土地（土地の上に存する権利を含む。以下この条において同じ。）を当該配偶者居住権に基づき使用する権利の価額は、第一号に掲げる価額から第二号に掲げる金額を控除した残額とする。一当該土地の相続開始の時における当該配偶者居住権が設定されていないものとした場合の時価（当該建物の一部が賃貸の用に供されている場合又は被相続人が当該相続開始の直前において当該土地を他の者と共有し、若しくは当該建物をその配偶者と共有していた場合には、当該建物のうち当該賃貸の用に供されていない部分に応ずる部分又は当該被相続人の持分の割合に応ずる部分の価額として政令で定めるところにより計算した金額）二前号に掲げる価額に第一項第三号に掲げる割合を乗じて得た金額４配偶者居住権の目的となつている建物の敷地の用に供される土地の価額は、当該土地の相続開始の時における当該配偶者居住権が設定されていないものとした場合の時価から前項の規定により計算した権利の価額を控除した残額とする。

Computation (Money = Nat; years / rates / ratio as Nat):

  第1項  spouseResidenceValue building yrsRate ratio
           = building - building * yrsRate * ratio          -- saturating Nat, 端数切り捨て
  第2項  residenceBuildingValue market residenceValue
           = market - residenceValue                        -- saturating
  第3項  landUseRightValue land ratio
           = land - land * ratio                            -- saturating
  第4項  landValueAfterUseRight market useRight
           = market - useRight                              -- saturating

  二号の年数:
    remainingYears usefulLife elapsed = if usefulLife ≤ elapsed then 0 else usefulLife - elapsed   -- ロ
    netBuildingYears usefulLife elapsed duration = remainingYears usefulLife (elapsed + duration)    -- イ
    yearsRate i ro = if i = 0 || ro = 0 then 0 else i / ro                                           -- イ÷ロ, 零以下→零

Scope & honest boundaries:

  * 一号の「政令で定めるところにより計算した金額」（一部賃貸・共有持分の按分）は政令依存のため
    NOT MODELLED。時価 buildingValue / landValue は caller-established Money。
  * 耐用年数そのものの算定、建築後経過年数の「六月以上を一年、六月未満切り捨て」の端数処理、
    存続年数の算定は政令依存のため NOT MODELLED。remainingYears / netBuildingYears は
    「零以下なら零」の saturating 構造のみを写す。
  * 三号の割合（法定利率による複利の計算で現価を算出するための割合として財務省令で定めるもの）は
    caller-established Nat（省令値）。除数・割合・時価はいずれも caller-established。
  * Pinned evidence は doc-comment にのみ置き、以下の定理はモデルの性質のみを主張する
    （法的意味の等価ではない。転記監査は fidelity-only）。小さな L4 スライスであり、
    完成・網羅を主張しない。人間の法的レビューではない。
-/

namespace JapanTaxLaw.SpouseResidenceValuation

open JapanTaxLaw.TaxFinance

-- ==== 二号: 年数と「数」 ====

/-- ロ（耐用年数 − 建築後経過年数）。原文「零以下である場合には、零」を
    saturating Nat 減算で表現する。 -/
def remainingYears (usefulLife elapsed : Nat) : Nat :=
  if usefulLife ≤ elapsed then 0 else usefulLife - elapsed

/-- イ（耐用年数 − 建築後経過年数 − 存続年数）。saturating 減算を
    `remainingYears usefulLife (elapsed + duration)` として表現する。 -/
def netBuildingYears (usefulLife elapsed duration : Nat) : Nat :=
  remainingYears usefulLife (elapsed + duration)

/-- 二号の数 = イ ÷ ロ。イ又はロが零なら零（原文「零以下である場合には、零」）。
    除算は Nat なので端数は切り捨て。 -/
def yearsRate (i ro : Nat) : Nat :=
  if i = 0 || ro = 0 then 0 else i / ro

-- ==== 第1項〜第4項の評価額 ====

/-- 第1項 — 配偶者居住権の価額 = 一号価額 − 一号価額 × 二号の数 × 三号の割合。
    Nat 減算は saturating（控除が時価を超えれば零）。 -/
def spouseResidenceValue (buildingValue : Money) (yrsRate : Nat) (ratio : Nat) : Money :=
  buildingValue - buildingValue * yrsRate * ratio

/-- 第1項を耐用年数・経過年数・存続年数・割合から組み立てたもの
    （イ・ロ → 二号の数 → 評価額）。 -/
def spouseResidenceValueFrom (buildingValue : Money) (usefulLife elapsed duration : Nat)
    (ratio : Nat) : Money :=
  spouseResidenceValue buildingValue
    (yearsRate (netBuildingYears usefulLife elapsed duration) (remainingYears usefulLife elapsed))
    ratio

/-- 第2項 — 建物の価額 = 時価 − 配偶者居住権の価額（saturating）。 -/
def residenceBuildingValue (marketValue residenceValue : Money) : Money :=
  marketValue - residenceValue

/-- 第3項 — 敷地使用権の価額 = 土地の時価 − 土地の時価 × 第一項第三号の割合（saturating）。 -/
def landUseRightValue (landValue : Money) (ratio : Nat) : Money :=
  landValue - landValue * ratio

/-- 第4項 — 土地の価額 = 土地の時価 − 第3項の権利の価額（saturating）。 -/
def landValueAfterUseRight (marketValue useRightValue : Money) : Money :=
  marketValue - useRightValue

-- ==== verified facts about the model (model consistency only) ====

theorem remainingYears_eq_zero_of_le {usefulLife elapsed : Nat} (h : usefulLife ≤ elapsed) :
    remainingYears usefulLife elapsed = 0 := by
  simp [remainingYears, h]

theorem remainingYears_eq_of_lt {usefulLife elapsed : Nat} (h : elapsed < usefulLife) :
    remainingYears usefulLife elapsed = usefulLife - elapsed := by
  simp [remainingYears, Nat.not_le_of_gt h]

theorem remainingYears_le (usefulLife elapsed : Nat) :
    remainingYears usefulLife elapsed ≤ usefulLife := by
  unfold remainingYears
  split
  · exact Nat.zero_le _
  · exact Nat.sub_le _ _

theorem remainingYears_pos {usefulLife elapsed : Nat} (h : elapsed < usefulLife) :
    0 < remainingYears usefulLife elapsed := by
  simp [remainingYears, Nat.not_le_of_gt h, Nat.sub_pos_of_lt h]

theorem netBuildingYears_eq (usefulLife elapsed duration : Nat) :
    netBuildingYears usefulLife elapsed duration = remainingYears usefulLife (elapsed + duration) := rfl

theorem yearsRate_eq_zero_of_i (ro : Nat) : yearsRate 0 ro = 0 := by
  simp [yearsRate]

theorem yearsRate_eq_zero_of_ro (i : Nat) : yearsRate i 0 = 0 := by
  simp [yearsRate]

theorem yearsRate_eq_div {i ro : Nat} (hi : 0 < i) (hro : 0 < ro) :
    yearsRate i ro = i / ro := by
  have hi0 : i ≠ 0 := Nat.ne_of_gt hi
  have hro0 : ro ≠ 0 := Nat.ne_of_gt hro
  simp [yearsRate, hi0, hro0]

theorem spouseResidenceValue_eq (b r q : Nat) :
    spouseResidenceValue b r q = b - b * r * q := rfl

theorem spouseResidenceValue_le_building (b r q : Nat) :
    spouseResidenceValue b r q ≤ b := by
  unfold spouseResidenceValue
  exact Nat.sub_le _ _

theorem spouseResidenceValue_eq_building_of_rate_zero (b q : Nat) :
    spouseResidenceValue b 0 q = b := by
  simp [spouseResidenceValue]

theorem spouseResidenceValue_eq_building_of_ratio_zero (b r : Nat) :
    spouseResidenceValue b r 0 = b := by
  simp [spouseResidenceValue]

theorem spouseResidenceValue_eq_zero_of_deduction_ge {b r q : Nat} (h : b ≤ b * r * q) :
    spouseResidenceValue b r q = 0 := by
  unfold spouseResidenceValue
  exact Nat.sub_eq_zero_of_le h

theorem spouseResidenceValue_pos {b r q : Nat} (_hb : 0 < b) (h : b * r * q < b) :
    0 < spouseResidenceValue b r q := by
  unfold spouseResidenceValue
  exact Nat.sub_pos_of_lt h

theorem residenceBuildingValue_le_market (m v : Nat) :
    residenceBuildingValue m v ≤ m := by
  unfold residenceBuildingValue
  exact Nat.sub_le _ _

theorem landUseRightValue_le_land (l q : Nat) :
    landUseRightValue l q ≤ l := by
  unfold landUseRightValue
  exact Nat.sub_le _ _

theorem landUseRightValue_eq_zero_of_ratio_ge_one {l q : Nat} (h : l ≤ l * q) :
    landUseRightValue l q = 0 := by
  unfold landUseRightValue
  exact Nat.sub_eq_zero_of_le h

theorem landValueAfterUseRight_le_market (m v : Nat) :
    landValueAfterUseRight m v ≤ m := by
  unfold landValueAfterUseRight
  exact Nat.sub_le _ _

-- ==== kernel-decided smoke checks ====

example : remainingYears 30 10 = 20 := by decide
example : remainingYears 10 30 = 0 := by decide   -- 零以下なら零
example : remainingYears 10 10 = 0 := by decide
example : remainingYears 0 0 = 0 := by decide
example : netBuildingYears 30 10 5 = 15 := by decide
example : netBuildingYears 10 30 5 = 0 := by decide
example : yearsRate 15 20 = 0 := by decide         -- 端数切り捨て
example : yearsRate 20 20 = 1 := by decide
example : yearsRate 0 20 = 0 := by decide          -- イが零
example : yearsRate 20 0 = 0 := by decide          -- ロが零
example : spouseResidenceValue 1000 1 1 = 0 := by decide   -- 控除 = 時価
example : spouseResidenceValue 1000 1 2 = 0 := by decide   -- 控除 > 時価 → saturating 零
example : spouseResidenceValue 1000 0 3 = 1000 := by decide -- 年数零
example : spouseResidenceValue 0 1 1 = 0 := by decide       -- 時価零
example : spouseResidenceValue 1000 1 0 = 1000 := by decide -- 割合零
example : spouseResidenceValueFrom 1000 30 10 5 1 = 1000 := by decide -- イ=15,ロ=20,数=0
example : residenceBuildingValue 1000 300 = 700 := by decide
example : residenceBuildingValue 300 1000 = 0 := by decide
example : landUseRightValue 1000 0 = 1000 := by decide
example : landUseRightValue 1000 1 = 0 := by decide
example : landUseRightValue 1000 2 = 0 := by decide
example : landValueAfterUseRight 1000 300 = 700 := by decide

end JapanTaxLaw.SpouseResidenceValuation
