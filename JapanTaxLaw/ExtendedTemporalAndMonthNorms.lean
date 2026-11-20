/-!
# ExtendedTemporalAndMonthNorms — 追加の施行日・月数規定（435 units）

435 units in 109 variants in two §3 temporal families:

A) 公布の日から起算して X {を超えない|をこえない}範囲内において政令で定める日
   から施行する — X varies (一月/二月/三月/五月/六月/九月/一年/一年三月/一年六月/
   二年/二年六月/三年/五年/九十日, plus 「以下「施行日」という」 variants).
B) 月数は暦に従って計算し、一月に満たない端数を生じたときは、これを一月とする
   — minimum one month.

Both are caller-parametrized: the bound (abstract time units) and the computed
month count are supplied by the caller. Kernel proofs: window bounds and
exclusiveness for A; lower bound and idempotence for B; wording-variant identity.
Calendar conversion and actual dates are NOT MODELLED.
-/
namespace JapanTaxLaw.ExtendedTemporalAndMonthNorms

-- A) 上限付き施行日
def inWindow (promulgate effective bound : Nat) : Bool :=
  decide (promulgate < effective ∧ effective <= promulgate + bound)

theorem window_lower (p e b : Nat) (h : inWindow p e b = true) : p < e := by
  simp [inWindow] at h; exact h.1

theorem window_upper (p e b : Nat) (h : inWindow p e b = true) : e <= p + b := by
  simp [inWindow] at h; exact h.2

theorem window_of_bounds (p e b : Nat) (h1 : p < e) (h2 : e <= p + b) :
    inWindow p e b = true := by simp [inWindow, h1, h2]

theorem window_mono_bound (p e b b' : Nat) (h : b <= b')
    (hw : inWindow p e b = true) : inWindow p e b' = true := by
  simp [inWindow] at hw ⊢
  omega

-- B) 月数の下限 1
def effectiveMonths (m : Nat) : Nat := if m = 0 then 1 else m

theorem months_at_least_one (m : Nat) : 1 <= effectiveMonths m := by
  by_cases h : m = 0 <;> simp [effectiveMonths, h] <;> omega

theorem months_idempotent (m : Nat) : effectiveMonths (effectiveMonths m) = effectiveMonths m := by
  by_cases h : m = 0
  · simp [h, effectiveMonths]
  · have hm : effectiveMonths m = m := by simp [effectiveMonths, h]
    rw [hm]
    exact hm

theorem months_identity_when_ge_one (m : Nat) (h : 1 <= m) : effectiveMonths m = m := by
  have hn : m ≠ 0 := by omega
  simp [effectiveMonths, hn]

-- 文言変形（超えない/こえない、施行日という）は同じ構造
namespace Exceed
def window := @inWindow
end Exceed
namespace Koenai
def window := @inWindow
end Koenai

theorem wording_families_identical (p e b : Nat) :
    Exceed.window p e b = Koenai.window p e b := by rfl

end JapanTaxLaw.ExtendedTemporalAndMonthNorms
