import JapanTaxLaw.TreatyJPUSRoyalties
import JapanTaxLaw.TreatyJPUSRoyaltiesSpec

/-!
# TreatyJPUSRoyaltiesTests — 第十二条（使用料）
-/
namespace JapanTaxLaw.TreatyJPUSRoyaltiesTests
open JapanTaxLaw.TreatyJPUSRoyalties

theorem art7_applies_spec (pe link : Bool) : article7Applies pe link = JapanTaxLaw.TreatyJPUSRoyaltiesSpec.article7AppliesSpec pe link := by rfl
theorem excess_cap_spec : royaltyExcessCap = JapanTaxLaw.TreatyJPUSRoyaltiesSpec.royaltyExcessCapSpec := rfl
theorem within_excess_spec (r : Nat) : withinRoyaltyExcessCap r = JapanTaxLaw.TreatyJPUSRoyaltiesSpec.withinRoyaltyExcessCapSpec r := by
  unfold withinRoyaltyExcessCap JapanTaxLaw.TreatyJPUSRoyaltiesSpec.withinRoyaltyExcessCapSpec
  by_cases h : r <= 5 <;> simp [h, royaltyExcessCap]
theorem excess_spec (p n : Nat) : royaltyExcess p n = JapanTaxLaw.TreatyJPUSRoyaltiesSpec.royaltyExcessSpec p n := rfl
example : sourceTaxOnOrdinaryRoyalty = false := ordinary_royalty_no_source_tax
example : article7Applies true true = true := pe_real_link_switches_to_art7
example : article7Applies false true = false := no_pe_stays_art12
example : article7Applies true false = false := no_real_link_stays_art12
example : withinRoyaltyExcessCap 5 = true := five_within_royalty_excess
example : withinRoyaltyExcessCap 10 = false := ten_exceeds_royalty_excess
example (n : Nat) : royaltyExcess n n = 0 := royalty_excess_zero_when_equal n
example (p n : Nat) (h : n < p) : royaltyExcess p n > 0 := royalty_excess_positive p n h
example : royaltiesDeclared = true := royalties_is_declaration

end JapanTaxLaw.TreatyJPUSRoyaltiesTests
