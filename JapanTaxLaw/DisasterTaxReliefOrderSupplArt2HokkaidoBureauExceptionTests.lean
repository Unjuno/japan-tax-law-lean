import JapanTaxLaw.DisasterTaxReliefOrderSupplArt2HokkaidoBureauExceptionSpec

/-!
# DisasterTaxReliefOrderSupplArt2HokkaidoBureauExceptionTests — kernel-checked checks

Verifies EXCEPTION 「東北海運局長（山形県又は秋田県の区域に係る処分等又は申請等に係る場合を除く。）」: two listed prefecture areas excepted; others not.
-/

namespace JapanTaxLaw.DisasterTaxReliefOrderSupplArt2HokkaidoBureauException

example : isExcluded Region.firstPrefecture = true := first_excluded
example : isExcluded Region.secondPrefecture = true := second_excluded
example : isExcluded Region.other = false := other_not_excluded
example : SpecExcluded Region.firstPrefecture := spec_first
example : SpecExcluded Region.secondPrefecture := spec_second
example : (isExcluded Region.firstPrefecture = true) ↔ SpecExcluded Region.firstPrefecture := agree_first
example : (isExcluded Region.other = false) ↔ ¬ SpecExcluded Region.other := agree_other

end JapanTaxLaw.DisasterTaxReliefOrderSupplArt2HokkaidoBureauException
