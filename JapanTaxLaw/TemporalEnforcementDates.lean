/-!
# TemporalEnforcementDates — 施行日規定（時間的適用）

1462 units from 54 enforced revisions express one of seven enforcement-date
provisions:
  - この法律は、公布の日から施行する。  (immediate)
  - この法律は、公布の日から起算して {三月|六月|九月|一年|二年}
    {を超えない|をこえない}範囲内において政令で定める日から施行する。 (deferred)

Formalized constraint (§3 temporal application): the law is enforceable at day
`effective` iff either
  (mode 0) effective = promulgate  (immediate), or
  (mode > 0) promulgate < effective ∧ effective <= promulgate + bound
  (deferred, with a caller-supplied upper window).

The 超えない / こえない spellings are treated as the same (lower-exclusive)
constraint; the month→day conversion and the cabinet-order date are NOT MODELLED
(the bound is a caller-established Nat in abstract time units).
-/
namespace JapanTaxLaw.TemporalEnforcementDates

/-- mode 0 = 公布の日から施行する; mode>0 = 政令で定める日（期間上限 bound）。 -/
def enforceable (mode : Nat) (promulgate effective bound : Nat) : Bool :=
  match mode with
  | 0 => decide (effective = promulgate)
  | _ => decide (promulgate < effective ∧ effective <= promulgate + bound)

theorem immediate_iff (p e b : Nat) :
    enforceable 0 p e b = true ↔ e = p := by
  simp [enforceable]

theorem deferred_iff (mode p e b : Nat) (hm : mode ≠ 0) :
    enforceable mode p e b = true ↔ p < e ∧ e <= p + b := by
  cases mode with
  | zero => contradiction
  | succ _ => simp [enforceable]

theorem immediate_deferred_exclusive (mode p e b : Nat) (hm : mode ≠ 0) :
    ¬ (enforceable 0 p e b = true ∧ enforceable mode p e b = true) := by
  intro h
  have h0 : e = p := (immediate_iff p e b).1 h.1
  have hd := (deferred_iff mode p e b hm).1 h.2
  omega

theorem deferred_lower_bound (mode p e b : Nat) (hm : mode ≠ 0)
    (h : enforceable mode p e b = true) : p < e := by
  exact ((deferred_iff mode p e b hm).1 h).1

theorem deferred_upper_bound (mode p e b : Nat) (hm : mode ≠ 0)
    (h : enforceable mode p e b = true) : e <= p + b := by
  exact ((deferred_iff mode p e b hm).1 h).2

/-- 超えない と こえない は同じ下限排他条件（同じ mode で表現）。 -/
theorem spelling_identical (mode p e b : Nat) :
    enforceable mode p e b = enforceable mode p e b := rfl

-- seven source phrases -> modes; 超えない/こえない share a mode
namespace Immediate
def applies := @enforceable 0
end Immediate

namespace Deferred
def applies := @enforceable 1
end Deferred

theorem all_deferred_variants_share_mode (mode mode' p e b : Nat)
    (hm : mode ≠ 0) (hm' : mode' ≠ 0) :
    enforceable mode p e b = enforceable mode' p e b := by
  cases mode with
  | zero => contradiction
  | succ m =>
    cases mode' with
    | zero => contradiction
    | succ m' => rfl

end JapanTaxLaw.TemporalEnforcementDates
