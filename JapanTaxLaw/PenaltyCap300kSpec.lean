import JapanTaxLaw.PenaltyCap300k

/-!
# Independent spec — art. 30 fine cap

The spec restates 「三十万円以下」 as the negation of the strict excess test.
Agreement is universal over all Nat fine amounts.
-/
namespace JapanTaxLaw.PenaltyCap300k

def specWithinCap (fineYen : Nat) : Bool :=
  !decide (capYen < fineYen)

theorem agree_spec_impl (fineYen : Nat) : specWithinCap fineYen = withinCap fineYen := by
  unfold specWithinCap withinCap
  by_cases h : fineYen <= capYen
  · have hn : ¬ capYen < fineYen := Nat.not_lt.mpr h
    simp [h, hn]
  · have hle : capYen < fineYen := Nat.lt_of_not_ge h
    simp [h, hle]

end JapanTaxLaw.PenaltyCap300k
