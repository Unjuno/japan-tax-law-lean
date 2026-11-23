import JapanTaxLaw.TreatyJPUSCapitalGains
import JapanTaxLaw.TreatyJPUSCapitalGainsSpec

/-!
# TreatyJPUSCapitalGainsTests — 第十三条（譲渡所得）
-/
namespace JapanTaxLaw.TreatyJPUSCapitalGainsTests
open JapanTaxLaw.TreatyJPUSCapitalGains

theorem gains_spec (i : Bool) : gainsTaxableInSource i = JapanTaxLaw.TreatyJPUSCapitalGainsSpec.gainsTaxableInSourceSpec i := by rfl
theorem immovable_spec (a s u : Bool) : isImmovable a s u = JapanTaxLaw.TreatyJPUSCapitalGainsSpec.isImmovableSpec a s u := by rfl
example : gainsTaxableInSource true = true := immovable_gains_source_tax
example : gainsTaxableInSource false = false := non_immovable_no_source_tax
example : isImmovable true false false = true := art6_property_is_immovable
example : isImmovable false true false = true := share_proxy_is_immovable
example : isImmovable false false true = true := us_rpi_is_immovable
example : isImmovable false false false = false := non_immovable
example (a s u : Bool) (h : a = true) : isImmovable a s u = true := art6_subset_immovable a s u h
example : capitalGainsDeclared = true := capital_gains_is_declaration

end JapanTaxLaw.TreatyJPUSCapitalGainsTests
