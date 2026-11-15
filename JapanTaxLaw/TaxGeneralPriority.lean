import JapanTaxLaw.Verdict

/-!
# TaxGeneralPriority — 国税通則法（国税の通則に関する法律）第4条

Source (pinned):
https://laws.e-gov.go.jp/law/337AC0000000066
Law id: 337AC0000000066（昭和三十七年法律第六十六号）
Revision: 337AC0000000066_20261101_507AC0000000013
Amendment enforcement date: 2026-11-01 (CurrentEnforced)
Raw snapshot sha256: 6F8B43E168652D228066CDA3389A3BF6823900A9268E6BF97297CB6B25189DEE

Act art. 4, verbatim from the pinned text:
  他の国税に関する法律との関係 この法律に規定する事項と他の国税に関する法律に別段の定めが
  あるものは、その定めるところによる。

Reading (lex specialis): with respect to a matter this Act provides for,
where another national tax law makes a different provision, that other law's
provision applies. This Act's provision applies only where there is no such
differing provision; the verdict must never be treated as false when it is
`unknown`, and a `conflict` between the materials yields an indeterminate
(cannot judge) result rather than a fabricated answer.

Scope:
* Only Act art. 4 itself is formalized. No other provisions of the Act are
  claimed by this module.
* The verdict inputs (`coveredByThisAct`, `distinctProvisionInOtherNationalTaxLaw`)
  are externally assessed legal facts in four-valued logic, exactly as in
  StatutoryModel/CorpActor/Taxpayer.

What this model deliberately does **not** do:
* It does not decide WHETHER a matter is provided by this Act, nor WHETHER
  another national tax law really contains a distinct provision; it only
  computes the priority of application from such externally assessed facts.
* It does not determine which specific other law's provision applies, nor
  test the conformity of a concrete provision with the statute.

Axiom discipline: all theorems are proved by `cases` over Verdict constructors
(all cases are decidable). No `sorry`, `admit`, or unverified axioms.
-/

namespace JapanTaxLaw

/-- Assessed facts relevant to Act art. 4. -/
structure MatterPriorityFacts where
  /-- この法律が当該事項を規定しているか。 -/
  coveredByThisAct : Verdict
  /-- 他の国税に関する法律に別段の定めがあるか。 -/
  distinctElsewhere : Verdict
  deriving DecidableEq, Repr

/-- Outcome for an Act art. 4 priority question. -/
inductive PriorityOutcome where
  | applyThisAct      -- 本法の規定が優先して適用
  | applyOtherLaw     -- 他の国税に関する法律の別段の定めが優先して適用
  | undetermined      -- 不明（unknown）→ 判定不能
  | inconsistent      -- 矛盾した資料（conflict）
  deriving DecidableEq, Repr

/-- Act art. 4 resolution: if another national tax law provides a distinct
    provision, that law's provision applies; otherwise, if this Act regulates
    the matter, this Act's provision applies. -/
def resolveThisActPriority (f : MatterPriorityFacts) : PriorityOutcome :=
  match f.distinctElsewhere with
  | .yes => .applyOtherLaw
  | .no =>
      match f.coveredByThisAct with
      | .yes => .applyThisAct
      | .no => .undetermined
      | .unknown => .undetermined
      | .conflict => .inconsistent
  | .unknown =>
      match f.coveredByThisAct with
      | .conflict => .inconsistent
      | _ => .undetermined
  | .conflict => .inconsistent

-- ==================== structural consistency lemmas ====================

/-- 別段の定めがある ⇒ 他の国税に関する法律の規定が優先する。 -/
theorem distinct_yes_other_applies (f : MatterPriorityFacts)
    (h : f.distinctElsewhere = Verdict.yes) : resolveThisActPriority f = .applyOtherLaw := by
  simp [resolveThisActPriority, h]

/-- 別段の定めなし ∧ 本法が事項を規定 ⇒ 本法の規定が適用。 -/
theorem distinct_no_covered_yes_this_applies (f : MatterPriorityFacts)
    (hD : f.distinctElsewhere = Verdict.no)
    (hC : f.coveredByThisAct = Verdict.yes) : resolveThisActPriority f = .applyThisAct := by
  simp [resolveThisActPriority, hD, hC]

/-- 別段の定めがあるかどうか不明 ⇒ 判定不能（本法は不明を偽として処理しない）。 -/
theorem distinct_unknown_undetermined (f : MatterPriorityFacts)
    (h : f.distinctElsewhere = Verdict.unknown)
    (hC : f.coveredByThisAct ≠ Verdict.conflict) : resolveThisActPriority f = .undetermined := by
  cases hC' : f.coveredByThisAct <;>
    first
      | exact absurd hC' hC
      | simp [resolveThisActPriority, h, hC']

/-- 資料の矛盾は致命的 ⇒ 判定不能の上位（矛盾）。 -/
theorem conflict_anywhere_inconsistent (f : MatterPriorityFacts)
    (hD : f.distinctElsewhere = Verdict.conflict) : resolveThisActPriority f = .inconsistent := by
  simp [resolveThisActPriority, hD]

theorem conflict_covered_inconsistent (f : MatterPriorityFacts)
    (hC : f.coveredByThisAct = Verdict.conflict)
    (hD : f.distinctElsewhere ≠ Verdict.yes) : resolveThisActPriority f = .inconsistent := by
  cases hD' : f.distinctElsewhere <;>
    first
      | exact absurd hD' hD
      | simp [resolveThisActPriority, hD', hC]

/-- 本法の規定が適用されるための必要十分条件。 -/
theorem apply_this_act_iff (f : MatterPriorityFacts) :
    resolveThisActPriority f = .applyThisAct ↔
      (f.distinctElsewhere = Verdict.no ∧ f.coveredByThisAct = Verdict.yes) := by
  cases hd : f.distinctElsewhere <;> cases hc : f.coveredByThisAct <;>
    simp [resolveThisActPriority, hd, hc]

/-- 他法の規定が適用されたなら、別段の定めがある。 -/
theorem other_applies_implies_distinct_yes (f : MatterPriorityFacts)
    (h : resolveThisActPriority f = .applyOtherLaw) : f.distinctElsewhere = Verdict.yes := by
  cases hd : f.distinctElsewhere <;> cases hc : f.coveredByThisAct <;>
    simp [resolveThisActPriority, hd, hc] at h <;> try rfl

/-- 本法の規定が適用されたなら、本法はその事項を規定している。 -/
theorem this_act_applies_implies_covered (f : MatterPriorityFacts)
    (h : resolveThisActPriority f = .applyThisAct) : f.coveredByThisAct = Verdict.yes := by
  cases hd : f.distinctElsewhere <;> cases hc : f.coveredByThisAct <;>
    simp [resolveThisActPriority, hd, hc] at h ⊢

end JapanTaxLaw
