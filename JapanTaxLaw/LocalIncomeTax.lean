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

end JapanTaxLaw
