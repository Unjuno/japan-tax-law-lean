import JapanTaxLaw.TermAliasNorms
import JapanTaxLaw.TermAliasNormsSpec

/-!
# TermAliasNormsTests — 用語の定義
-/
namespace JapanTaxLaw.TermAliasNormsTests
open JapanTaxLaw.TermAliasNorms

theorem alias_spec (a b : TermId) : aliasOf a b = JapanTaxLaw.TermAliasNormsSpec.aliasOfSpec a b := by rfl
theorem intro_spec (d : TermId) : aliasIntro d = JapanTaxLaw.TermAliasNormsSpec.aliasIntroSpec d := by rfl
example (x : TermId) : aliasOf x x = true := alias_refl x
example (x y : TermId) (h : aliasOf x y = true) : aliasOf y x = true := alias_symm x y h
example (x y z : TermId) (hxy : aliasOf x y = true) (hyz : aliasOf y z = true) : aliasOf x z = true := alias_trans x y z hxy hyz
example (d : TermId) : aliasIntro d = d := alias_intro_deterministic d
example (d a b : TermId) (ha : a = aliasIntro d) (hb : b = aliasIntro d) : a = b := same_defn_same_alias d a b ha hb
example : termAliasDeclared = true := term_alias_is_declaration

end JapanTaxLaw.TermAliasNormsTests
