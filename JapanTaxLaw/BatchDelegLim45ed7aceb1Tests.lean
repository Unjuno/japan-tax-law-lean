import JapanTaxLaw.BatchDelegLim45ed7aceb1Spec

namespace JapanTaxLaw.BatchDelegLim45ed7aceb1

example : applies 0 0 = true := at_limit 0
example : applies 5 5 = true := at_limit 5
example : specApplies 5 6 = applies 5 6 := agree_spec_impl 5 6
example : specApplies 5 5 = applies 5 5 := agree_spec_impl 5 5
example : applies 9 3 = true := monotone 5 9 3 (by decide) (by decide)

end JapanTaxLaw.BatchDelegLim45ed7aceb1
