import JapanTaxLaw.SpecialMeasuresArt42_4CombinedRatioOver10ExceptionSpec

/-!
# SpecialMeasuresArt42_4CombinedRatioOver10ExceptionTests — kernel-checked checks

Verifies EXCEPTION 「合算試験研究費割合が百分の十を超える事業年度（（１）に掲げる事業年度を除く。）」: strict threshold and item-1 carve-out.
-/

namespace JapanTaxLaw.SpecialMeasuresArt42_4CombinedRatioOver10Exception

example : ratioFloor = 10 := floor_is_source
example : ¬ qualifies 10 YearClass.otherYear := at_floor_rejected
example : qualifies 11 YearClass.otherYear := above_floor_other_qualifies
example : ¬ qualifies 11 YearClass.item1Year := above_floor_item1_rejected
example : qualifies 11 YearClass.otherYear ↔ SpecQualifies 11 YearClass.otherYear := qualifies_spec_agreement 11 YearClass.otherYear
example : qualifies 11 YearClass.item1Year ↔ SpecQualifies 11 YearClass.item1Year := qualifies_spec_agreement 11 YearClass.item1Year

end JapanTaxLaw.SpecialMeasuresArt42_4CombinedRatioOver10Exception
