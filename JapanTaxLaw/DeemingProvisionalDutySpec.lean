import JapanTaxLaw.DeemingProvisionalDuty

/-!
# Independent spec — art. 8(3) deeming

The spec restates the deeming as a two-branch conditional rather than the
implementation's identity function. Agreement is proved for both Bool values,
i.e. exhaustively over the declared input domain.
-/
namespace JapanTaxLaw.DeemingProvisionalDuty

def specDeem (paid : Bool) : Bool :=
  if paid then true else false

theorem agree_spec_impl (paid : Bool) : specDeem paid = deemPaid paid := by
  cases paid <;> rfl

end JapanTaxLaw.DeemingProvisionalDuty
