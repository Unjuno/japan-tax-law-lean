import JapanTaxLaw.ForeignVessel24HourDeparture

/-
# ForeignVessel24HourDepartureSpec — 関税法施行規則 2の2(3)(4) の独立定式

Pinned: law 341M50000040055, revision 341M50000040055_20260601_508M60000040016,
Article 2_2 Paragraph 3 Item 4; needle 「…入港の時から二十四時間以内に
出港する場合」.

Independent restatement: departure is within the window when the elapsed whole
hours do not exceed twenty-four. Definitions use their own numeral/identifier;
agreement is a separate bridge.
-/

namespace JapanTaxLaw.ForeignVessel24HourDeparture

/-- 独立定式: 二十四 = 24。 -/
def spec24 : Nat := 24

/-- 独立定式: elapsed <= 24（以内）。 -/
def specWithin24 (hours : Nat) : Bool :=
  hours <= spec24

theorem agreeLimit : hourLimit = spec24 := by
  unfold hourLimit spec24
  rfl

theorem agreeWithin (hours : Nat) : within24h hours = specWithin24 hours := by
  unfold within24h specWithin24
  rw [agreeLimit]

example : specWithin24 24 = true := by decide
example : specWithin24 25 = false := by decide

end JapanTaxLaw.ForeignVessel24HourDeparture
