import JapanTaxLaw.LocalTaxArt48To50DeletedRangeSpec

/-!
# LocalTaxArt48To50DeletedRangeTests — kernel-checked checks

Verifies STRUCTURE 「第四十八条から第五十条まで」: articles 48/49/50 in the deleted
range; 47 and 51 outside it.
-/

namespace JapanTaxLaw.LocalTaxArt48To50DeletedRange

example : inDeletedRange 48 = true := art_lo_deleted
example : inDeletedRange 49 = true := art_mid_deleted
example : inDeletedRange 50 = true := art_hi_deleted
example : inDeletedRange 47 = false := art_before_not_deleted
example : inDeletedRange 51 = false := art_after_not_deleted
example : SpecDeletedRange 48 := spec_lo
example : SpecDeletedRange 49 := spec_mid
example : SpecDeletedRange 50 := spec_hi
example : (inDeletedRange 48 = true) ↔ SpecDeletedRange 48 := agree_lo
example : (inDeletedRange 50 = true) ↔ SpecDeletedRange 50 := agree_hi

end JapanTaxLaw.LocalTaxArt48To50DeletedRange
