import JapanTaxLaw.StatutoryBands

/-!
# StatutoryBandsSpec — 独立仕様（別の数値・別の構造）

The implementation writes art.28 rates as `30/100, 20/100, 10/100`.
This independent spec writes them in **reduced** form `3/10, 2/10, 1/10`, and
indexes the bands through an explicit tier table instead of a nested `if`.
Art.86 amounts are transcribed in 万円 units (`58*10000`, ...) instead of
full yen numerals. Universal theorems prove agreement for ALL inputs.

Not legal advice: eligibility conditions and the art.28 paragraph-3 別表第五
override are caller-established and deliberately outside this scope.
-/

namespace JapanTaxLaw.StatutoryBands

-- 30/100 = 3/10 — 全称（変数 x に対する Nat 除法の同一性）。
theorem pct30 (x : Nat) : x * 30 / 100 = x * 3 / 10 := by
  rw [show x * 30 = (x * 3) * 10 by omega]
  rw [show 100 = 10 * 10 by decide]
  exact Nat.mul_div_mul_right (x * 3) 10 (by decide)

theorem pct20 (x : Nat) : x * 20 / 100 = x * 2 / 10 := by
  rw [show x * 20 = (x * 2) * 10 by omega]
  rw [show 100 = 10 * 10 by decide]
  exact Nat.mul_div_mul_right (x * 2) 10 (by decide)

theorem pct10 (x : Nat) : x * 10 / 100 = x / 10 := by
  rw [show x * 10 = x * 10 by rfl]
  rw [show 100 = 10 * 10 by decide]
  exact Nat.mul_div_mul_right x 10 (by decide)

-- 独立仕様: 段階を表で索引し、率を約分して表現する。
def salaryTier (income : Nat) : Nat :=
  if income ≤ 1_900_000 then 0
  else if income ≤ 3_600_000 then 1
  else if income ≤ 6_600_000 then 2
  else if income ≤ 8_500_000 then 3
  else 4

def salaryTierBase (t : Nat) : Nat :=
  match t with
  | 0 => 650_000
  | 1 => 650_000
  | 2 => 1_160_000
  | 3 => 1_760_000
  | _ => 1_950_000

def salaryTierFloor (t : Nat) : Nat :=
  match t with
  | 0 => 0
  | 1 => 1_900_000
  | 2 => 3_600_000
  | 3 => 6_600_000
  | _ => 8_500_000

-- 率を「10分のいくら」で保持（implement 側の 100 分率と別表記）。
def salaryTierRate10 (t : Nat) : Nat :=
  match t with
  | 1 => 3
  | 2 => 2
  | 3 => 1
  | _ => 0

def specSalaryDeduction (income : Nat) : Nat :=
  let t := salaryTier income
  salaryTierBase t + (income - salaryTierFloor t) * salaryTierRate10 t / 10

/-- 実装 ≡ 独立仕様（第28条、全称）。 -/
theorem agreeSalary (income : Nat) :
    salaryDeduction income = specSalaryDeduction income := by
  unfold salaryDeduction specSalaryDeduction salaryTier
    salaryTierBase salaryTierFloor salaryTierRate10
  by_cases h1 : income ≤ 1_900_000
  · simp [h1]
  · by_cases h2 : income ≤ 3_600_000
    · simp [h1, h2, pct30]
    · by_cases h3 : income ≤ 6_600_000
      · simp [h1, h2, h3, pct20]
      · by_cases h4 : income ≤ 8_500_000
        · simp [h1, h2, h3, h4, pct10]
        · simp [h1, h2, h3, h4]

-- 独立仕様: 基礎控除を万円単位の表で表現（implement 側は円固体値）。
def basicTier (income : Nat) : Nat :=
  if income ≤ 23_500_000 then 0
  else if income ≤ 24_000_000 then 1
  else if income ≤ 24_500_000 then 2
  else if income ≤ 25_000_000 then 3
  else 4

def basicTierMan (t : Nat) : Nat :=
  match t with
  | 0 => 58
  | 1 => 48
  | 2 => 32
  | 3 => 16
  | _ => 0

def specBasicDeduction (income : Nat) : Nat :=
  basicTierMan (basicTier income) * 10_000

/-- 実装 ≡ 独立仕様（第86条、全称）。 -/
theorem agreeBasic (income : Nat) :
    basicDeduction income = specBasicDeduction income := by
  unfold basicDeduction specBasicDeduction basicTier basicTierMan
  by_cases h1 : income ≤ 23_500_000
  · simp [h1]
  · by_cases h2 : income ≤ 24_000_000
    · simp [h1, h2]
    · by_cases h3 : income ≤ 24_500_000
      · simp [h1, h2, h3]
      · by_cases h4 : income ≤ 25_000_000
        · simp [h1, h2, h3, h4]
        · simp [h1, h2, h3, h4]

end JapanTaxLaw.StatutoryBands
