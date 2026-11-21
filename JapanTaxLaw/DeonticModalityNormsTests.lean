import JapanTaxLaw.DeonticModalityNorms
import JapanTaxLaw.DeonticModalityNormsSpec

/-!
# DeonticModalityNormsTests — 義務・許可・禁止
-/
namespace JapanTaxLaw.DeonticModalityNormsTests

open JapanTaxLaw.DeonticModalityNorms

theorem obligation_spec (d : Bool) :
    obligationFulfilled d = JapanTaxLaw.DeonticModalityNormsSpec.obligationSpec d := by rfl

theorem prohibition_spec (d : Bool) :
    prohibitedActDone d = JapanTaxLaw.DeonticModalityNormsSpec.prohibitionSpec d := by rfl

example : obligationFulfilled true = true := obligation_kept
example : obligationFulfilled false = false := obligation_broken
example : isAllowed .allowed = true := allowed_is_allowed
example : isAllowed .forbidden = false := forbidden_not_allowed
example : prohibitedActDone true = true := prohibition_violated
example : prohibitedActDone false = false := prohibition_respected
example : Modality.obligation ≠ Modality.permission := modalities_distinct
example : Modality.permission ≠ Modality.prohibition := permission_ne_prohibition
example : modalityDeclared = true := modality_is_declaration

end JapanTaxLaw.DeonticModalityNormsTests
