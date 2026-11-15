import JapanTaxLaw.Verdict

/-!
# LocalPrivilege — 地方税法（昭和二十五年法律第二百二十六号）
                    Act art. 7 （受益に因る不均一課税及び一部課税）

Source (pinned):
https://laws.e-gov.go.jp/law/325AC0000000226
Law id: 325AC0000000226（昭和二十五年法律第二百二十六号）
Revision: 325AC0000000226_20261101_508AC0000000002
Amendment enforcement date: 2026-11-01 (CurrentEnforced)
Raw snapshot sha256: 3DD29E0078BF24E09C79436CE7B0F00FD2CFB5A5BBCB97BD4F4352971BE68D53

Act art. 7, verbatim from the pinned text:
  第七条 地方団体は、その一部に対して特に利益がある事件に関しては、不均一の課税をし、又はその一部に課税をすることができる.

Scope:
* Only Act art. 7 is formalized. The two concrete permissions are:
  - `mayLevyUnevenForBenefit` : 不均一の課税をすることができる
  - `mayLevyOnPartOnly`         : その一部に課税をすることができる
* Act art. 2（地方団体の課税権）, Act art. 6（公益等に因る課税免除及び不均一課税）, Act art. 3（条例要件）, Act art. 23（用語の意義）, and the catalog arts. 4–5 are not part of this module.
* The assessment of "特に利益がある事件" is taken as an externally-assessed fact (four-valued Verdict, unknown != false).
* Not limited to any specific tax industry (道府県税 vs 市町村税共に適用).

Axiom discipline: all theorems are proved by `cases`/`simp` over Verdict constructors.
No `sorry`, `admit`, or unverified axioms.
-/

namespace JapanTaxLaw

/-- Assessed facts relevant to Act art. 7. -/
structure LocalPrivilegeFacts where
  /-- 地方団体か（都道府県・市町村・特別区等）. -/
  isLocalEntity : Verdict
  /-- その一部に対して特に利益がある事件に該当するか（受益者軽減の骨子）. -/
  specialBenefitApplies : Verdict
  deriving DecidableEq, Repr

/-- Outcome for Act art. 7 applied jointly. -/
inductive LocalPrivilegeOutcome where
  | mayLevyUnevenOnly     -- 不均一の課税のみ
  | mayLevyOnPartOnly     -- 一部に課税
  | bothAllowed           -- 不均一 and 一部課税の両方
  | undetermined          -- 判定不能（不明）
  | inconsistent          -- 矛盾入力
  deriving DecidableEq, Repr

/-- Act art. 7 (first clause): 不均一の課税をすることができる. -/
def mayLevyUnevenForBenefit (f : LocalPrivilegeFacts) : Verdict :=
  Verdict.and f.isLocalEntity f.specialBenefitApplies

/-- Act art. 7 (last clause): その一部に課税をすることができる. -/
def mayLevyOnPartOnlyForBenefit (f : LocalPrivilegeFacts) : Verdict :=
  Verdict.and f.isLocalEntity f.specialBenefitApplies

/-- Act art. 7 classification: the two permissions jointly. -/
def classifyLocalTaxPrivilege (f : LocalPrivilegeFacts) : LocalPrivilegeOutcome :=
  if f.isLocalEntity = Verdict.conflict ∨ f.specialBenefitApplies = Verdict.conflict then .inconsistent
  else if f.isLocalEntity = Verdict.yes ∧ f.specialBenefitApplies = Verdict.yes then .bothAllowed
  else .undetermined

-- ==================== structural consistency lemmas ====================

/-- 地方団体かつ受益が認められる ⇒ 不均一の課税、又はその一部に対する課税をすることができる. -/
theorem local_entity_benefit_sufficient (f : LocalPrivilegeFacts)
    (hI : f.isLocalEntity = Verdict.yes) (hP : f.specialBenefitApplies = Verdict.yes) :
    mayLevyUnevenForBenefit f = Verdict.yes ∧ mayLevyOnPartOnlyForBenefit f = Verdict.yes := by
  simp [mayLevyUnevenForBenefit, mayLevyOnPartOnlyForBenefit, hI, hP, Verdict.and]

