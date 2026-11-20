/-!
# DeemedFilingDates — 325AC0000000073（記載日がない場合の擬制）

Pinned source: data/raw/325AC0000000073_20260401_506AC0000000008.law.json

Six DEEMING units in art.39 (§6/§13/§18) and art.42 (§4/§11/§23):
  「この場合において、当該提出する日が記載されていないときは、当該提出期限の
    翌日から起算して三月を経過する日が記載されているものとみなす。」
and the parallel variants for 「訂正又は提出をする日」 and 「措置をとる日」.

Structure: if no date is written, a caller-supplied deemed date (the computed
"reference + 3 months", whose calendar arithmetic is NOT MODELLED) is treated
as written. Three text patterns A/B/C implement the same rule; kernel theorems
prove branch totality/exclusiveness and their extensional identity.

Nothing here models calendar arithmetic, filing procedure, or legal effect.
-/
namespace JapanTaxLaw.DeemedFilingDates

/-- 記載日（呼出側が与える。Option で「記載なし」を表現）。 -/
def Written := Option Nat

/-- A: 提出する日。 -/
def ruleA (written : Written) (deemed : Nat) : Nat :=
  match written with
  | some d => d
  | none => deemed

/-- B: 訂正又は提出をする日。 -/
def ruleB (written : Written) (deemed : Nat) : Nat :=
  match written with
  | some d => d
  | none => deemed

/-- C: 措置をとる日。 -/
def ruleC (written : Written) (deemed : Nat) : Nat :=
  match written with
  | some d => d
  | none => deemed

-- ── 分岐の到達可能性と排他性（§3） ────────────────────────────────────
theorem written_branch (d deemed : Nat) : ruleA (some d) deemed = d := by rfl
theorem deemed_branch (deemed : Nat) : ruleA none deemed = deemed := by rfl

theorem branch_exclusive (written : Written) :
    ¬ (written = none ∧ written ≠ none) := by
  intro h; exact h.2 h.1

theorem branch_exhaustive (written : Written) : written = none ∨ ∃ d, written = some d := by
  cases written with
  | none => exact Or.inl rfl
  | some d => exact Or.inr ⟨d, rfl⟩

/-- 結果は常に一つの日付（非空性）。 -/
theorem total (written : Written) (deemed : Nat) : ∃ r, ruleA written deemed = r := by
  cases written with
  | none => exact ⟨deemed, rfl⟩
  | some d => exact ⟨d, rfl⟩

-- ── 三つの文言パターンの拡張的同一性（法令横断） ────────────────────────
theorem ruleA_eq_ruleB (written : Written) (deemed : Nat) :
    ruleA written deemed = ruleB written deemed := by rfl

theorem ruleA_eq_ruleC (written : Written) (deemed : Nat) :
    ruleA written deemed = ruleC written deemed := by rfl

theorem all_three_branches_agree (written : Written) (deemed : Nat) (d : Nat)
    (h : written = some d) :
    ruleA written deemed = d ∧ ruleB written deemed = d ∧ ruleC written deemed = d := by
  subst written
  simp [ruleA, ruleB, ruleC]

theorem all_three_deem_agree (deemed : Nat) :
    ruleA none deemed = deemed ∧ ruleB none deemed = deemed ∧ ruleC none deemed = deemed := by
  simp [ruleA, ruleB, ruleC]

end JapanTaxLaw.DeemedFilingDates
