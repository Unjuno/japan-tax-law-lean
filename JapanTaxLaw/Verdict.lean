/-!
# Verdict — four-valued status of a legally assessed fact

Japanese tax law distinguishes:

* `yes`     — the fact is **affirmatively established** (認定済み: ある)
* `no`      — the fact is **affirmatively denied**   (認定済み: ない)
* `unknown` — the fact is **undetermined**            (不明)
* `conflict`— the materials **contradict each other** (矛盾: 判決不能)

**`unknown` must never be treated as `false`.** All logical connectives are
total; the matches are written in leftmost-literal normal form so that the
kernel reduces them definitionally everywhere (`rfl` works for every closed
and every leftmost-literal instance, e.g. `or yes x = yes`).

This module has no external dependencies and no axioms.
-/

namespace JapanTaxLaw

/-- Four-valued status of a legally assessed fact. `deriving DecidableEq`
    gives mechanical case analysis everywhere in this project. -/
inductive Verdict where
  | yes      -- 認定済み (positive)
  | no       -- 認定済み (negative)
  | unknown  -- 不明 (undetermined)
  | conflict -- 矛盾 (inconsistent with the materials)
  deriving DecidableEq, Repr, BEq

namespace Verdict

/-- Classical negation extended: `unknown`/`conflict` are stable.
    Leftmost-literal order is kept for definitional reducibility. -/
def not : Verdict → Verdict
  | .yes      => .no
  | .no       => .yes
  | .unknown  => .unknown
  | .conflict => .conflict

/-- Conjunction, in leftmost-literal order.
    Truth table (x = first argument, y = second):

    (.no, *)     => .no              (.yes, .no)     => .no
    (.yes, y)    => y                (.yes, .yes)    => .yes
    (.unknown, .no) => .no           (.unknown, .yes) => .unknown
    (.unknown, .unknown) => .unknown (.unknown, .conflict) => .conflict
    (.conflict, .no) => .no          (.conflict, .yes)  => .conflict
    (.conflict, .unknown) => .conflict (.conflict, .conflict) => .conflict
-/
def and : Verdict → Verdict → Verdict
  | .no, _ => .no
  | .yes, y => y
  | .unknown, .no => .no
  | .unknown, .yes => .unknown
  | .unknown, .unknown => .unknown
  | .unknown, .conflict => .conflict
  | .conflict, .no => .no
  | .conflict, .yes => .conflict
  | .conflict, .unknown => .conflict
  | .conflict, .conflict => .conflict

/-- Disjunction, in leftmost-literal order.
    Truth table:

    (.yes, *)     => .yes              (.no, .yes)    => .yes
    (.no, .no)    => .no               (.no, .unknown) => .unknown
    (.no, .conflict) => .conflict      (.unknown, .yes)  => .yes
    (.unknown, .no) => .unknown        (.unknown, .unknown) => .unknown
    (.unknown, .conflict) => .conflict (.conflict, .yes) => .yes
    (.conflict, .no) => .conflict      (.conflict, .unknown) => .conflict
    (.conflict, .conflict) => .conflict
-/
def or : Verdict → Verdict → Verdict
  | .yes, _ => .yes
  | .no, .yes => .yes
  | .no, .no => .no
  | .no, .unknown => .unknown
  | .no, .conflict => .conflict
  | .unknown, .yes => .yes
  | .unknown, .no => .unknown
  | .unknown, .unknown => .unknown
  | .unknown, .conflict => .conflict
  | .conflict, .yes => .yes
  | .conflict, .no => .conflict
  | .conflict, .unknown => .conflict
  | .conflict, .conflict => .conflict

-- ---------- truth-table identities (closed terms; decided) ----------

theorem not_yes     : not yes = no            := rfl
theorem not_no      : not no  = yes           := rfl
theorem not_unknown : not unknown = unknown   := rfl
theorem not_conflict: not conflict = conflict  := rfl

