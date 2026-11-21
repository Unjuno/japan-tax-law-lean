import JapanTaxLaw.ShortLabelsAndTerms
import JapanTaxLaw.ShortLabelsAndTermsSpec

/-!
# ShortLabelsAndTermsTests — 短いラベルの序数
-/
namespace JapanTaxLaw.ShortLabelsAndTermsTests

open JapanTaxLaw.ShortLabelsAndTerms

example : fullWidthLatinOrdinal 'ｎ' = some 14 := n_ordinal
example : kanaOrdinalShort 'あ' = some 1 := kana_a
example : kanaOrdinalShort 'ゆ' = some 37 := kana_yu
example : shortTermDeclared = true := short_term_is_declaration

end JapanTaxLaw.ShortLabelsAndTermsTests
