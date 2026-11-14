import JapanTaxLaw.StatutoryModel

/-!
# Excluded-fiction characterization (enum-level)

A case-by-case proof of the two affirmative characterizations of
`excludedFromFiction`, useful for the specification of Entered Evidence.
-/

namespace JapanTaxLaw

/-- If the exclusion from the deemed-domicile fiction is established, the
    person is Japanese-national residing abroad as a permanent resident. -/
theorem excludedFromFiction_no (f : DomicileFacts)
    (hEx : excludedFromFiction f = .no) :
    f.japaneseNational = .yes ∧ f.order13PermanentAbroad = .no := by
  unfold excludedFromFiction at hEx
  cases a : f.japaneseNational with
  | yes =>
      cases b : f.order13PermanentAbroad with
      | yes =>
          have h13 : order13Person f = .yes := by
            unfold order13Person
            rw [a, b]
            rfl
          rw [a, h13] at hEx
          exact absurd hEx (by decide)
      | no =>
          have h13 : order13Person f = .no := by
            unfold order13Person
            rw [a, b]
            rfl
          rw [a, h13] at hEx
          exact ⟨rfl, rfl⟩
      | unknown =>
          have h13 : order13Person f = .unknown := by
            unfold order13Person
            rw [a, b]
            rfl
          rw [a, h13] at hEx
          exact absurd hEx (by decide)
      | conflict =>
          have h13 : order13Person f = .conflict := by
            unfold order13Person
            rw [a, b]
            rfl
          rw [a, h13] at hEx
          exact absurd hEx (by decide)
  | no =>
      rw [a] at hEx
      cases o : order13Person f with
      | yes => rw [o] at hEx; exact absurd hEx (by decide)
      | no => rw [o] at hEx; exact absurd hEx (by decide)
      | unknown => rw [o] at hEx; exact absurd hEx (by decide)
      | conflict => rw [o] at hEx; exact absurd hEx (by decide)
  | unknown =>
      cases o : order13Person f with
      | yes =>
          unfold order13Person at o
          rw [a] at o
          have hcons : Verdict.and Verdict.unknown f.order13PermanentAbroad ≠ Verdict.yes := by
            cases f.order13PermanentAbroad <;> decide
          exact absurd o hcons
      | no =>
          rw [a, o] at hEx
          exact absurd hEx (by decide)
      | unknown =>
          rw [a, o] at hEx
          exact absurd hEx (by decide)
      | conflict =>
          rw [a, o] at hEx
          exact absurd hEx (by decide)
  | conflict =>
      unfold order13Person at hEx
      rw [a] at hEx
      have hcons : Verdict.or Verdict.conflict (Verdict.and Verdict.conflict f.order13PermanentAbroad) ≠ Verdict.no := by
        cases f.order13PermanentAbroad <;> decide
      exact absurd hEx hcons

/-- If the exclusion from the fiction is affirmatively established, then either
    the person is not a Japanese national, or (Japanese national and recognized
    permanent abroad resident). -/
theorem excludedFromFiction_yes (f : DomicileFacts)
    (hEx : excludedFromFiction f = .yes) :
    (f.japaneseNational = .no ∨ f.japaneseNational = .yes ∧ f.order13PermanentAbroad = .yes) := by
  unfold excludedFromFiction at hEx
  cases a : f.japaneseNational with
  | yes =>
      cases b : f.order13PermanentAbroad with
      | yes =>
          rw [a] at hEx
          have h13 : order13Person f = .yes := by
            unfold order13Person
            rw [a, b]
            rfl
          rw [h13] at hEx
          exact Or.inr ⟨rfl, rfl⟩
      | no =>
          rw [a] at hEx
          have h13 : order13Person f = .no := by
            unfold order13Person
            rw [a, b]
            rfl
          rw [h13] at hEx
          exact absurd hEx (by decide)
      | unknown =>
          rw [a] at hEx
          have h13 : order13Person f = .unknown := by
            unfold order13Person
            rw [a, b]
            rfl
          rw [h13] at hEx
          exact absurd hEx (by decide)
      | conflict =>
          rw [a] at hEx
          have h13 : order13Person f = .conflict := by
            unfold order13Person
            rw [a, b]
            rfl
          rw [h13] at hEx
          exact absurd hEx (by decide)
  | no =>
      rw [a] at hEx
      exact Or.inl rfl
  | unknown =>
      cases o : order13Person f with
      | yes =>
          unfold order13Person at o
          rw [a] at o
          have hcons : Verdict.and Verdict.unknown f.order13PermanentAbroad ≠ Verdict.yes := by
            cases f.order13PermanentAbroad <;> decide
          exact absurd o hcons
      | no =>
          rw [a, o] at hEx
          exact absurd hEx (by decide)
      | unknown =>
          rw [a, o] at hEx
          exact absurd hEx (by decide)
      | conflict =>
          rw [a, o] at hEx
          exact absurd hEx (by decide)
  | conflict =>
      cases o : order13Person f with
      | yes =>
          unfold order13Person at o
          rw [a] at o
          have hcons : Verdict.and Verdict.conflict f.order13PermanentAbroad ≠ Verdict.yes := by
            cases f.order13PermanentAbroad <;> decide
          exact absurd o hcons
      | no =>
          rw [a, o] at hEx
          exact absurd hEx (by decide)
      | unknown =>
          rw [a, o] at hEx
          exact absurd hEx (by decide)
      | conflict =>
          rw [a, o] at hEx
          exact absurd hEx (by decide)

end JapanTaxLaw