/-- 受益原因が認められない ⇒ Act art. 7 による特例の適用権がない. -/
theorem no_benefit_no_privilege (f : LocalPrivilegeFacts)
    (h : f.specialBenefitApplies = Verdict.no) :
    mayLevyUnevenForBenefit f ≠ Verdict.yes ∧ mayLevyOnPartOnlyForBenefit f ≠ Verdict.yes := by
  cases hI : f.isLocalEntity <;> simp [mayLevyUnevenForBenefit, mayLevyOnPartOnlyForBenefit, hI, h, Verdict.and]

/-- 地方団体でない ⇒ Act art. 7 による特例は適用できない. -/
theorem no_local_entity_no_privilege (f : LocalPrivilegeFacts)
    (h : f.isLocalEntity = Verdict.no) :
    mayLevyUnevenForBenefit f ≠ Verdict.yes ∧ mayLevyOnPartOnlyForBenefit f ≠ Verdict.yes := by
  simp [mayLevyUnevenForBenefit, mayLevyOnPartOnlyForBenefit, h, Verdict.and]

/-- 受益が不明 ⇒ 判決不能に落ちる（不明を偽として処理しない）. -/
theorem unknown_benefit_undetermined (f : LocalPrivilegeFacts)
    (h : f.specialBenefitApplies = Verdict.unknown)
    (hI' : f.isLocalEntity = Verdict.yes ∨ f.isLocalEntity = Verdict.unknown) :
    mayLevyUnevenForBenefit f = Verdict.unknown := by
  rcases hI' with hI' | hI' <;> simp [mayLevyUnevenForBenefit, hI', h, Verdict.and]

/-- 入力が矛盾 ⇒ 判決不能. -/
theorem conflict_benefit_inconsistent (f : LocalPrivilegeFacts)
    (h : f.specialBenefitApplies = Verdict.conflict) :
    classifyLocalTaxPrivilege f = .inconsistent := by
  cases hI : f.isLocalEntity <;> simp [classifyLocalTaxPrivilege, hI, h]

/-- 両方の権限が成立する ⇒ .bothAllowed. -/
theorem both_privilege_yes (f : LocalPrivilegeFacts)
    (hI : f.isLocalEntity = Verdict.yes) (hP : f.specialBenefitApplies = Verdict.yes) :
    classifyLocalTaxPrivilege f = .bothAllowed := by
  simp [classifyLocalTaxPrivilege, hI, hP]

/-- 判別の分割は一意に4つに写される. -/
theorem privilege_classification_always_one (f : LocalPrivilegeFacts) :
    classifyLocalTaxPrivilege f = .mayLevyUnevenOnly ∨
    classifyLocalTaxPrivilege f = .mayLevyOnPartOnly ∨
    classifyLocalTaxPrivilege f = .bothAllowed ∨
    classifyLocalTaxPrivilege f = .undetermined ∨
    classifyLocalTaxPrivilege f = .inconsistent := by
  cases hI : f.isLocalEntity <;> cases hP : f.specialBenefitApplies <;>
    simp [classifyLocalTaxPrivilege, hI, hP]

/-- 地方団体でない限り特権は付与されない. -/
theorem privilege_stays_bounded (f : LocalPrivilegeFacts)
    (hI : f.isLocalEntity = Verdict.no) : classifyLocalTaxPrivilege f = .undetermined ∨ classifyLocalTaxPrivilege f = .inconsistent := by
  cases hB : f.specialBenefitApplies <;> simp [classifyLocalTaxPrivilege, hI, hB]

/-- 地方団体であること（入力）が矛盾 ⇒ 判決不能. -/
theorem conflict_local_entity_inconsistent (f : LocalPrivilegeFacts)
    (h : f.isLocalEntity = Verdict.conflict) :
    classifyLocalTaxPrivilege f = .inconsistent := by
  cases hP : f.specialBenefitApplies <;> simp [classifyLocalTaxPrivilege, h, hP]

end JapanTaxLaw
