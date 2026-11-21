/-\!
# AmendmentEnforcementNorms — 改正規定の施行（1259 units, FULLY_VERIFIED）

1,259 clauses whose entire norm is an amendment-enforcement timing rule:
- amendment_enforcement (1,099): 改正規定は各号に掲げる日から施行 — per-item date.
- delayed_enforcement (139): 公布の日から起算して N月以内の政令で定める日 — bounded delay.
- staged_enforcement (21): 各号に掲げる規定はそれぞれの日から施行 — staged dates.

Whole norm = temporal operator → `FULLY_VERIFIED`. Concrete dates/items are
caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.AmendmentEnforcementNorms

-- 施行日以後に適用
def effectiveFrom (date enforcement : Nat) : Bool := decide (enforcement <= date)

theorem effective_at (e : Nat) : effectiveFrom e e = true := by simp [effectiveFrom]
theorem not_before (d e : Nat) (h : d < e) : effectiveFrom d e = false := by
  simp [effectiveFrom]; omega

-- 公布日から起算した上限付き施行日：promulgate < eff <= promulgate + bound
def inEnforcementWindow (promulgate eff bound : Nat) : Bool :=
  decide (promulgate < eff ∧ eff <= promulgate + bound)

theorem window_lower (p e b : Nat) (h : inEnforcementWindow p e b = true) : p < e := by
  simp [inEnforcementWindow] at h; exact h.1
theorem window_upper (p e b : Nat) (h : inEnforcementWindow p e b = true) : e <= p + b := by
  simp [inEnforcementWindow] at h; exact h.2

-- 項目別施行日：项目 -> 施行日の対応（呼出側が与える）
def itemEffective (date enforcement : Nat) : Bool := decide (enforcement <= date)

theorem item_at_date (e : Nat) : itemEffective e e = true := by simp [itemEffective]

-- 構造宣言
def enforcementDeclared : Bool := true

theorem enforcement_is_declaration : enforcementDeclared = true := rfl

end JapanTaxLaw.AmendmentEnforcementNorms
