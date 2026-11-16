import JapanTaxLaw.TaxFinance

/-!
# SpouseSpecialDeduction — 地方税法 art. 34(1)第十号の二（配偶者特別控除）L4 モデル

Sources (pinned):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 3DD29E0078BF24E09C79436CE7B0F00FD2CFB5A5BBCB97BD4F4352971BE68D53
  (data/raw/325AC0000000226_20261101_508AC0000000002.law.json,
   revision CurrentEnforced per data/INVENTORY.json;
   same pin as LocalIncomeTax.lean)

Models art. 34(1)第十号の二 — pinned bytes 逐語:

  「十号の二自己と生計を一にする配偶者（第三十二条第三項に規定する青色事業専従者に該当するもので
    同項に規定する給与の支払を受けるもの及び同条第四項に規定する事業専従者に該当するものを除き、
    前年の合計所得金額が百三十三万円以下であるものに限る。）で控除対象配偶者に該当しないものを
    有する所得割の納税義務者（その配偶者が前号又はこの号に規定する所得割の納税義務者として
    これらの規定の適用を受けているものを除き、前年の合計所得金額が千万円以下であるものに限る。）
    次に掲げる場合の区分に応じ、それぞれ次に定める金額
    イ当該納税義務者の前年の合計所得金額が九百万円以下である場合
      当該配偶者の次に掲げる区分に応じ、それぞれ次に定める金額
      （１）前年の合計所得金額が百万円以下である配偶者三十三万円
      （２）前年の合計所得金額が百万円を超え百三十万円以下である配偶者
            三十八万円から当該配偶者の前年の合計所得金額のうち九十三万一円を超える部分の金額
            （当該超える部分の金額が五万円の整数倍の金額から三万円を控除した金額でないときは、
             五万円の整数倍の金額から三万円を控除した金額で当該超える部分の金額に満たないものの
             うち最も多い金額とする。）を控除した金額
      （３）前年の合計所得金額が百三十万円を超える配偶者三万円
    ロ当該納税義務者の前年の合計所得金額が九百万円を超え九百五十万円以下である場合
      当該配偶者のイ（１）から（３）までに掲げる区分に応じ、それぞれイ（１）から（３）までに定める金額の
      三分の二に相当する金額（当該金額に一万円未満の端数がある場合には、これを切り上げた金額）
    ハ当該納税義務者の前年の合計所得金額が九百五十万円を超え千万円以下である場合
      当該配偶者のイ（１）から（３）までに掲げる区分に応じ、それぞれイ（１）から（３）までに定める金額の
      三分の一に相当する金額（当該金額に一万円未満の端数がある場合には、これを切り上げた金額）」

Computation:

  base = spouseTotalIncome ≤ ¥1,000,000 ? ¥330,000
       | spouseTotalIncome ≤ ¥1,300,000 ? ¥380,000 − taper(s − 931,000)
       | otherwise ¥30,000
  where taper(e) = k × ¥50,000 − ¥30,000 with k = ⌊(e + 30,000) / 50,000⌋ (i.e. the largest
        qualifying figure not exceeding e; k = 0 ⇒ taper = 0)
  — then:
    tp income ≤ ¥9,000,000         → base
    ¥9,000,000 < tp ≤ ¥9,500,000   → roundUp¥10,000 (base × 2 / 3)
    ¥9,500,000 < tp ≤ ¥10,000,000  → roundUp¥10,000 (base × 1 / 3)
    tp > ¥10,000,000               → ineligible

Scope & honest boundaries:

