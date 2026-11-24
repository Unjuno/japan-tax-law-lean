import JapanTaxLaw.PresumptionNoDocuments

/-!
# Independent spec — art. 40の4(3) presumption

The spec restates the presumption as a two-branch conditional; agreement with
the implementation's boolean negation is exhaustive over Bool.
-/
namespace JapanTaxLaw.PresumptionNoDocuments

def specPresume (submitted : Bool) : Bool :=
  if submitted then false else true

theorem agree_spec_impl (submitted : Bool) : specPresume submitted = presumeNotApplicable submitted := by
  cases submitted <;> rfl

end JapanTaxLaw.PresumptionNoDocuments
