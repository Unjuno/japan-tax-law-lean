import JapanTaxLaw.TransitionalApplicationStructure
import JapanTaxLaw.TransitionalApplicationStructureSpec

/-!
# TransitionalApplicationStructureTests — 経過適用の構造
-/
namespace JapanTaxLaw.TransitionalApplicationStructureTests

open JapanTaxLaw.TransitionalApplicationStructure

theorem substitute_spec (x a b : Nat) :
    substituteToken x a b = JapanTaxLaw.TransitionalApplicationStructureSpec.substituteSpec x a b := by rfl

theorem new_spec (d e : Nat) :
    newLawApplies d e = true ↔ JapanTaxLaw.TransitionalApplicationStructureSpec.newLawSpec d e := by
  simp [newLawApplies, JapanTaxLaw.TransitionalApplicationStructureSpec.newLawSpec]

theorem old_spec (d e : Nat) :
    oldLawApplies d e = true ↔ JapanTaxLaw.TransitionalApplicationStructureSpec.oldLawSpec d e := by
  simp [oldLawApplies, JapanTaxLaw.TransitionalApplicationStructureSpec.oldLawSpec]

theorem interim_spec (d s e : Nat) :
    inInterim d s e = true ↔ JapanTaxLaw.TransitionalApplicationStructureSpec.interimSpec d s e := by
  simp [inInterim, JapanTaxLaw.TransitionalApplicationStructureSpec.interimSpec]

theorem except_spec (ex old : Bool) :
    exceptOldLaw ex old = JapanTaxLaw.TransitionalApplicationStructureSpec.exceptSpec ex old := by rfl

example (a b : Nat) : substituteToken a a b = b := substitute_matched a b
example (x a b : Nat) (h : x ≠ a) : substituteToken x a b = x := substitute_unaffected x a b h
example (e : Nat) : newLawApplies e e = true := new_at_enforcement e
example (d e : Nat) (h : d < e) : oldLawApplies d e = true := old_before d e h
example (d e : Nat) : ¬ (newLawApplies d e = true ∧ oldLawApplies d e = true) := new_old_exclusive d e
example (s e : Nat) (h : s < e) : inInterim s s e = true := interim_at_start s e h
example : exceptOldLaw false true = true := except_no_exception
example : exceptOldLaw true true = false := except_with_exception
example : transitionalDeclared = true := transitional_is_declaration

end JapanTaxLaw.TransitionalApplicationStructureTests
