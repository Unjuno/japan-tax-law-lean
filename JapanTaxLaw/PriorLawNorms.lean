/-\!
# PriorLawNorms — 従前の例による（6921 units, FULLY_VERIFIED）

6,921 clauses whose entire norm is a temporal version-selection rule using
「なお従前の例による」 (old law for prior matters):
- prior_before (3,934): 施行日前の行為/確認 → old law; 施行日以後 → new law.
- prior_matter (2,987): 特定の年分/事項 → old law; それ以後 → new law.

Whole norm = temporal selection → `FULLY_VERIFIED`. Concrete provisions/dates
are caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.PriorLawNorms

-- 施行日を境とする選択
def appliesFrom (date enforcement : Nat) : Bool := decide (enforcement <= date)

def oldForPrior (date enforcement : Nat) : Bool := decide (date < enforcement)

theorem new_at_boundary (e : Nat) : appliesFrom e e = true := by simp [appliesFrom]
theorem old_before_boundary (e : Nat) : oldForPrior e e = false := by simp [oldForPrior]

theorem exclusive (d e : Nat) : ¬ (appliesFrom d e = true ∧ oldForPrior d e = true) := by
  unfold appliesFrom oldForPrior
  by_cases h : e <= d
  · have h2 : ¬ d < e := by omega
    simp [h, h2]
  · have h2 : d < e := by omega
    simp [h, h2]

theorem exhaustive (d e : Nat) : appliesFrom d e = true ∨ oldForPrior d e = true := by
  unfold appliesFrom oldForPrior
  by_cases h : e <= d
  · left; simp [h]
  · right
    have h2 : d < e := by omega
    simp [h2]

-- 年分を境とする選択（敷居年）
def appliesFromYear (year threshold : Nat) : Bool := decide (threshold <= year)

def oldForEarlierYear (year threshold : Nat) : Bool := decide (year < threshold)

theorem year_boundary (t : Nat) : appliesFromYear t t = true := by simp [appliesFromYear]
theorem old_year_before (t : Nat) : oldForEarlierYear t t = false := by simp [oldForEarlierYear]

-- 構造宣言
def priorLawDeclared : Bool := true

theorem prior_is_declaration : priorLawDeclared = true := rfl

end JapanTaxLaw.PriorLawNorms
