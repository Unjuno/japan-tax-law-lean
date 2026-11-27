import JapanTaxLaw.CustomsTariffArt8Reading7_8_23

/-!
# CustomsTariffArt8Reading7_8_23Spec — independent typed specification

Pinned source identical to the implementation module (関税定率法 art.8(28)).
The incorporated paragraph numbers are restated as a plain `List Nat` read
independently from 「第七項、第八項及び第二十三項」. The specification uses list
membership rather than the implementation's pattern match, and gates on the
condition independently by requiring both the condition and membership.
-/

namespace JapanTaxLaw.CustomsTariffArt8Reading7_8_23

/-- Independent restatement of the incorporated paragraph numbers. -/
def specParagraphs : List Nat := [7, 8, 23]

/-- Independent formulation: membership in the restated list. -/
def specIncorporated (paragraph : Nat) : Bool :=
  specParagraphs.contains paragraph

/-- Independent activation: condition AND membership. -/
def specApplies (investigationStarted : Bool) (paragraph : Nat) : Bool :=
  investigationStarted && specIncorporated paragraph

example : specParagraphs = [7, 8, 23] := by decide
example : specIncorporated 7 = true := by decide
example : specIncorporated 8 = true := by decide
example : specIncorporated 23 = true := by decide
example : specIncorporated 6 = false := by decide
example : specIncorporated 24 = false := by decide
example : specApplies true 8 = true := by decide
example : specApplies false 8 = false := by decide

/-- Kernel-decided agreement on an enumerated grid (finite, not universal). -/
def agreeCustomsTariffArt8Reading7_8_23 : Bool :=
  let paragraphs := [0, 6, 7, 8, 9, 22, 23, 24, 30]
  let conditions := [false, true]
  paragraphs.all fun p =>
    conditions.all fun c =>
      incorporated p == specIncorporated p && applies c p == specApplies c p

example : agreeCustomsTariffArt8Reading7_8_23 = true := by decide

end JapanTaxLaw.CustomsTariffArt8Reading7_8_23