* "控除対象配偶者に該当しない" 性質（spouse income > ¥950,000 or otherwise not 控除対象配偶者）は
  caller-established boolean（`isExcludedFromOrdinarySpouseDeduction`）— art. 34(1）第十号（配偶者控除）の射程
* 青色事業専従者／事業専従者除外・他納税義務者での前号適用 — caller-established
* art. 34(1）第十一号（控除順序）— 非モデル化
* 納税義務者本人が千万超の場合の除外 — モデル内で計算（checkable）

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 34(1)第十号の二 — 「当該超える部分の金額」を ¥50,000 の整数倍から ¥30,000 を控除した金額に
    切り捨てた金額を求める（Pin ¥931,000 超過部分の taper）。 -/
def taperFrom931k (excess : Money) : Money :=
  let k := (excess + 30_000) / 50_000
  if k = 0 then 0 else k * 50_000 - 30_000

/-- 「当該配偶者の次に掲げる区分に応じ、それぞれ次に定める金額」— base ladder, before the
    taxpayer-income modifier. -/
def spouseSpecialDeductionBase (spouseTotalIncome : Money) : Money :=
  if spouseTotalIncome ≤ 1_000_000 then 330_000
  else if spouseTotalIncome ≤ 1_300_000 then
    380_000 - taperFrom931k (spouseTotalIncome - 931_000)
  else 30_000

/-- ¥10,000 単位での切り上げ（ロ・ハ の三分の二／三分の一 計算に使う端数規則）。 -/
def roundUpToTenThousand (n : Money) : Money := (n + 9_999) / 10_000 * 10_000

/-- art. 34(1)第十号の二 適用条件を externally established booleans / Money で表す。 -/
structure SpouseSpecialDeductionFacts where
  /-- 当該納税義務者の前年の合計所得金額。 -/
  taxpayerTotalIncome : Money
  /-- 配偶者の前年の合計所得金額。 -/
  spouseTotalIncome : Money
  /-- 控除対象配偶者（art. 34(1）第十号）に該当しないか — caller-established。 -/
  isNotQualifyingSpouse : Bool
  /-- 青色事業専従者給与支払対象者への除外・双方向での適用等の除外（柱書括弧書き）— caller-established。 -/
  ineligibleByStatute : Bool
  deriving DecidableEq, Repr

/-- art. 34(1)第十号の二 配偶者特別控除額。 -/
def spouseSpecialDeduction (f : SpouseSpecialDeductionFacts) : Money :=
  if f.ineligibleByStatute then 0
  else if !f.isNotQualifyingSpouse then 0
  else if f.spouseTotalIncome > 1_330_000 then 0
  else if f.taxpayerTotalIncome > 10_000_000 then 0
  else
    let base := spouseSpecialDeductionBase f.spouseTotalIncome
    if f.taxpayerTotalIncome ≤ 9_000_000 then base
    else if f.taxpayerTotalIncome ≤ 9_500_000 then roundUpToTenThousand (base * 2 / 3)
    else roundUpToTenThousand (base / 3)

-- ==== verified facts ====

/-- taper は ¥50,000 の整数倍から ¥30,000 を控除した形。 -/
theorem taperFrom931k_nonneg (e : Money) : 0 ≤ taperFrom931k e := Nat.zero_le _

/-- base は ¥380,000 を超えない（（１）の ¥330,000、（２）の ¥380,000 − taper、（３）の ¥30,000）。 -/
theorem spouseSpecialDeductionBase_le_380000 (s : Money) :
    spouseSpecialDeductionBase s ≤ 380_000 := by
  unfold spouseSpecialDeductionBase
  by_cases h1 : s ≤ 1_000_000
  · rw [ite_eq_left h1]; decide
  · rw [ite_eq_right h1]
    by_cases h2 : s ≤ 1_300_000
    · rw [ite_eq_left h2]; exact Nat.sub_le _ _
    · rw [ite_eq_right h2]; decide

/-- ロ・ハ の切り上げの単調性（大小関係の保存）。 -/
theorem roundUpToTenThousand_mono (a b : Money) (h : a ≤ b) :
    roundUpToTenThousand a ≤ roundUpToTenThousand b :=
  Nat.mul_le_mul_right 10_000 (Nat.div_le_div_right (Nat.add_le_add_right h 9_999))

/-- art. 34(1)第十号の二 の控除額は、適格の場合に限り ¥380,000 を超えない。 -/
theorem spouseSpecialDeduction_le_380000 (f : SpouseSpecialDeductionFacts)
    (_hnotInel : f.ineligibleByStatute = false)
    (_hnotQual : (f.isNotQualifyingSpouse) = true)
    (_hspouse : f.spouseTotalIncome ≤ 1_330_000)
    (_htp : f.taxpayerTotalIncome ≤ 10_000_000) :
    spouseSpecialDeduction f ≤ 380_000 := by
  unfold spouseSpecialDeduction
  generalize hbase : spouseSpecialDeductionBase f.spouseTotalIncome = base
  by_cases h1 : f.ineligibleByStatute = true
  · rw [ite_eq_left h1]; decide
  · rw [ite_eq_right h1]
    by_cases h2 : (!f.isNotQualifyingSpouse) = true
    · rw [ite_eq_left h2]; decide
    · rw [ite_eq_right h2]
      by_cases h3 : f.spouseTotalIncome > 1_330_000
      · rw [ite_eq_left h3]; decide
      · rw [ite_eq_right h3]
        by_cases h4 : f.taxpayerTotalIncome > 10_000_000
        · rw [ite_eq_left h4]; decide
        · rw [ite_eq_right h4]
          by_cases h5 : f.taxpayerTotalIncome ≤ 9_000_000
          · rw [ite_eq_left h5]
            exact hbase ▸ spouseSpecialDeductionBase_le_380000 f.spouseTotalIncome
          · rw [ite_eq_right h5]
            by_cases h6 : f.taxpayerTotalIncome ≤ 9_500_000
            · rw [ite_eq_left h6]
              have hb : base ≤ 380_000 := hbase ▸ spouseSpecialDeductionBase_le_380000 f.spouseTotalIncome
              have h23 : base * 2 / 3 ≤ 253_333 :=
                Nat.le_trans (Nat.div_le_div_right (Nat.mul_le_mul_right 2 hb)) (by decide)
              have hup := roundUpToTenThousand_mono _ 253_333 h23
              have hle : roundUpToTenThousand 253_333 ≤ 380_000 := by decide
              exact Nat.le_trans hup hle
            · rw [ite_eq_right h6]
              have hb : base ≤ 380_000 := hbase ▸ spouseSpecialDeductionBase_le_380000 f.spouseTotalIncome
              have h13 : base / 3 ≤ 126_666 :=
                Nat.le_trans (Nat.div_le_div_right hb) (by decide)
              have hup := roundUpToTenThousand_mono _ 126_666 h13
              have hle : roundUpToTenThousand 126_666 ≤ 380_000 := by decide
              exact Nat.le_trans hup hle

-- ==== kernel-decided smoke checks ====

-- （１）: spouse ≤ ¥1,000,000、tp ≤ ¥9,000,000 → ¥330,000
example : spouseSpecialDeduction ⟨0, 500_000, true, false⟩ = 330_000 := by decide
example : spouseSpecialDeduction ⟨9_000_000, 950_000, true, false⟩ = 330_000 := by decide
-- （２）: spouse ¥1,000,001、tp ≤ ¥9,000,000 → ¥380,000 − ¥20,000 = ¥360,000
example : spouseSpecialDeduction ⟨9_000_000, 1_000_001, true, false⟩ = 360_000 := by decide
example : spouseSpecialDeduction ⟨9_000_000, 1_050_000, true, false⟩ = 310_000 := by decide
example : spouseSpecialDeduction ⟨9_000_000, 1_100_000, true, false⟩ = 260_000 := by decide
example : spouseSpecialDeduction ⟨9_000_000, 1_200_000, true, false⟩ = 160_000 := by decide
example : spouseSpecialDeduction ⟨9_000_000, 1_300_000, true, false⟩ = 60_000 := by decide
-- （３）: spouse > ¥1,300,000 → ¥30,000
example : spouseSpecialDeduction ⟨9_000_000, 1_300_001, true, false⟩ = 30_000 := by decide
example : spouseSpecialDeduction ⟨9_000_000, 1_330_000, true, false⟩ = 30_000 := by decide
-- spouse cap: 百三十三万円超 → 0
example : spouseSpecialDeduction ⟨9_000_000, 1_330_001, true, false⟩ = 0 := by decide
-- ロ: tp 9,000,001〜9,500,000 → base × 2/3 roundUp10,000
example : spouseSpecialDeduction ⟨9_250_000, 500_000, true, false⟩ = 220_000 := by decide
  -- 330,000 * 2 / 3 = 220,000 (already a multiple of 10,000)
example : spouseSpecialDeduction ⟨9_250_000, 1_000_001, true, false⟩ = 240_000 := by decide
  -- 360,000 * 2 / 3 = 240,000
-- ハ: tp 9,500,001〜10,000,000 → base × 1/3 roundUp10,000
example : spouseSpecialDeduction ⟨9_750_000, 500_000, true, false⟩ = 110_000 := by decide
  -- 330,000 / 3 = 110,000 → 110,000 (already a multiple of ¥10,000)
example : spouseSpecialDeduction ⟨9_750_000, 1_000_001, true, false⟩ = 120_000 := by decide
  -- 360,000 / 3 = 120,000 → roundUp10,000(120,000) = 120,000
example : spouseSpecialDeduction ⟨9_750_000, 1_100_000, true, false⟩ = 90_000 := by decide
-- tp > ¥10,000,000 → 0 (eligibility)
example : spouseSpecialDeduction ⟨10_000_001, 500_000, true, false⟩ = 0 := by decide
-- ineligibility flags
example : spouseSpecialDeduction ⟨0, 500_000, false, false⟩ = 0 := by decide
example : spouseSpecialDeduction ⟨0, 500_000, true, true⟩ = 0 := by decide
-- round-up cases
example : roundUpToTenThousand 330_000 = 330_000 := by decide
example : roundUpToTenThousand 90_001 = 100_000 := by decide
example : roundUpToTenThousand 110_000 = 110_000 := by decide

end JapanTaxLaw