theorem and_yes_yes : and yes yes = yes       := rfl
theorem and_yes_unknown : and yes unknown = unknown := rfl
theorem and_unknown_yes : and unknown yes = unknown := rfl
theorem and_unknown_unknown : and unknown unknown = unknown := rfl
theorem and_no_yes  : and no yes  = no        := rfl
theorem and_yes_no  : and yes no  = no        := rfl
theorem and_conflict_yes : and conflict yes = conflict := rfl
theorem and_conflict_no  : and conflict no  = no  := rfl
theorem and_no_conflict  : and no conflict  = no  := rfl
theorem and_unknown_no   : and unknown no   = no  := rfl
theorem and_no_unknown   : and no unknown   = no  := rfl

theorem or_yes_yes  : or yes yes = yes        := rfl
theorem or_yes_unknown : or yes unknown = yes := rfl
theorem or_unknown_yes : or unknown yes = yes := rfl
theorem or_unknown_no  : or unknown no  = unknown := rfl
theorem or_yes_no   : or yes no   = yes        := rfl
theorem or_no_yes   : or no yes   = yes        := rfl
theorem or_unknown_unknown : or unknown unknown = unknown := rfl
theorem or_conflict_yes : or conflict yes = yes := rfl
theorem or_conflict_no  : or conflict no  = conflict := rfl
theorem or_no_conflict  : or no conflict  = conflict := rfl
theorem or_unknown_no_left : or no unknown = unknown := rfl

-- ---------- algebraic laws ----------

theorem not_not (v : Verdict) : not (not v) = v := by
  cases v <;> rfl

theorem and_comm (a b : Verdict) : and a b = and b a := by
  cases a <;> cases b <;> rfl

theorem or_comm (a b : Verdict) : or a b = or b a := by
  cases a <;> cases b <;> rfl

theorem and_no_left (v : Verdict) : and no v = no := rfl
theorem or_yes_left (v : Verdict) : or yes v = yes := rfl
theorem and_yes_left (v : Verdict) : and yes v = v := rfl
theorem or_no_left (v : Verdict) : or no v = v := by cases v <;> rfl
theorem or_yes_right (v : Verdict) : or v yes = yes := by cases v <;> rfl
theorem or_no_right (v : Verdict) : or v no = v := by cases v <;> rfl
theorem and_yes_right (v : Verdict) : and v yes = v := by cases v <;> rfl
theorem and_no_right (v : Verdict) : and v no = no := by cases v <;> rfl
theorem or_conflict_yes_iff (v : Verdict) : or conflict v = yes ↔ v = yes := by cases v <;> decide
theorem or_unknown_yes_iff (v : Verdict) : or unknown v = yes ↔ v = yes := by cases v <;> decide

theorem unknown_ne_no : Not (unknown = no) := by decide
theorem unknown_ne_yes : Not (unknown = yes) := by decide
theorem unknown_ne_conflict : Not (unknown = conflict) := by decide
theorem conflict_ne_yes : Not (conflict = yes) := by decide
theorem conflict_ne_no : Not (conflict = no) := by decide
theorem no_ne_yes : Not (no = yes) := by decide
theorem no_ne_conflict : Not (no = conflict) := by decide
theorem yes_ne_no : Not (yes = no) := by decide
theorem yes_ne_conflict : Not (yes = conflict) := by decide
theorem yes_ne_unknown : Not (yes = unknown) := by decide

theorem and_crisp {a b : Verdict} (ha : a = yes ∨ a = no) (hb : b = yes ∨ b = no) :
    (and a b = yes ↔ (a = yes ∧ b = yes)) := by
  cases ha <;> cases hb <;> subst_vars <;> decide

theorem and_unknown_cannot_yield_yes (a b : Verdict)
    (h : a = unknown ∨ b = unknown) : and a b ≠ yes := by
  cases a <;> cases b <;> cases h <;> first | contradiction | decide

theorem or_unknown_cannot_yield_no (a b : Verdict)
    (h : a = unknown ∨ b = unknown) : or a b ≠ no := by
  cases a <;> cases b <;> cases h <;> first | contradiction | decide

theorem and_conflict_of_ne_no (a : Verdict) (ha : a ≠ no) : and conflict a = conflict := by
  cases a <;> first | rfl | simp at ha

theorem and_or_distrib_yes (b c : Verdict) : and yes (or b c) = or b c := by
  cases b <;> cases c <;> rfl

theorem verdict_cases (v : Verdict) : v = yes ∨ v = no ∨ v = unknown ∨ v = conflict := by
  cases v <;> decide

end Verdict
end JapanTaxLaw
