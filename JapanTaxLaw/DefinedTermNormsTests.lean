import JapanTaxLaw.DefinedTermNorms
import JapanTaxLaw.DefinedTermNormsSpec

/-!
# DefinedTermNormsTests — 定義語バインディング
-/
namespace JapanTaxLaw.DefinedTermNormsTests

open JapanTaxLaw.DefinedTermNorms

theorem denotes_spec (a d : Nat) :
    denotes a d = JapanTaxLaw.DefinedTermNormsSpec.denotesSpec a d := rfl
example (a d : Nat) : denotes a d = d := alias_denotes a d
example {a d d' : Nat} (h : d = d') : denotes a d = denotes a d' := alias_congr h
example (a1 a2 d : Nat) (h : a1 != a2) : denotes a1 d = denotes a2 d := alias_distinct_labels a1 a2 d h
example : definedTermDeclared = true := defined_term_is_declaration

end JapanTaxLaw.DefinedTermNormsTests
