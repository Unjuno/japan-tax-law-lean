import JapanTaxLaw.LegalStructuralMarkers
import JapanTaxLaw.LegalStructuralMarkersSpec

/-!
# LegalStructuralMarkersTests — 構造マーカーの序数·年号をカーネル検証

These units remain PROVED_SCOPE: only ordinal/structural claims are proven.
-/
namespace JapanTaxLaw.LegalStructuralMarkersTests

open JapanTaxLaw.LegalStructuralMarkers

example : markerDeclared = true := rfl
example : effectiveOffset false = 0 := effective_on_promulgate
example : effectiveOffset true = 1 := effective_next_day

example : latinOrdinal 'Ａ' = JapanTaxLaw.LegalStructuralMarkersSpec.lookup JapanTaxLaw.LegalStructuralMarkersSpec.latinTable 'Ａ' := by decide
example : latinOrdinal 'Ａ' = some 1 := by decide
example : latinOrdinal 'Ｂ' = JapanTaxLaw.LegalStructuralMarkersSpec.lookup JapanTaxLaw.LegalStructuralMarkersSpec.latinTable 'Ｂ' := by decide
example : latinOrdinal 'Ｂ' = some 2 := by decide
example : latinOrdinal 'Ｃ' = JapanTaxLaw.LegalStructuralMarkersSpec.lookup JapanTaxLaw.LegalStructuralMarkersSpec.latinTable 'Ｃ' := by decide
example : latinOrdinal 'Ｃ' = some 3 := by decide
example : latinOrdinal 'Ｄ' = JapanTaxLaw.LegalStructuralMarkersSpec.lookup JapanTaxLaw.LegalStructuralMarkersSpec.latinTable 'Ｄ' := by decide
example : latinOrdinal 'Ｄ' = some 4 := by decide
example : latinOrdinal 'Ｅ' = JapanTaxLaw.LegalStructuralMarkersSpec.lookup JapanTaxLaw.LegalStructuralMarkersSpec.latinTable 'Ｅ' := by decide
example : latinOrdinal 'Ｅ' = some 5 := by decide
example : latinOrdinal 'Ｆ' = JapanTaxLaw.LegalStructuralMarkersSpec.lookup JapanTaxLaw.LegalStructuralMarkersSpec.latinTable 'Ｆ' := by decide
example : latinOrdinal 'Ｆ' = some 6 := by decide
example : latinOrdinal 'Ｇ' = JapanTaxLaw.LegalStructuralMarkersSpec.lookup JapanTaxLaw.LegalStructuralMarkersSpec.latinTable 'Ｇ' := by decide
example : latinOrdinal 'Ｇ' = some 7 := by decide
example : latinOrdinal 'Ｈ' = JapanTaxLaw.LegalStructuralMarkersSpec.lookup JapanTaxLaw.LegalStructuralMarkersSpec.latinTable 'Ｈ' := by decide
example : latinOrdinal 'Ｈ' = some 8 := by decide
example : latinOrdinal 'Ｉ' = JapanTaxLaw.LegalStructuralMarkersSpec.lookup JapanTaxLaw.LegalStructuralMarkersSpec.latinTable 'Ｉ' := by decide
example : latinOrdinal 'Ｉ' = some 9 := by decide
example : latinOrdinal 'Ｊ' = JapanTaxLaw.LegalStructuralMarkersSpec.lookup JapanTaxLaw.LegalStructuralMarkersSpec.latinTable 'Ｊ' := by decide
example : latinOrdinal 'Ｊ' = some 10 := by decide
example : latinOrdinal 'Ｋ' = JapanTaxLaw.LegalStructuralMarkersSpec.lookup JapanTaxLaw.LegalStructuralMarkersSpec.latinTable 'Ｋ' := by decide
example : latinOrdinal 'Ｋ' = some 11 := by decide
example : latinOrdinal 'Ｌ' = JapanTaxLaw.LegalStructuralMarkersSpec.lookup JapanTaxLaw.LegalStructuralMarkersSpec.latinTable 'Ｌ' := by decide
example : latinOrdinal 'Ｌ' = some 12 := by decide
example : latinOrdinal 'Ｍ' = JapanTaxLaw.LegalStructuralMarkersSpec.lookup JapanTaxLaw.LegalStructuralMarkersSpec.latinTable 'Ｍ' := by decide
example : latinOrdinal 'Ｍ' = some 13 := by decide
example : latinOrdinal 'Ｎ' = JapanTaxLaw.LegalStructuralMarkersSpec.lookup JapanTaxLaw.LegalStructuralMarkersSpec.latinTable 'Ｎ' := by decide
example : latinOrdinal 'Ｎ' = some 14 := by decide
example : latinOrdinal 'Ｏ' = JapanTaxLaw.LegalStructuralMarkersSpec.lookup JapanTaxLaw.LegalStructuralMarkersSpec.latinTable 'Ｏ' := by decide
example : latinOrdinal 'Ｏ' = some 15 := by decide
example : latinOrdinal 'Ｐ' = JapanTaxLaw.LegalStructuralMarkersSpec.lookup JapanTaxLaw.LegalStructuralMarkersSpec.latinTable 'Ｐ' := by decide
example : latinOrdinal 'Ｐ' = some 16 := by decide
example : latinOrdinal 'Ｑ' = JapanTaxLaw.LegalStructuralMarkersSpec.lookup JapanTaxLaw.LegalStructuralMarkersSpec.latinTable 'Ｑ' := by decide
example : latinOrdinal 'Ｑ' = some 17 := by decide
example : latinOrdinal 'Ｒ' = JapanTaxLaw.LegalStructuralMarkersSpec.lookup JapanTaxLaw.LegalStructuralMarkersSpec.latinTable 'Ｒ' := by decide
example : latinOrdinal 'Ｒ' = some 18 := by decide
example : latinOrdinal 'Ｓ' = JapanTaxLaw.LegalStructuralMarkersSpec.lookup JapanTaxLaw.LegalStructuralMarkersSpec.latinTable 'Ｓ' := by decide
example : latinOrdinal 'Ｓ' = some 19 := by decide
example : latinOrdinal 'Ｔ' = JapanTaxLaw.LegalStructuralMarkersSpec.lookup JapanTaxLaw.LegalStructuralMarkersSpec.latinTable 'Ｔ' := by decide
example : latinOrdinal 'Ｔ' = some 20 := by decide
example : latinOrdinal 'Ｕ' = JapanTaxLaw.LegalStructuralMarkersSpec.lookup JapanTaxLaw.LegalStructuralMarkersSpec.latinTable 'Ｕ' := by decide
example : latinOrdinal 'Ｕ' = some 21 := by decide
example : latinOrdinal 'Ｖ' = JapanTaxLaw.LegalStructuralMarkersSpec.lookup JapanTaxLaw.LegalStructuralMarkersSpec.latinTable 'Ｖ' := by decide
example : latinOrdinal 'Ｖ' = some 22 := by decide
example : latinOrdinal 'Ｗ' = JapanTaxLaw.LegalStructuralMarkersSpec.lookup JapanTaxLaw.LegalStructuralMarkersSpec.latinTable 'Ｗ' := by decide
example : latinOrdinal 'Ｗ' = some 23 := by decide
example : latinOrdinal 'Ｘ' = JapanTaxLaw.LegalStructuralMarkersSpec.lookup JapanTaxLaw.LegalStructuralMarkersSpec.latinTable 'Ｘ' := by decide
example : latinOrdinal 'Ｘ' = some 24 := by decide
example : latinOrdinal 'Ｙ' = JapanTaxLaw.LegalStructuralMarkersSpec.lookup JapanTaxLaw.LegalStructuralMarkersSpec.latinTable 'Ｙ' := by decide
example : latinOrdinal 'Ｙ' = some 25 := by decide
example : latinOrdinal 'Ｚ' = JapanTaxLaw.LegalStructuralMarkersSpec.lookup JapanTaxLaw.LegalStructuralMarkersSpec.latinTable 'Ｚ' := by decide
example : latinOrdinal 'Ｚ' = some 26 := by decide
example : reiwaYear "令元" = JapanTaxLaw.LegalStructuralMarkersSpec.lookupStr JapanTaxLaw.LegalStructuralMarkersSpec.reiwaTable "令元" := by decide
example : reiwaYear "令元" = some 1 := by decide
example : reiwaYear "令２" = JapanTaxLaw.LegalStructuralMarkersSpec.lookupStr JapanTaxLaw.LegalStructuralMarkersSpec.reiwaTable "令２" := by decide
example : reiwaYear "令２" = some 2 := by decide
example : reiwaYear "令３" = JapanTaxLaw.LegalStructuralMarkersSpec.lookupStr JapanTaxLaw.LegalStructuralMarkersSpec.reiwaTable "令３" := by decide
example : reiwaYear "令３" = some 3 := by decide
example : reiwaYear "令４" = JapanTaxLaw.LegalStructuralMarkersSpec.lookupStr JapanTaxLaw.LegalStructuralMarkersSpec.reiwaTable "令４" := by decide
example : reiwaYear "令４" = some 4 := by decide
example : reiwaYear "令５" = JapanTaxLaw.LegalStructuralMarkersSpec.lookupStr JapanTaxLaw.LegalStructuralMarkersSpec.reiwaTable "令５" := by decide
example : reiwaYear "令５" = some 5 := by decide
example : reiwaYear "令６" = JapanTaxLaw.LegalStructuralMarkersSpec.lookupStr JapanTaxLaw.LegalStructuralMarkersSpec.reiwaTable "令６" := by decide
example : reiwaYear "令６" = some 6 := by decide
example : reiwaYear "令７" = JapanTaxLaw.LegalStructuralMarkersSpec.lookupStr JapanTaxLaw.LegalStructuralMarkersSpec.reiwaTable "令７" := by decide
example : reiwaYear "令７" = some 7 := by decide

end JapanTaxLaw.LegalStructuralMarkersTests
