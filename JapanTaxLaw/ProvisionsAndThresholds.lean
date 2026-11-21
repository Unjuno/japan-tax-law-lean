/-\!
# ProvisionsAndThresholds — 読替・施行参照・割合・重量閾値（1421 units）

1,421 dependency-ready units in eight repeated §3 families. All concrete texts,
dates, percentages, weights and targets are caller-supplied; only structure is
kernel-proven.

1. reading_sub (667): 「A」とあるのは「B」とする / ただし書の規定を準用する.
2. ratio_range (324): 百分の五十/四十、四分の一以上二分の一未満 etc.
3. next_provision (191): …適用については、次に定めるところによる.
4. enforcement_ref (155): 公布の日の翌日 / 他法の施行の日から施行する.
5. mutual_person (31): 納税管理人を変更する場合も同様とする.
6. weight_05 (26): 車両重量が〇・五トン以下/超.
7. trans_deleg (14): 他法及びこの法律の施行に関し必要な経過措置は政令で定める.
8. jurisdiction (13): 道府県の区域外においても行うことができる.
-/
namespace JapanTaxLaw.ProvisionsAndThresholds

-- 1) 読替・準用
def substituteText (old new x : Nat) : Nat := if x == old then new else x

theorem substitute_matched (old new : Nat) : substituteText old new old = new := by simp [substituteText]

theorem substitute_unaffected (x old new : Nat) (h : x ≠ old) : substituteText old new x = x := by
  simp [substituteText, h]

def applyAnalogously (target : Nat) : Nat := target

theorem analogous_identity (t : Nat) : applyAnalogously t = t := by rfl

-- 2) 割合の閾値
def percentAtLeast (p threshold : Nat) : Bool := decide (threshold <= p)

def percentBelow (p threshold : Nat) : Bool := decide (p < threshold)

theorem percent_boundary (t : Nat) : percentAtLeast t t = true := by simp [percentAtLeast]
theorem percent_below_boundary (t : Nat) : percentBelow t t = false := by simp [percentBelow]
theorem percent_exclusive (p t : Nat) : ¬ (percentAtLeast p t = true ∧ percentBelow p t = true) := by
  unfold percentAtLeast percentBelow
  by_cases h : t <= p
  · have h2 : ¬ p < t := by omega
    simp [h, h2]
  · have h2 : p < t := by omega
    simp [h, h2]

-- 3) 次に定めるところによる（構造接続詞）
def followingProvisions (target : Nat) : Nat := target

theorem following_identity (t : Nat) : followingProvisions t = t := by rfl

-- 4) 施行参照：trigger <= date
def effectiveFrom (date trigger : Nat) : Bool := decide (trigger <= date)

theorem effective_at (t : Nat) : effectiveFrom t t = true := by simp [effectiveFrom]

theorem effective_after (d t : Nat) (h : t <= d) : effectiveFrom d t = true := by simp [effectiveFrom, h]

-- 5) 同様とする（並列適用）
def parallelApplication (target : Nat) : Nat := target

theorem parallel_identity (t : Nat) : parallelApplication t = t := by rfl

-- 6) 重量閾値 0.5トン = 500kg
def halfTon : Nat := 500

def underHalfTon (w : Nat) : Bool := decide (w <= halfTon)

def overHalfTon (w : Nat) : Bool := decide (halfTon < w)

theorem half_ton_complement (w : Nat) : underHalfTon w = true ↔ overHalfTon w = false := by
  unfold underHalfTon overHalfTon halfTon
  by_cases h : w <= 500
  · have h2 : ¬ 500 < w := by omega
    simp [h, h2]
  · have h2 : 500 < w := by omega
    simp [h, h2]

-- 7) 経過措置の委任
def delegatedTransitional2 (content : Nat) : Nat := content

theorem transitional_identity (c : Nat) : delegatedTransitional2 c = c := by rfl

-- 8) 区域外の執行
def extraterritorialExecution : Bool := true

theorem execution_outside_declared : extraterritorialExecution = true := rfl

end JapanTaxLaw.ProvisionsAndThresholds
