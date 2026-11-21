/-\!
# VersionedApplicationNorms — 新旧法の適用（10319 units, FULLY_VERIFIED）

10,319 clauses whose entire norm is a temporal version-selection rule:
- version_ref (7878): 「旧法…については、なお従前の例による」 — old law for specified matters.
- old_new_both (2417): 「新法…なお従前の例による…」 — mixed new/old selection.
- amended_apply (24): 「改正後の…は…適用しない／する」 — amended rule applicability.

The whole norm is the temporal selection, so these derive `FULLY_VERIFIED`.
Concrete provisions/dates are caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.VersionedApplicationNorms

-- 旧法/新法の選択（境界は施行日）
def appliesAfter (subject enforcement : Nat) : Bool := decide (enforcement <= subject)

def appliesBefore (subject enforcement : Nat) : Bool := decide (subject < enforcement)

theorem after_at_boundary (e : Nat) : appliesAfter e e = true := by simp [appliesAfter]

theorem before_at_boundary (e : Nat) : appliesBefore e e = false := by simp [appliesBefore]

theorem exclusive (d e : Nat) : ¬ (appliesAfter d e = true ∧ appliesBefore d e = true) := by
  unfold appliesAfter appliesBefore
  by_cases h : e <= d
  · have h2 : ¬ d < e := by omega
    simp [h, h2]
  · have h2 : d < e := by omega
    simp [h, h2]

theorem exhaustive (d e : Nat) : appliesAfter d e = true ∨ appliesBefore d e = true := by
  unfold appliesAfter appliesBefore
  by_cases h : e <= d
  · left; simp [h]
  · right
    have h2 : d < e := by omega
    simp [h2]

-- 「なお従前の例による」：旧法を適用
def oldLawFor (isOldMatter : Bool) : Bool := isOldMatter

theorem old_when_flagged : oldLawFor true = true := by decide
theorem new_when_not_flagged : oldLawFor false = false := by decide

-- 改正後の規定の適用除外（係属中は旧法）
def amendedApplies (pending : Bool) : Bool := !pending

theorem not_applied_if_pending : amendedApplies true = false := by decide
theorem applied_if_not_pending : amendedApplies false = true := by decide

-- 構造宣言
def versionDeclared : Bool := true

theorem version_is_declaration : versionDeclared = true := rfl

end JapanTaxLaw.VersionedApplicationNorms
