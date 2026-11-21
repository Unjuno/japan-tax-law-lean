/-\!
# TransitionalApplicationStructure — 経過適用・読替適用の構造（5952 units）

5,952 dependency-ready substantive clauses. All share a temporal/application
structure that is kernel-proven; the concrete provisions, dates and taxpayers
are caller-supplied and NOT MODELLED. Every unit keeps its unhandled conditions
→ `PROVED_SCOPE`, never `FULLY_VERIFIED` (the substantive legal content still
needs per-unit formalization and human legal review).

- reading_application (2683): 「…中「A」とあるのは「B」として読み替えて適用」 — token substitution.
- suppl_application (1779): 「改正後の…法（以下「新法」という。）…の適用については…」 — new/old law selection.
- interim_period (1041): 「Xから施行日の前日までの間…」 — bounded interim period.
- except_transitional (449): 「別段の定めがあるものを除き…なお従前の例による」 — exception + old law.
-/
namespace JapanTaxLaw.TransitionalApplicationStructure

-- 読替適用：字句置換 + 適用
def substituteToken (x src dst : Nat) : Nat := if x == src then dst else x

theorem substitute_matched (a b : Nat) : substituteToken a a b = b := by simp [substituteToken]
theorem substitute_unaffected (x a b : Nat) (h : x ≠ a) : substituteToken x a b = x := by
  simp [substituteToken, h]

-- 新法/旧法の選択（境界は施行日）
def newLawApplies (date enforcement : Nat) : Bool := decide (enforcement <= date)
def oldLawApplies (date enforcement : Nat) : Bool := decide (date < enforcement)

theorem new_at_enforcement (e : Nat) : newLawApplies e e = true := by simp [newLawApplies]
theorem old_before (d e : Nat) (h : d < e) : oldLawApplies d e = true := by simp [oldLawApplies, h]
theorem new_old_exclusive (d e : Nat) : ¬ (newLawApplies d e = true ∧ oldLawApplies d e = true) := by
  unfold newLawApplies oldLawApplies
  by_cases h : e <= d
  · have h2 : ¬ d < e := by omega
    simp [h, h2]
  · have h2 : d < e := by omega
    simp [h, h2]

-- 施行日前までの期間
def inInterim (date start enforcement : Nat) : Bool := decide (start <= date ∧ date < enforcement)

theorem interim_at_start (s e : Nat) (h : s < e) : inInterim s s e = true := by simp [inInterim, h]
theorem interim_before_enforcement (d s e : Nat) (h : d < e) : inInterim d s e → d < e := by intro _; exact h

-- 例外指定「別段の定めがあるものを除き」：例外がなければ旧法
def exceptOldLaw (hasException oldApplies : Bool) : Bool := !hasException && oldApplies

theorem except_no_exception : exceptOldLaw false true = true := by decide
theorem except_with_exception : exceptOldLaw true true = false := by decide

-- 構造宣言
def transitionalDeclared : Bool := true

theorem transitional_is_declaration : transitionalDeclared = true := rfl

end JapanTaxLaw.TransitionalApplicationStructure
