import JapanTaxLaw.TableLabelsAndTerms
import JapanTaxLaw.TableLabelsAndTermsSpec

/-!
# TableLabelsAndTermsTests — 欄・見出し・用語・記載項目
-/
namespace JapanTaxLaw.TableLabelsAndTermsTests

open JapanTaxLaw.TableLabelsAndTerms

theorem column_spec (n : Nat) :
    n = JapanTaxLaw.TableLabelsAndTermsSpec.columnSpec n := by rfl

theorem term_spec (t : Nat) :
    termRef t = JapanTaxLaw.TableLabelsAndTermsSpec.termSpec t := by rfl

example : parseColumn "第一欄" = some 1 := parse_column_1
example : parseColumn "第四欄" = some 4 := parse_column_4
example : (parseTableHeader "Ａ　測定単位の数値").map Prod.fst = some 1 := parse_header_a
example (t : Nat) : termRef t = t := term_ref_identity t
example : fieldDeclared = true := field_is_declaration

end JapanTaxLaw.TableLabelsAndTermsTests
