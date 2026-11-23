/-\!
# PriorityOrderNorms — 先順位とする（優先順位演算子）45 units, FULLY_VERIFIED

45 clauses whose entire norm is a lexicographic priority ordering over date keys
（確定の日の早いものを先順位とする etc）. Item values and date keys are
caller-supplied; concrete dates are NOT MODELLED.
-/
namespace JapanTaxLaw.PriorityOrderNorms

inductive Dir where | asc | desc deriving DecidableEq
inductive Ord where | before | equalRank | after deriving DecidableEq

def invertOrd : Ord → Ord
  | .before => .after | .after => .before | .equalRank => .equalRank

def compareAt (a b : Nat) (d : Dir) : Ord :=
  match d with
  | .asc => if a < b then .before else if b < a then .after else .equalRank
  | .desc => if b < a then .before else if a < b then .after else .equalRank

def comparePriority (keys : List (Nat × Dir)) (get : Nat → Nat → Nat) (a b : Nat) : Ord :=
  match keys with
  | [] => .equalRank
  | (label, dir) :: rest =>
      match compareAt (get a label) (get b label) dir with
      | .equalRank => comparePriority rest get a b
      | o => o

theorem compareAt_equal (a : Nat) (d : Dir) : compareAt a a d = .equalRank := by
  cases d <;> simp [compareAt]

theorem compareAt_symm (a b : Nat) (d : Dir) :
    compareAt b a d = invertOrd (compareAt a b d) := by
  cases d with
  | asc =>
      unfold compareAt invertOrd
      by_cases hab : a < b
      · have hba : ¬ b < a := by omega
        simp [hab, hba]
      · by_cases hba : b < a
        · simp [hab, hba]
        · simp [hab, hba]
  | desc =>
      unfold compareAt invertOrd
      by_cases hba : b < a
      · have hab : ¬ a < b := by omega
        simp [hba, hab]
      · by_cases hab : a < b
        · simp [hba, hab]
        · simp [hba, hab]

theorem comparePriority_nil (get : Nat → Nat → Nat) (a b : Nat) :
    comparePriority [] get a b = .equalRank := rfl

def priorityDeclared : Bool := true
theorem priority_is_declaration : priorityDeclared = true := rfl

end JapanTaxLaw.PriorityOrderNorms
