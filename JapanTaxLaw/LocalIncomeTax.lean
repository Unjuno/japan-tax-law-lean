import JapanTaxLaw.TaxFinance

/-!
# LocalIncomeTax — 地方税法 道府県民税 art. 34(2)基礎控除・(1)十号配偶者控除・art. 35 所得割の税率 L4 スライス

Source (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 3DD29E0078BF24E09C79436CE7B0F00FD2CFB5A5BBCB97BD4F4352971BE68D53
  (data/raw/325AC0000000226_20261101_508AC0000000002.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Models 地方税法 道府県民税（第二章 第一節）の所得割に関する基礎的控除と税率:

* **art. 34(2) — 基礎控除**: 道府県は、前年の合計所得金額が二千五百万円以下である所得割の
  納税義務者については、その者の前年の所得について算定した総所得金額、退職所得金額又は
  山林所得金額から、次の各号に掲げる場合の区分に応じ、当該各号に定める金額を控除する:
  - 合計所得金額 二千四百万円以下 … **四十三万円**（art. 34(2) 一号）
  - 二千四百万円を超え 二千四百五十万円以下 … **二十九万円**（同 二号）
  - 二千四百五十万円を超え 二千五百万円以下 … **十五万円**（同 三号）
  - 二千五百万円超 … 控除なし（同 本文の除外）
* **art. 34(1) 十号 — 配偶者控除**（控除対象配偶者を有する納税義務者）:
  - 合計所得金額 九百万円以下 … 三十三万円（老人控除対象配偶者: 三十八万円）
  - 九百万円を超え 九百五十万円以下 … 二十二万円（老人控除対象配偶者: 二十六万円）
  - 九百五十万円を超え 千万円以下 … 十一万円（老人控除対象配偶者: 十三万円）
  - 千万円超 … 適用なし
* **art. 35 — 所得割の税率**: 所得割の額は、課税総所得金額、課税退職所得金額及び
  課税山林所得金額の合計額に、百分の四（指定都市（地方自治法252条の19(1)の市）の
  区域内に住所を有する場合は百分の二）の標準税率によつて定める率を乗じて得た金額とする。
  `localPrefecturalIncomeTaxAmount` はその固定率での計算を実装する。
  art. 35(2) の定義（課税総所得金額等＝控除後の前年の各所得金額）は呼出元に委ねる。

**スコープ外**:
* art. 34 (1) のその他の控除（雑損・医療費・社会保険料・小規模企業共済等掛金・生命保険料・
  地震保険料・障害者・寡婦・ひとり親・勤労学生・配偶者特別控除・扶養控除・特定親族特別控除）と
  (1) 八号の二 ひとり親控除等はモデル化しない。
* 配偶者特別控除（art. 34(1) 十号の二）・扶養控除・特定親族特別控除の段階表は
  モデル化しない。
* 老人控除対象配偶者（年齢七十歳以上）であるかどうかの判定は呼出元。
* 市町村民税（第六章）の同旨の規定、指定都市の加算・調整（art. 42, art. 314 以下）の
  適用関係の全体はモデル化しない。
* art. 35 の rounding: 法文は「乗じて得た金額とする」とだけ規定し、端数処理の方法を
  明示していない。本モジュールは TaxRate.applyFloor（切り捨て）で計算する —
  **modeling candidate**（固定率なので他の処理との一致は自明ではない）。
* 指定都市判定（地方自治法252条の19(1)）は externally established boolean。
* 所得割以外の均等割・所得割の還付・ art. 34 の控除の順序（art. 34(11) の「まず雑損控除額を
  控除し…」の順序規定）はモデル化しない。

Pinned evidence in doc-comments only; all theorems here only claim properties of the
model, never of the real legal semantics（誠実性の原則 — Pin ↔ 原文一致 is the trust
boundary; interpretation is not guaranteed)。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 34(2) の基礎控除額。合計所得金額（`totalIncome`）に応じた段階表。 -/
def basicDeduction (totalIncome : Money) : Money :=
  if totalIncome ≤ 24_000_000 then 430_000
  else if totalIncome ≤ 24_500_000 then 290_000
  else if totalIncome ≤ 25_000_000 then 150_000
  else 0

/-- art. 34(1) 十号の配偶者控除額。
    `spouseIsElderly` は老人控除対象配偶者（年齢七十歳以上）であるかどうかの呼出元判定。 -/
def spouseDeduction (totalIncome : Money) (spouseIsElderly : Bool) : Money :=
  if totalIncome ≤ 9_000_000 then (if spouseIsElderly then 380_000 else 330_000)
  else if totalIncome ≤ 9_500_000 then (if spouseIsElderly then 260_000 else 220_000)
  else if totalIncome ≤ 10_000_000 then (if spouseIsElderly then 130_000 else 110_000)
  else 0

/-- art. 35 の標準税率: 百分の四（指定都市区域内住所者は百分の二）. -/
def localPrefecturalStandardRate (livesInDesignatedCity : Bool) : TaxRate :=
  if livesInDesignatedCity then ⟨2, 100, by decide⟩ else ⟨4, 100, by decide⟩

/-- art. 35: 所得割の額 = (課税総所得金額 + 課税退職所得金額 + 課税山林所得金額)
    × 標準税率（切り捨て）。課税標準の定義（art. 35(2)）は呼出元責任。 -/
def localPrefecturalIncomeTaxAmount
    (taxableTotalIncome taxableRetirementIncome taxableForestIncome : Money)
    (livesInDesignatedCity : Bool) : Money :=
  (localPrefecturalStandardRate livesInDesignatedCity).applyFloor
    (taxableTotalIncome + taxableRetirementIncome + taxableForestIncome)

/-- art. 34(1)第六号 障害者控除額（各障害者につき二十六万円）。
    特別障害者である場合は三十万円。同一生計配偶者又は扶養親族が特別障害者で、
    かつ、当該納税義務者等との同居を常況としている者に該当する場合には、
    当該特別障害者に係る控除額は五十三万円とする（art. 34(3)）。
    `isDependentOrSpouse` / `isCohabiting` は externally established booleans。 -/
def disabilityDeduction (isSpecialDisabled isDependentOrSpouse isCohabiting : Bool) : Money :=
  if isSpecialDisabled && isDependentOrSpouse && isCohabiting then 530_000
  else if isSpecialDisabled then 300_000 else 260_000

/-- art. 34(1)第八号 寡婦控除額: 二十六万円。 -/
def widowDeduction : Money := 260_000

/-- art. 34(1)第八号の二 ひとり親控除額: 三十万円。 -/
def singleParentDeduction : Money := 300_000

/-- art. 34(1)第二号 医療費控除 — caller-supplied facts（前年の総所得金額・
    退職所得金額・山林所得金額の合計額と、保険金等で補塡される部分を控除した
    医療費支出額の合計額）。
    控除額（art. 34(1)イ）:
      支払医療費の合計額 − min(5% × 所得合計額, ¥100,000) の残額
      （その金額が ¥2,000,000 を超える場合には ¥2,000,000）
    閾値は min(5% × 所得合計額, ¥100,000)。 -/
structure MedicalDeductionFacts where
  /-- 前年の総所得金額・退職所得金額・山林所得金額の合計額。 -/
  totalGeneralIncome : Money
  /-- 前年中に支払つた医療費の合計額（保険金等で補塡される部分を除く）。 -/
  medicalExpensesPaid : Money
  deriving DecidableEq, Repr

/-- art. 34(1)第二号 の閾値（¥100,000 の下限）。 -/
def medicalThresholdFloor : Money := 100_000

/-- art. 34(1)第二号 の控除上限。 -/
def medicalDeductionCap : Money := 2_000_000

/-- art. 34(1)第二号 医療費控除額。 -/
def medicalExpenseDeduction (f : MedicalDeductionFacts) : Money :=
  min (if f.medicalExpensesPaid > min (f.totalGeneralIncome * 5 / 100) medicalThresholdFloor
    then f.medicalExpensesPaid - min (f.totalGeneralIncome * 5 / 100) medicalThresholdFloor else 0)
    medicalDeductionCap

-- ==== verified facts about the model (no performance of the law, only model consistency) ====

/-- 合計所得金額が 2,400万円ぴったりなら基礎控除は 430,000 円（art. 34(2) 一号の上限端）。 -/
theorem basicDeduction_24M_boundary : basicDeduction 24_000_000 = 430_000 := by decide
/-- 合計所得金額が 2,400万円を1円超えたら 290,000 円（同 二号）。 -/
theorem basicDeduction_just_over_24M : basicDeduction 24_000_001 = 290_000 := by decide
/-- 2,450万円ぴったりなら 290,000 円（同 二号の上限端）。 -/
theorem basicDeduction_2450_boundary : basicDeduction 24_500_000 = 290_000 := by decide
/-- 2,450万円を1円超えたら 150,000 円（同 三号）。 -/
theorem basicDeduction_just_over_2450 : basicDeduction 24_500_001 = 150_000 := by decide
/-- 2,500万円ぴったりなら 150,000 円（同 三号の上限端）。 -/
theorem basicDeduction_25M_boundary : basicDeduction 25_000_000 = 150_000 := by decide
/-- 2,500万円を1円超えたら控除なし（同 本文の除外）。 -/
theorem basicDeduction_over_25M : basicDeduction 25_000_001 = 0 := by decide

/-- 合計所得金額が 900万円ぴったりの配偶者控除は 330,000 円（老人: 380,000 円。art. 34(1) 十号 イ）。 -/
theorem spouseDeduction_9M : spouseDeduction 9_000_000 false = 330_000 := by decide
theorem spouseDeduction_9M_elderly : spouseDeduction 9_000_000 true = 380_000 := by decide
/-- 950万円ぴったりなら 220,000 円（老人: 260,000 円。同 ロ）。 -/
theorem spouseDeduction_95M : spouseDeduction 9_500_000 false = 220_000 := by decide
theorem spouseDeduction_95M_elderly : spouseDeduction 9_500_000 true = 260_000 := by decide
/-- 1,000万円ぴったりなら 110,000 円（老人: 130,000 円。同 ハ）。 -/
theorem spouseDeduction_10M : spouseDeduction 10_000_000 false = 110_000 := by decide
theorem spouseDeduction_10M_elderly : spouseDeduction 10_000_000 true = 130_000 := by decide
/-- 1,000万円を1円超えたら適用なし。 -/
theorem spouseDeduction_over_10M : spouseDeduction 10_000_001 false = 0 := by decide

/-- 基礎控除は単調非増加（所得が増えるほど控除は減る）。 -/
theorem basicDeduction_antitone {a b : Money} (h : a ≤ b) :
    basicDeduction b ≤ basicDeduction a := by
  unfold basicDeduction
  by_cases hb1 : b ≤ 24_000_000
  · have ha1 : a ≤ 24_000_000 := Nat.le_trans h hb1
    rw [ite_eq_left hb1, ite_eq_left ha1]
    decide
  · rw [ite_eq_right hb1]
    by_cases hb2 : b ≤ 24_500_000
    · rw [ite_eq_left hb2]
      by_cases ha1 : a ≤ 24_000_000
      · rw [ite_eq_left ha1]
        decide
      · rw [ite_eq_right ha1]
        by_cases ha2 : a ≤ 24_500_000
        · rw [ite_eq_left ha2]
          decide
        · exfalso
          have h24 : 24_500_000 < a := Nat.lt_of_not_le ha2
          have hlt : 24_500_000 < b := Nat.lt_of_lt_of_le h24 h
          exact absurd hlt (Nat.not_lt.mpr hb2)
    · rw [ite_eq_right hb2]
      by_cases hb3 : b ≤ 25_000_000
      · rw [ite_eq_left hb3]
        by_cases ha1 : a ≤ 24_000_000
        · rw [ite_eq_left ha1]
          decide
        · rw [ite_eq_right ha1]
          by_cases ha2 : a ≤ 24_500_000
          · rw [ite_eq_left ha2]
            decide
          · rw [ite_eq_right ha2]
            by_cases ha3 : a ≤ 25_000_000
            · rw [ite_eq_left ha3]
              decide
            · exfalso
              have h25 : 25_000_000 < a := Nat.lt_of_not_le ha3
              have hlt : 25_000_000 < b := Nat.lt_of_lt_of_le h25 h
              exact absurd hlt (Nat.not_lt.mpr hb3)
      · rw [ite_eq_right hb3]
        exact Nat.zero_le _

/-- art. 34(1)第十二号 の特定親族特別控除額（自己の自己と生計を一にする年齢十九歳以上二十三歳未満の親族で、
    控除対象扶養親族に該当しない者の前年の合計所得金額による帯域判定）。
    モデル満たすべき rule（e-Gov pinned raw bytes 逐語）:
      イ 前年の合計所得金額が九十五万円以下 → ¥450,000
      ロ 九十五万円を超え百十五万円以下 → 六十三万円 − F(x)
         F(x) = 「x のうち八十四万一円を超える部分の金額」に 2 を乗じた金額、
         十万円の整数倍 − 8万円 を下から拾う（y = F(x) が十万円の整数倍 − 8万円 でなければ、
         y に満たない最大の「十万円の整数倍の金額から八万円を控除した金額」）。
      ハ 百十五万円を超え百二十万円以下 → ¥60,000
      ニ 百二十万円を超える → ¥30,000
    x は当該特定親族の前年の合計所得金額（caller-established）。 -/
def specificDependentDeduction (totalIncome : Money) : Money :=
  if totalIncome ≤ 950_000 then 450_000
  else if totalIncome ≤ 1_150_000 then  -- ロ 帯域
    let y := 2 * (totalIncome - 841_000)
    let adjusted := y - ((y + 80_000) % 100_000)  -- y に満たない最大の 10万整数倍−8万
    630_000 - adjusted
  else if totalIncome ≤ 1_200_000 then 60_000
  else 30_000

-- ==== art. 34（第十二号）の性質の検証済み性質 ====

example : specificDependentDeduction 0 = 450_000 := by decide
example : specificDependentDeduction 950_000 = 450_000 := by decide
example : specificDependentDeduction 950_001 = 510_000 := by decide
example : specificDependentDeduction 1_000_000 = 410_000 := by decide
example : specificDependentDeduction 1_150_000 = 110_000 := by decide
example : specificDependentDeduction 1_150_001 = 60_000 := by decide
example : specificDependentDeduction 1_200_000 = 60_000 := by decide
example : specificDependentDeduction 1_200_001 = 30_000 := by decide

/-- 特定親族特別控除: "イ" 帯域 (x ≤ 950_000) は 450,000 円。 -/
theorem specificDependentDeduction_zero_below (x : Money) (h : x ≤ 950_000) :
    specificDependentDeduction x = 450_000 := by
  unfold specificDependentDeduction
  rw [ite_eq_left h]

/-- 特定親族特別控除: "ニ" 帯域 (x > 1_200_000) は 30,000 円。 -/
theorem specificDependentDeduction_gt_1200000 (x : Money) (h : x > 1_200_000) :
    specificDependentDeduction x = 30_000 := by
  unfold specificDependentDeduction
  rw [ite_eq_right (Nat.not_le_of_gt (Nat.lt_trans (by decide : 950_000 < 1_200_000) h))]
  rw [ite_eq_right (Nat.not_le_of_gt (Nat.lt_trans (by decide : 1_150_000 < 1_200_000) h))]
  rw [ite_eq_right (Nat.not_le_of_gt h)]

/-- art. 34(1)第九号 勤労学生控除額: 二十六万円（固定額）。
    所得税法第七十四条第二項等で別途所得制限（合計所得金額）等の適用があるが、
    ここでは控除額部分のみをモデル化し、所得制限可否は caller-established boolean で扱う。 -/
def workingStudentDeduction : Money := 260_000

/-- art. 34(1)第十一号 控除対象扶養親族（各控除対象扶養親族につき三十三万円）。
    その者が特定扶養親族（控除対象扶養親族のうち、年齢十九歳以上二十三歳未満の者をいう。
    第八項及び第三十七条において同じ。）である場合には四十五万円。
    その者が老人扶養親族（控除対象扶養親族のうち、年齢七十歳以上の者をいう。
    第四項及び第八項並びに第三十七条において同じ。）である場合には三十八万円。 -/
inductive DependentKind
  | regular
  | specifiedAllocated  -- 特定扶養親族（年齢 19〜22 歳未満）
  | elderly             -- 老人扶養親族（年齢 70 歳以上）
  deriving DecidableEq, Repr

def dependentDeduction (kind : DependentKind) : Money :=
  match kind with
  | DependentKind.regular => 330_000
  | DependentKind.specifiedAllocated => 450_000
  | DependentKind.elderly => 380_000

/-- art. 34(4): 所得割の納税義務者の有する老人扶養親族が当該納税義務者又は
    当該納税義務者の配偶者の直系尊属で、かつ、当該納税義務者又は当該配偶者の
    いずれかとの同居を常況としている者（第三十七条において「同居直系尊属」という。）
    である場合には、当該老人扶養親族に係る第一項第十一号の金額は、**四十五万円**とする。
    （平常の老人扶養親族 ¥380,000 を上書き。） -/
def coHabitingDirectAscendantElderlyDependentDeduction : Money := 450_000

/-- art. 34(4) による同居直系尊属の老人扶養親族控除額の上書き。 -/
def elderlyDependentDeductionWithCoHabitation (isCohabitingDirectAscendant : Bool) : Money :=
  if isCohabitingDirectAscendant then coHabitingDirectAscendantElderlyDependentDeduction
  else dependentDeduction DependentKind.elderly

theorem workingStudentDeduction_eq : workingStudentDeduction = 260_000 := rfl

theorem dependentDeduction_spec :
    dependentDeduction DependentKind.regular = 330_000 ∧
    dependentDeduction DependentKind.specifiedAllocated = 450_000 ∧
    dependentDeduction DependentKind.elderly = 380_000 := ⟨rfl, rfl, rfl⟩

theorem coHabitingDirectAscendantElderlyDependentDeduction_eq :
    coHabitingDirectAscendantElderlyDependentDeduction = 450_000 := rfl

theorem elderlyDependentDeductionWithCoHabitation_of_cohabiting :
    elderlyDependentDeductionWithCoHabitation true = 450_000 := rfl

theorem elderlyDependentDeductionWithCoHabitation_of_not_cohabiting :
    elderlyDependentDeductionWithCoHabitation false = 380_000 := rfl

/-- 同居直系尊属は平常の老人扶養親族 ¥380,000 より大きい。 -/
theorem coHabitingDirectAscendantElderlyDependent_ge_elderly :
    coHabitingDirectAscendantElderlyDependentDeduction ≥ dependentDeduction DependentKind.elderly := by
  decide

example : workingStudentDeduction = 260_000 := by decide
example : dependentDeduction DependentKind.regular = 330_000 := by decide
example : dependentDeduction DependentKind.specifiedAllocated = 450_000 := by decide
example : dependentDeduction DependentKind.elderly = 380_000 := by decide
example : elderlyDependentDeductionWithCoHabitation true = 450_000 := by decide
example : elderlyDependentDeductionWithCoHabitation false = 380_000 := by decide

-- ==== art. 34 の新規控除項目の検証済み性質 ====

/-- min monotony helper. -/
theorem min_le_min_of_le {a b : Nat} (h : a ≤ b) (c : Nat) : min a c ≤ min b c := by
  by_cases hb : b ≤ c
  · rw [Nat.min_eq_left hb]
    exact Nat.le_trans (Nat.min_le_left a c) h
  · rw [Nat.min_eq_right (Nat.le_of_not_le hb)]
    exact Nat.min_le_right a c


example : disabilityDeduction false false false = 260_000 := by decide
example : disabilityDeduction true false false = 300_000 := by decide
example : disabilityDeduction true true false = 300_000 := by decide
example : disabilityDeduction true true true = 530_000 := by decide
example : disabilityDeduction false true true = 260_000 := by decide

theorem disabilityDeduction_special (isDep isCob : Bool) :
    disabilityDeduction true isDep isCob = if isDep && isCob then 530_000 else 300_000 := by
  cases isDep <;> cases isCob <;> decide

theorem disabilityDeduction_regular (isDep isCob : Bool) :
    disabilityDeduction false isDep isCob = 260_000 := rfl

theorem widowDeduction_eq : widowDeduction = 260_000 := rfl
theorem singleParentDeduction_eq : singleParentDeduction = 300_000 := rfl

example : medicalExpenseDeduction ⟨100_000_000, 300_000⟩ = 200_000 := by decide
example : medicalExpenseDeduction ⟨100_000_000, 0⟩ = 0 := by decide
example : medicalExpenseDeduction ⟨100_000_000, 1_000_000⟩ = 900_000 := by decide
example : medicalExpenseDeduction ⟨1_000_000, 90_000⟩ = 40_000 := by decide
example : medicalExpenseDeduction ⟨1_000_000, 60_000⟩ = 10_000 := by decide
example : medicalExpenseDeduction ⟨1_000_000, 100_000_000⟩ = 2_000_000 := by decide

/-- 医療費控除は上限 ¥2,000,000 を超えない。 -/
theorem medicalExpenseDeduction_le_cap (f : MedicalDeductionFacts) :
    medicalExpenseDeduction f ≤ medicalDeductionCap := by
  unfold medicalExpenseDeduction
  exact Nat.min_le_right _ _

/-- 医療費控除は支出力に対して単調非減少。 -/
theorem medicalExpenseDeduction_mono {a b : MedicalDeductionFacts}
    (h : a.medicalExpensesPaid ≤ b.medicalExpensesPaid) (h2 : a.totalGeneralIncome = b.totalGeneralIncome) :
    medicalExpenseDeduction a ≤ medicalExpenseDeduction b := by
  unfold medicalExpenseDeduction
  rw [h2]
  by_cases hb : b.medicalExpensesPaid > min (b.totalGeneralIncome * 5 / 100) medicalThresholdFloor
  · rw [ite_eq_left hb]
    by_cases ha : a.medicalExpensesPaid > min (b.totalGeneralIncome * 5 / 100) medicalThresholdFloor
    · rw [ite_eq_left ha]
      exact min_le_min_of_le (Nat.sub_le_sub_right h _) _
    · rw [ite_eq_right ha]
      exact Nat.zero_le _
  · rw [ite_eq_right hb]
    by_cases ha2 : a.medicalExpensesPaid > min (b.totalGeneralIncome * 5 / 100) medicalThresholdFloor
    · exact absurd ha2 (fun hh => Nat.not_le_of_lt hh (Nat.le_trans h (Nat.le_of_not_lt hb)))
    · rw [ite_eq_right ha2]
      exact Nat.zero_le _

end JapanTaxLaw
