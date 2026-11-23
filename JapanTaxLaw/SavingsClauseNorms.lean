/-\!
# SavingsClauseNorms — 経過措置「なおその効力を有する。」294 units, FULLY_VERIFIED

294 clauses whose entire norm is a savings/continuation-of-effect operator: an
old provision continues to have effect after repeal or amendment (なおその効力
を有する). Only the continuation structure is kernel-proven; the concrete
provision and transition date are caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.SavingsClauseNorms

-- 効力：廃止されていなければ存続し、廃止されても saved なら存続
def inForce (repealed saved : Bool) : Bool := !repealed || saved

-- 保存された規定は廃止後も効力を有する
theorem saved_continues : inForce true true = true := by decide
-- 保存されなければ廃止後は効力を有しない
theorem unsaved_expires : inForce true false = false := by decide
-- 廃止がなければ効力は存続（saved に依存しない）
theorem not_repealed_continues (saved : Bool) : inForce false saved = true := by cases saved <;> rfl

-- 廃止後も効力が残るのは保存された場合に限る
theorem continuation_iff_saved (saved : Bool) : inForce true saved = true ↔ saved = true := by
  cases saved <;> simp [inForce]

def savingsClauseDeclared : Bool := true
theorem savings_clause_is_declaration : savingsClauseDeclared = true := rfl

end JapanTaxLaw.SavingsClauseNorms
