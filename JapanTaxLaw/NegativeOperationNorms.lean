/-\!
# NegativeOperationNorms — 否定操作（…しない。）68 units, PROVED_SCOPE

68 clauses across tax laws ending 「…しない。」— each is a negative operation:
an action explicitly NOT performed (算入しない 'not included', 要しない 'not
required', 徴収しない 'not collected', 猶予しない 'not deferred', 適用しない
'not applied'). Only the negation structure is kernel-proven (a negative operation
is the complement of the positive operation; negative and positive operations are
exclusive; double negation yields the positive; negative operations compose under
conjunction); the concrete operations and their objects are NOT MODELLED. Hence
PROVED_SCOPE.
-/
namespace JapanTaxLaw.NegativeOperationNorms

-- 肯定操作（比較用）
def positiveOp (p : Bool) : Bool := p
-- 否定操作：操作を行わない
def negativeOp (p : Bool) : Bool := !p

theorem negative_when_absent : negativeOp false = true := by decide
theorem negative_fails_when_present : negativeOp true = false := by decide

-- 二重否定は肯定操作
theorem double_negation (p : Bool) : negativeOp (negativeOp p) = positiveOp p := by
  cases p <;> rfl

-- 肯定・否定操作は排他的
theorem pos_neg_exclusive (p : Bool) : ¬ (positiveOp p = true ∧ negativeOp p = true) := by
  cases p <;> simp [positiveOp, negativeOp]

-- 複数の否定操作の合成（すべてを行わない）
def allNegative (a b : Bool) : Bool := a && b
theorem all_both : allNegative true true = true := by decide
theorem all_one_positive : allNegative true false = false := by decide

-- 否定操作が成立すれば対応する肯定操作は成立しない
theorem negative_excludes_positive (p : Bool) (h : negativeOp p = true) : positiveOp p = false := by
  cases p <;> simp [negativeOp, positiveOp] at h ⊢

def negativeOperationDeclared : Bool := true
theorem negative_operation_is_declaration : negativeOperationDeclared = true := rfl

end JapanTaxLaw.NegativeOperationNorms
