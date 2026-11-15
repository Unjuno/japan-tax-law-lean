import JapanTaxLaw.Verdict

/-!
# CorpActor — Corporate actor classification, Act art. 2(3), (4)

Source (pinned):
https://laws.e-gov.go.jp/law/340AC0000000034
Act art. 2, items 3 and 4 (actor classification for domestic/foreign corporations).

Scope:
* Actor classification only (resident vs foreign corporation), analogous to the
  所得税法 residency question in StatutoryModel.lean.
* Inputs are **already assessed legal facts** in the four-valued `Verdict` logic.
  This module never decides whether a head office or main office is in Japan;
  it only computes the classification from externally established facts.

What this model deliberately does **not** do:
* It does not determine whether a head office is located in Japan, nor the
  consequences of actor status (applicability of §5, rates, deductions, etc.).
* It does not model 公共法人/公益法人等 (art. 2 items 5/6),
  nor non-resident taxation scope, nor any attaching treaty/order.

Axiom discipline: all theorems proved by `cases` + `simp` over Verdict
constructors. No `sorry`, `admit`, or unverified axioms.
-/

namespace JapanTaxLaw

/-- Statutory facts relevant to the corporate actor classification. -/
structure CorpActorFacts where
  /-- 本店が国内にあるか (Act art. 2 item 3) -/
  headOfficeInJapan : Verdict
  /-- 主たる事務所が国内にあるか (Act art. 2 item 3) -/
  mainOfficeInJapan : Verdict
  deriving DecidableEq, Repr

/-- 内国法人 := 国内に本店又は主たる事務所を有する法人 (Act art. 2 item 3). -/
def isDomesticCorpVerdict (f : CorpActorFacts) : Verdict :=
  Verdict.or f.headOfficeInJapan f.mainOfficeInJapan

/-- 外国法人 := 内国法人以外の法人 (Act art. 2 item 4). -/
def isForeignCorpVerdict (f : CorpActorFacts) : Verdict :=
  Verdict.not (isDomesticCorpVerdict f)

/-- Four-valued classification report for consumers. -/
inductive CorpActorClassification where
  | resident
  | foreign
  | indeterminate
  | inconsistent
  deriving DecidableEq, Repr

def classifyCorpVerdict (v : Verdict) : CorpActorClassification :=
  match v with
  | .yes      => .resident
  | .no       => .foreign
  | .unknown  => .indeterminate
  | .conflict => .inconsistent

def classifyCorpActor (f : CorpActorFacts) : CorpActorClassification :=
  classifyCorpVerdict (isDomesticCorpVerdict f)

-- ==================== structural consistency lemmas ====================

/-- 内国法人 verdict is exactly the OR of the two inputs. -/
theorem isDomesticCorpVerdict_eq_or (f : CorpActorFacts) :
    isDomesticCorpVerdict f = Verdict.or f.headOfficeInJapan f.mainOfficeInJapan := by
  unfold isDomesticCorpVerdict at *; rfl

/-- 外国法人 verdict is exactly the negation of 内国法人. -/
theorem isForeignCorpVerdict_eq_not (f : CorpActorFacts) :
    isForeignCorpVerdict f = Verdict.not (isDomesticCorpVerdict f) := by
  unfold isForeignCorpVerdict at *; rfl

/-- A verified domestic head office alone suffices. -/
theorem head_office_sufficient (f : CorpActorFacts)
    (h : f.headOfficeInJapan = Verdict.yes) : isDomesticCorpVerdict f = Verdict.yes := by
  simp [isDomesticCorpVerdict, h, Verdict.or]

/-- A verified domestic main office alone suffices. -/
theorem main_office_sufficient (f : CorpActorFacts)
    (h : f.mainOfficeInJapan = Verdict.yes) : isDomesticCorpVerdict f = Verdict.yes := by
  cases h1 : f.headOfficeInJapan <;> simp [isDomesticCorpVerdict, h1, h, Verdict.or]

/-- Both inputs negated ⇒ 内国法人 negated. -/
theorem neither_office_negated (f : CorpActorFacts)
    (h1 : f.headOfficeInJapan = Verdict.no)
    (h2 : f.mainOfficeInJapan = Verdict.no) :
    isDomesticCorpVerdict f = Verdict.no := by
  simp [isDomesticCorpVerdict, h1, h2, Verdict.or]

/-- 内国法人 established ⇒ 外国法人 negated. -/
theorem resident_not_foreign (f : CorpActorFacts)
    (h : isDomesticCorpVerdict f = Verdict.yes) :
    isForeignCorpVerdict f = Verdict.no := by
  simp [isForeignCorpVerdict, h, Verdict.not]

/-- Classification is exhaustive, covering all four outcomes. -/
theorem corp_classification_always_one (f : CorpActorFacts) :
    classifyCorpActor f = .resident ∨ classifyCorpActor f = .foreign ∨
    classifyCorpActor f = .indeterminate ∨ classifyCorpActor f = .inconsistent := by
  cases h : isDomesticCorpVerdict f <;> simp [classifyCorpActor, classifyCorpVerdict, h]

/-- 内国法人判定 precludes 外国法人判定. -/
theorem resident_notClassifiedForeign (f : CorpActorFacts)
    (h : classifyCorpActor f = .resident) :
    classifyCorpActor f ≠ .foreign := by
  unfold classifyCorpActor classifyCorpVerdict at h ⊢
  cases hf : isDomesticCorpVerdict f <;> simp [hf] at h ⊢
  all_goals rfl

/-- Classification can never assert both categories simultaneously. -/
theorem corp_classification_never_both (f : CorpActorFacts) :
    ¬ (classifyCorpActor f = .resident ∧ classifyCorpActor f = .foreign) := by
  intro h
  have h1 := h.1
  have h2 := h.2
  unfold classifyCorpActor classifyCorpVerdict at h1 h2
  cases hf : isDomesticCorpVerdict f <;> simp [hf] at h1 h2

/-- Foreign classification entails 内国法人 verdict is negated. -/
theorem foreign_implies_not_resident (f : CorpActorFacts)
    (h : classifyCorpActor f = .foreign) :
    isDomesticCorpVerdict f = Verdict.no := by
  unfold classifyCorpActor classifyCorpVerdict at h
  cases hf : isDomesticCorpVerdict f <;> simp [hf] at h
  rfl

/-- Resident classification entails 内国法人 verdict is affirmed. -/
theorem resident_implies_yes (f : CorpActorFacts)
    (h : classifyCorpActor f = .resident) :
    isDomesticCorpVerdict f = Verdict.yes := by
  unfold classifyCorpActor classifyCorpVerdict at h
  cases hf : isDomesticCorpVerdict f <;> simp [hf] at h
  rfl

end JapanTaxLaw
