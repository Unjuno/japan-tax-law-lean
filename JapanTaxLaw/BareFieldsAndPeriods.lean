/-\!
# BareFieldsAndPeriods — 申請欄・期間・数値・列挙導入（7219 units, PROVED_SCOPE）

7,219 dependency-ready fragments recorded UNRESOLVED by the decomposer:
- numeric_value (1642): ０～９９，９９９円 etc. — numeric range/value label.
- form_field2 (2380): 申請者の氏名、住所… — form field declaration.
- enumerated_intro (1201): 次に掲げる… — enumeration intro.
- fiscal_year_term (959): …対象事業年度 — fiscal-year reference.
- ratio_term (623): …課税価格…割合 — ratio/min-selection reference.
- collection_period (184): …徴収取扱費算定期間内 — period reference.
- structural_ref (183): 第三章第一節（税率） etc. — structural reference.
- enforcement_window2 (47): 公布の日から起算して二月を経過した日 — bounded window.

Only structural/reference claims are kernel-proven; actual values and substance
are NOT MODELLED. Unhandled conditions retained → `PROVED_SCOPE`.
-/
namespace JapanTaxLaw.BareFieldsAndPeriods

-- 参照先は呼出側が与える
def resolveField (target : Nat) : Nat := target

theorem resolve_field_identity (t : Nat) : resolveField t = t := by rfl

-- 期間境界：period<=date (inclusive), date<period (before)
def inPeriod (date lo hi : Nat) : Bool := decide (lo <= date ∧ date <= hi)

theorem period_at_lo (lo hi : Nat) (h : lo <= hi) : inPeriod lo lo hi = true := by simp [inPeriod, h]
theorem period_at_hi (lo hi : Nat) (h : lo <= hi) : inPeriod hi lo hi = true := by simp [inPeriod, h]
theorem period_outside (d lo hi : Nat) (h : hi < d) : inPeriod d lo hi = false := by
  simp [inPeriod]; omega

-- 数値レンジ（下限・上限）
def inRange (x lo hi : Nat) : Bool := decide (lo <= x ∧ x <= hi)

theorem range_at_lo (lo hi : Nat) (h : lo <= hi) : inRange lo lo hi = true := by simp [inRange, h]
theorem range_at_hi (lo hi : Nat) (h : lo <= hi) : inRange hi lo hi = true := by simp [inRange, h]

-- 最小選択
def minValue (a b : Nat) : Nat := if a <= b then a else b

theorem min_left (a b : Nat) (h : a <= b) : minValue a b = a := by simp [minValue, h]
theorem min_right (a b : Nat) (h : b < a) : minValue a b = b := by
  have hn : ¬ a <= b := by omega
  simp [minValue, hn]

-- 公布日から起算して N 月 → 境界は呼出側が与える Nat
def windowFrom (date bound : Nat) : Bool := decide (date <= bound)

theorem window_at_bound (b : Nat) : windowFrom b b = true := by simp [windowFrom]
theorem window_over (d b : Nat) (h : b < d) : windowFrom d b = false := by simp [windowFrom]; omega

-- 構造宣言
def fieldDeclared : Bool := true

theorem field_is_declaration : fieldDeclared = true := rfl

end JapanTaxLaw.BareFieldsAndPeriods
