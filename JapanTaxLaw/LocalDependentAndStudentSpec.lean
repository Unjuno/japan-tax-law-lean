import JapanTaxLaw.LocalIncomeTax

/-!
# LocalDependentAndStudentSpec — independent restatement of
  地方税法 art. 34(1)九号（勤労学生控除）・第十一号（控除対象扶養親族）・ art. 34(4)（同居直系尊属）

Sources (pinned; identical to LocalIncomeTax.lean):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 3DD29E0078BF24E09C79436CE7B0F00FD2CFB5A5BBCB97BD4F4352971BE68D53

Independent restatement of:
  * art. 34(1)九号 — 勤労学生である所得割の納税義務者 — 二十六万円（固定額）。
  * art. 34(1）第十一号 — 控除対象扶養親族（控除対象扶養親族のうち、年齢十六歳以上の者・
    所得税法第二条第一項第三号に規定する居住者／同項第五号に規定する非居住者等）を有する
    所得割の納税義務者各控除対象扶養親族につき三十三万円、
    特定扶養親族（控除対象扶養親族のうち、年齢十九歳以上二十三歳未満の者）は四十五万円、
    老人扶養親族（控除対象扶養親族のうち、年齢七十歳以上の者）は三十八万円。
  * art. 34(4）— 老人扶養親族が直系尊属であり、かつ、納税義務者又は配偶者とのいずれかの
    同居を常況としている場合（同居直系尊属）には、当該老人扶養親族に係る第十一号の金額は四十五万円に読み替える。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: art. 34(1）九号 勤労学生控除額。 -/
def specWorkingStudentDeduction : Money := 260_000

/-- Spec: art. 34(1）第十一号 控除対象扶養親族の金額（kind 別の固定額）。 -/
inductive SpecDependentKind
  | regular | specifiedAllocated | elderly
  deriving DecidableEq, Repr

def specDependentDeduction (kind : SpecDependentKind) : Money :=
  match kind with
  | SpecDependentKind.regular => 330_000
  | SpecDependentKind.specifiedAllocated => 450_000
  | SpecDependentKind.elderly => 380_000

/-- Spec: art. 34(4） 同居直系尊属の老人扶養親族の金額（四十五万円）。 -/
def specCoHabitingElderlyDeduction : Money := 450_000

/-- Spec: art. 34(4） の判定。 -/
def specElderlyDependentDeductionWithCoHabitation (isCohabitingDirectAscendant : Bool) : Money :=
  if isCohabitingDirectAscendant then specCoHabitingElderlyDeduction
  else specDependentDeduction SpecDependentKind.elderly

-- ==== points, all kernel-decided ====

example : specWorkingStudentDeduction = 260_000 := by decide
example : specDependentDeduction SpecDependentKind.regular = 330_000 := by decide
example : specDependentDeduction SpecDependentKind.specifiedAllocated = 450_000 := by decide
example : specDependentDeduction SpecDependentKind.elderly = 380_000 := by decide
example : specElderlyDependentDeductionWithCoHabitation true = 450_000 := by decide
example : specElderlyDependentDeductionWithCoHabitation false = 380_000 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeWorkingStudentPoints : Bool :=
  workingStudentDeduction == specWorkingStudentDeduction

def agreeDependentDeductionPoints : Bool :=
  [DependentKind.regular, DependentKind.specifiedAllocated, DependentKind.elderly].all fun k =>
    let impl := dependentDeduction k
    let spec := specDependentDeduction (match k with
      | DependentKind.regular => SpecDependentKind.regular
      | DependentKind.specifiedAllocated => SpecDependentKind.specifiedAllocated
      | DependentKind.elderly => SpecDependentKind.elderly)
    impl == spec

def agreeArt34_4Points : Bool :=
  [false, true].all fun b =>
    elderlyDependentDeductionWithCoHabitation b == specElderlyDependentDeductionWithCoHabitation b

example : agreeWorkingStudentPoints = true := by decide
example : agreeDependentDeductionPoints = true := by decide
example : agreeArt34_4Points = true := by decide

end JapanTaxLaw
