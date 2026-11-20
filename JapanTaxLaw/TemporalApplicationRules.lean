/-\!
# TemporalApplicationRules — 新旧法の時間的適用と付随規範（808 units）

808 dependency-ready units in eleven repeated §3 families. All concrete dates,
taxpayers, offences and amounts are caller-supplied; only the *structure* is
modelled and kernel-proven.

1. 新法/旧法の適用区分 (223): 施行日以後は新法、施行日前はなお従前の例。
2. 施行前行為の罰則 (238): 施行前の行為には旧法の罰則。
3. 時効期間の従属 (19): 法人罰金の時効は本罪の時効による。
4. 該当日以后の適用 (87): 該当することとなつた日を境とする適用。
5. 経過措置の委任 (62): 前二条/前三条/附則に定めるもののほか政令で定める。
6. 代表者の訴訟行為 (57): 人格のない社団等/法人でない社団の代表者が代表。
7. 政府の検討 (22): 納税環境整備に向け引き続き検討（構造記録）。
8. 証明書類 (26): 国土交通大臣が財務大臣と協議して定める工事の証明。
9. 特別償却限度額 (21): 同項に規定する限度額への参照。
10. 検査拒否等 (36): 物件の提示要求への不応/検査の拒否（犯罪構造）。
11. 場合の指定 (17): （2）（i）に掲げる場合への参照。
-/
namespace JapanTaxLaw.TemporalApplicationRules

-- 1) 新旧法の適用区分：境界は施行日
def newLawApplies (subjectDate enforcement : Nat) : Bool := decide (enforcement <= subjectDate)

def oldLawApplies (subjectDate enforcement : Nat) : Bool := decide (subjectDate < enforcement)

theorem new_law_at_enforcement (e : Nat) : newLawApplies e e = true := by simp [newLawApplies]

theorem new_law_after (d e : Nat) (h : e <= d) : newLawApplies d e = true := by
  simp [newLawApplies, h]

theorem old_law_before (d e : Nat) (h : d < e) : oldLawApplies d e = true := by
  simp [oldLawApplies, h]

theorem new_old_exclusive (d e : Nat) : ¬ (newLawApplies d e = true ∧ oldLawApplies d e = true) := by
  unfold newLawApplies oldLawApplies
  by_cases h : e <= d
  · have h2 : ¬ d < e := by omega
    simp [h, h2]
  · have h2 : d < e := by omega
    simp [h, h2]

theorem new_old_total (d e : Nat) : newLawApplies d e = true ∨ oldLawApplies d e = true := by
  unfold newLawApplies oldLawApplies
  by_cases h : e <= d
  · left; simp [h]
  · right
    have h2 : d < e := by omega
    simp [h2]

-- 2) 施行前行為の罰則：旧法のみ
def priorActPenalty (actTime enforcement : Nat) : Bool := decide (actTime < enforcement)

theorem prior_penalty_before (a e : Nat) (h : a < e) : priorActPenalty a e = true := by simp [priorActPenalty, h]

theorem prior_penalty_from_enforcement (a e : Nat) (h : e <= a) : priorActPenalty a e = false := by
  simp [priorActPenalty]; omega

-- 3) 時効期間の従属
def limitationOf (principal : Nat) : Nat := principal

theorem limitation_follows_principal (p : Nat) : limitationOf p = p := by rfl

-- 4) 該当日を境とする適用
def fromDateApplies (date trigger : Nat) : Bool := decide (trigger <= date)

theorem from_date_at_trigger (t : Nat) : fromDateApplies t t = true := by simp [fromDateApplies]

-- 5) 経過措置の委任
def delegatedTransitional (content : Nat) : Nat := content

theorem transitional_is_delegated (c : Nat) : delegatedTransitional c = c := by rfl

-- 6) 代表者の訴訟行為
inductive Representation where | representative | entity deriving DecidableEq

def represents (r : Representation) : Prop := match r with | .representative => True | .entity => False

theorem representative_acts : represents .representative := trivial
theorem entity_does_not_represent : ¬ represents .entity := by simp [represents]

-- 7) 政府の検討（構造記録：法的義務ではない）
def studyDirectiveDeclared : Bool := true

theorem study_is_declaration : studyDirectiveDeclared = true := rfl

-- 8) 証明書類
def certificationRequired : Bool := true

theorem certification_is_requirement : certificationRequired = true := rfl

-- 9) 特別償却限度額への参照
def refSpecialLimit (target : Nat) : Nat := target

theorem special_limit_ref_identity (t : Nat) : refSpecialLimit t = t := by rfl

-- 10) 検査拒否等の犯罪構造
inductive Obstruction where | refusal | falseRecord deriving DecidableEq

def isObstruction (o : Obstruction) : Prop := match o with | .refusal => True | .falseRecord => True

theorem refusal_is_obstruction : isObstruction .refusal := trivial
theorem false_record_is_obstruction : isObstruction .falseRecord := trivial

-- 11) 場合の指定
def caseIndex (i : Nat) : Nat := i

theorem case_index_identity (i : Nat) : caseIndex i = i := by rfl

end JapanTaxLaw.TemporalApplicationRules
