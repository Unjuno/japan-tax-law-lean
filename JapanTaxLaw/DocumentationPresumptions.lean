/-!
# DocumentationPresumptions — 332AC0000000026（資料未提出の推定）

Pinned source: data/raw/332AC0000000026_20261101_507AC0000000013.law.json

Sixteen PRESUMPTION units in four parallel article groups (40の4, 40の7,
66の6, 66の9の2), each with four variants:
  「この場合において、当該書類その他の資料の提示又は提出がないときは、
    …の規定の適用については、当該外国関係会社は…に該当しないものと推定する。」

Structure: when the required documents are NOT submitted, the entity is presumed
NOT to fall under the specified rule. If documents are submitted, the caller's
status determination applies. Four groups share the same structure; one proven
function is aliased by G1..G4, with cross-group identity theorems.

Documents, the underlying status determination and legal effects are caller-
supplied / NOT MODELLED; only the presumption's branch structure is proved.
-/
namespace JapanTaxLaw.DocumentationPresumptions

/-- 資料が提示・提出されたか（呼出側が与える）。 -/
def docsProvided (b : Bool) : Bool := b

/-- 推定の結果: 資料が無ければ「該当しない」(false)、有れば呼出側の判定。 -/
def presumedStatus (provided status : Bool) : Bool :=
  if provided then status else false

theorem absent_implies_not_applicable (status : Bool) :
    presumedStatus false status = false := by rfl

theorem present_uses_status (status : Bool) :
    presumedStatus true status = status := by rfl

theorem branch_exhaustive (provided : Bool) : provided = true ∨ provided = false := by
  cases provided <;> simp

theorem branches_exclusive (provided : Bool) :
    ¬ (provided = true ∧ provided = false) := by
  cases provided <;> simp

theorem monotone_in_status (a b provided : Bool) (h : a = true → b = true) :
    presumedStatus provided a = true → presumedStatus provided b = true := by
  by_cases hp : provided
  · simp [presumedStatus, hp] at ⊢
    exact h
  · simp [presumedStatus, hp]

-- ── 四つの並列グループ（同じ構造） ────────────────────────────────────
namespace G40_4
def presumedStatus := JapanTaxLaw.DocumentationPresumptions.presumedStatus
end G40_4

namespace G40_7
def presumedStatus := JapanTaxLaw.DocumentationPresumptions.presumedStatus
end G40_7

namespace G66_6
def presumedStatus := JapanTaxLaw.DocumentationPresumptions.presumedStatus
end G66_6

namespace G66_9_2
def presumedStatus := JapanTaxLaw.DocumentationPresumptions.presumedStatus
end G66_9_2

theorem cross_group_40_4_40_7 (p s : Bool) :
    G40_4.presumedStatus p s = G40_7.presumedStatus p s := by rfl

theorem cross_group_40_4_66_6 (p s : Bool) :
    G40_4.presumedStatus p s = G66_6.presumedStatus p s := by rfl

theorem cross_group_40_4_66_9_2 (p s : Bool) :
    G40_4.presumedStatus p s = G66_9_2.presumedStatus p s := by rfl

theorem all_four_groups_agree (p s : Bool) :
    G40_4.presumedStatus p s = G40_7.presumedStatus p s ∧
    G40_4.presumedStatus p s = G66_6.presumedStatus p s ∧
    G40_4.presumedStatus p s = G66_9_2.presumedStatus p s := by
  simp [G40_4.presumedStatus, G40_7.presumedStatus,
        G66_6.presumedStatus, G66_9_2.presumedStatus]

end JapanTaxLaw.DocumentationPresumptions
