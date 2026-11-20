/-!
# DefaultBranches — 「〜に掲げる場合以外の場合」（248 units）

248 units in 23 verbatim variants (前号/次号/イ/ロ/（１）/（ｉ）…に掲げる場合
以外の場合 etc.). All express one logical structure: the "other cases" branch
is the complement of the enumerated listed cases.

Formalized as: for a caller-supplied number of listed cases `n` and a case index
`c`, the default branch applies iff `n <= c` (case index beyond the listed ones).
Kernel proofs: complement exclusiveness/exhaustiveness, boundary at n, and
identity of all spelling variants.

The substantive content of the listed cases and the attached legal effects are
NOT MODELLED.
-/
namespace JapanTaxLaw.DefaultBranches

/-- 列挙された場合の数 n、対象ケース c に対して「以外の場合」か。 -/
def isOtherCase (n c : Nat) : Bool := decide (n <= c)

theorem listed_case_not_other (n c : Nat) (h : c < n) : isOtherCase n c = false := by
  simp [isOtherCase, h]

theorem other_case_not_listed (n c : Nat) (h : n <= c) : isOtherCase n c = true := by
  simp [isOtherCase, h]

theorem listed_other_exclusive (n c : Nat) :
    ¬ (c < n ∧ isOtherCase n c = true) := by
  intro h
  have : isOtherCase n c = false := listed_case_not_other n c h.1
  exact by simpa [this] using h.2

theorem listed_other_exhaustive (n c : Nat) : c < n ∨ isOtherCase n c = true := by
  by_cases h : c < n
  · exact Or.inl h
  · have hn : n <= c := by omega
    exact Or.inr (by simp [isOtherCase, hn])

theorem boundary_at_n (n : Nat) : isOtherCase n n = true := by
  simp [isOtherCase]

-- 23 variants share the same structure; representative aliases
namespace VZenGo
def other := @isOtherCase
end VZenGo
namespace VJiGo
def other := @isOtherCase
end VJiGo
namespace VI
def other := @isOtherCase
end VI
namespace VRo
def other := @isOtherCase
end VRo

theorem all_variants_share_structure (n c : Nat) :
    VZenGo.other n c = VJiGo.other n c ∧
    VZenGo.other n c = VI.other n c ∧
    VZenGo.other n c = VRo.other n c := by
  simp [VZenGo.other, VJiGo.other, VI.other, VRo.other]

end JapanTaxLaw.DefaultBranches
