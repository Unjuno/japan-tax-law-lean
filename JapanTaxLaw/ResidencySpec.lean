import JapanTaxLaw.VerdictLemmas
import JapanTaxLaw.Verdict
import JapanTaxLaw.StatutoryModel
import JapanTaxLaw.Excluded

/-!
# Residency specification — independent statement of the residency rule

The specification is written from the statute, independently of the
implementation functions of `StatutoryModel`. It fixes the *sufficient* sources
of an affirmative residency judgment:

* 法的擬制 — deemed domicile under Act art. 3(1),
* 認定済み住所 — domicile established under Act art. 2(1)(iii) first limb,
* 認定済み居所 — one-year-abode established under Act art. 2(1)(iii) second limb,
* 推定 — domestic presumption under Order art. 14 without a competing foreign
         presumption (Order art. 15), no established contrary fact, and an
         internally consistent fiction verdict.

The theorem pair `residency_spec_sound` / `residency_spec_complete` below shows
the implementation agrees with this independently stated specification on the
affirmative side. The negative/doubtful outcomes are exercised by the test suite.
-/

namespace JapanTaxLaw

namespace ResidencySpec

/-- Sufficient sources of an affirmative residency judgment, mirroring the
    statutory text of Act art. 2(1)(iii), Act art. 3(1) and Order art. 14. -/
inductive ResidentJudgment : DomicileFacts → Verdict → Prop
  /-- 法的擬制 (Act art. 3(1)): the person is a public official, is a Japanese
      national, actually resides abroad without Order 13 recognition, and is
      judged under a provision to which the fiction applies.
      The fiction applies regardless of the person's actual domicile. -/
  | fictionOf (f : DomicileFacts)
      (hPO : f.publicOfficial = Verdict.yes)
      (hNat : f.japaneseNational = Verdict.yes)
      (hGap : f.order13PermanentAbroad = Verdict.no)
      (hNotEx : f.targetExcludedProvision = false) :
      ResidentJudgment f Verdict.yes
  /-- 認定済み住所 (Act art. 2(1)(iii), first limb). Requires an internally
      consistent fiction verdict (a fictional conflict would poison the
      domicile verdict instead of establishing domicile affirmatively). -/
  | domicileEstablished (f : DomicileFacts) (h : f.established = Verdict.yes)
      (hFict : fictionVerdict f ≠ Verdict.conflict) :
      ResidentJudgment f Verdict.yes
  /-- 認定済み居所 (Act art. 2(1)(iii), second limb). -/
  | abodeEstablished (f : DomicileFacts) (h : f.abodeOneYear = Verdict.yes) :
      ResidentJudgment f Verdict.yes
  /-- 推定 (Order art. 14): a domestic presumption stands without a competing
      Order art. 15 presumption, the established facts are not adverse, and the
      fiction verdict is not inconsistent. -/
  | presumptionDomesticOnly (f : DomicileFacts)
      (hd : f.order14Presumption = Verdict.yes ∨ f.order14Household = Verdict.yes)
      (hFor : presumptionForeign f = Verdict.no ∨ presumptionForeign f = Verdict.unknown)
      (hFict : fictionVerdict f ≠ Verdict.conflict)
      (hEst : f.established = Verdict.yes ∨ f.established = Verdict.unknown) :
      ResidentJudgment f Verdict.yes

/-- Every judgment in this specification is the affirmative one. -/
theorem judgment_verdict_is_yes (f : DomicileFacts)
    (j : ResidentJudgment f v) : v = Verdict.yes := by
  cases j with
  | fictionOf => rfl
  | domicileEstablished => rfl
  | abodeEstablished => rfl
  | presumptionDomesticOnly => rfl

end ResidencySpec

open ResidencySpec

-- ==================== fiction verdict characterization ====================

/-- The fiction verdict is exactly determined by its inputs. -/
theorem fiction_yes_char (f : DomicileFacts) :
    fictionVerdict f = Verdict.yes ↔
    (f.targetExcludedProvision = false ∧
     f.publicOfficial = Verdict.yes ∧
     f.japaneseNational = Verdict.yes ∧
     f.order13PermanentAbroad = Verdict.no) := by
  constructor
  · intro h
    have hBool : f.targetExcludedProvision = true ∨ f.targetExcludedProvision = false := by
      cases f.targetExcludedProvision <;> simp
    rcases hBool with hT | hF
    · exfalso
      unfold fictionVerdict at h
      rw [hT] at h
      exact Verdict.no_ne_yes h
    · unfold fictionVerdict at h
      rw [hF] at h
      have hPO := (Verdict.and_eq_yes.1 h).1
      have hExNot := (Verdict.and_eq_yes.1 h).2
      have hExNo : excludedFromFiction f = Verdict.no :=
        Verdict.not_eq_yes.1 hExNot
      have hEx' := excludedFromFiction_no f hExNo
      exact ⟨hF, hPO, hEx'.1, hEx'.2⟩
  · intro ⟨hF, hPO, hNat, hGap⟩
    exact public_official_abroad_deemed f hPO hNat hGap hF

-- ==================== small presumption helpers ====================

theorem foreign_yes_outcome_not_yes (f : DomicileFacts)
    (hFor : presumptionForeign f = Verdict.yes) :
    presumptionOutcome (presumptionDomestic f) (presumptionForeign f) ≠ Verdict.yes := by
  cases hDom : presumptionDomestic f with
  | yes => simp [presumptionOutcome, hDom, hFor]
  | no => simp [presumptionOutcome, hDom, hFor]
  | unknown => simp [presumptionOutcome, hDom, hFor]
  | conflict => simp [presumptionOutcome, hDom, hFor]

theorem foreign_conflict_outcome_not_yes (f : DomicileFacts)
    (hDom : presumptionDomestic f = Verdict.yes) (hFor : presumptionForeign f = Verdict.conflict) :
    presumptionOutcome (presumptionDomestic f) (presumptionForeign f) ≠ Verdict.yes := by
  simp [presumptionOutcome, hDom, hFor]

theorem domestic_yes_of_mixed (f : DomicileFacts)
    (hd : f.order14Presumption = Verdict.yes ∨ f.order14Household = Verdict.yes) :
    presumptionDomestic f = Verdict.yes := by
  rcases hd with h | h
  · show presumptionDomestic f = Verdict.yes
    unfold presumptionDomestic
    rw [h]
    exact Verdict.or_yes_left _
  · show presumptionDomestic f = Verdict.yes
    unfold presumptionDomestic
    rw [h]
    exact Verdict.or_yes_right _

-- ==================== soundness and completeness ====================

/-- Specification → implementation: the independently stated sufficient
    conditions are honored by the implementation. -/
theorem residency_spec_sound (f : DomicileFacts)
    (h : ResidentJudgment f Verdict.yes) : residentVerdict f = Verdict.yes := by
  cases h with
  | fictionOf hPO hNat hGap hNotEx =>
      have hFict := public_official_abroad_deemed f hPO hNat hGap hNotEx
      have hd := fiction_yes_dom_yes f hFict
      show Verdict.or (effectiveDomicile f) f.abodeOneYear = Verdict.yes
      rw [hd]
      exact Verdict.or_yes_left _
  | domicileEstablished hEst hFict =>
      cases hf : fictionVerdict f with
      | conflict => exact absurd hf hFict
      | yes =>
          have hd := fiction_yes_dom_yes f hf
          show Verdict.or (effectiveDomicile f) f.abodeOneYear = Verdict.yes
          rw [hd]
          exact Verdict.or_yes_left _
      | no =>
          have hd : effectiveDomicile f = Verdict.yes := by
            simp [effectiveDomicile, hf, hEst]
          show Verdict.or (effectiveDomicile f) f.abodeOneYear = Verdict.yes
          rw [hd]
          exact Verdict.or_yes_left _
      | unknown =>
          have hd : effectiveDomicile f = Verdict.yes := by
            simp [effectiveDomicile, hf, hEst]
          show Verdict.or (effectiveDomicile f) f.abodeOneYear = Verdict.yes
          rw [hd]
          exact Verdict.or_yes_left _
  | abodeEstablished hAbode =>
      show Verdict.or (effectiveDomicile f) f.abodeOneYear = Verdict.yes
      rw [hAbode]
      exact Verdict.or_yes_right _
  | presumptionDomesticOnly hd hFor hFict hEst =>
      cases hf : fictionVerdict f with
      | conflict => exact absurd hf hFict
      | yes =>
          have hd' := fiction_yes_dom_yes f hf
          show Verdict.or (effectiveDomicile f) f.abodeOneYear = Verdict.yes
          rw [hd']
          exact Verdict.or_yes_left _
      | no =>
          have hpd := domestic_yes_of_mixed f hd
          have hd' : effectiveDomicile f = Verdict.yes := by
            rcases hEst with hest | hest
            · simp [effectiveDomicile, hf, hest]
            · cases hFor with
              | inl s => simp [effectiveDomicile, hf, hest, hpd, s, presumptionOutcome]
              | inr s => simp [effectiveDomicile, hf, hest, hpd, s, presumptionOutcome]
          show Verdict.or (effectiveDomicile f) f.abodeOneYear = Verdict.yes
          rw [hd']
          exact Verdict.or_yes_left _
      | unknown =>
          have hpd := domestic_yes_of_mixed f hd
          have hd' : effectiveDomicile f = Verdict.yes := by
            rcases hEst with hest | hest
            · simp [effectiveDomicile, hf, hest]
            · cases hFor with
              | inl s => simp [effectiveDomicile, hf, hest, hpd, s, presumptionOutcome]
              | inr s => simp [effectiveDomicile, hf, hest, hpd, s, presumptionOutcome]
          show Verdict.or (effectiveDomicile f) f.abodeOneYear = Verdict.yes
          rw [hd']
          exact Verdict.or_yes_left _

/-- Implementation → specification: every affirmative implementation outcome is
    witnessed by a sufficient rule (completeness of the spec). -/
theorem residency_spec_complete (f : DomicileFacts)
    (h : residentVerdict f = Verdict.yes) : ResidentJudgment f Verdict.yes := by
  by_cases hAbode : f.abodeOneYear = Verdict.yes
  · exact ResidentJudgment.abodeEstablished f hAbode
  · have des : effectiveDomicile f = Verdict.yes := by
      cases heq : effectiveDomicile f with
      | yes => rfl
      | no =>
          rw [residentVerdict, heq] at h
          cases h2 : f.abodeOneYear with
          | yes => exfalso; exact hAbode h2
          | no => rw [h2] at h; exact absurd h (by decide)
          | unknown => rw [h2] at h; exact absurd h (by decide)
          | conflict => rw [h2] at h; exact absurd h (by decide)
      | unknown =>
          rw [residentVerdict, heq] at h
          cases h2 : f.abodeOneYear with
          | yes => exfalso; exact hAbode h2
          | no => rw [h2] at h; exact absurd h (by decide)
          | unknown => rw [h2] at h; exact absurd h (by decide)
          | conflict => rw [h2] at h; exact absurd h (by decide)
      | conflict =>
          rw [residentVerdict, heq] at h
          cases h2 : f.abodeOneYear with
          | yes => exfalso; exact hAbode h2
          | no => rw [h2] at h; exact absurd h (by decide)
          | unknown => rw [h2] at h; exact absurd h (by decide)
          | conflict => rw [h2] at h; exact absurd h (by decide)
    cases hf : fictionVerdict f with
    | yes =>
        have hchar := fiction_yes_char f
        have hfic := hchar.1 hf
        exact ResidentJudgment.fictionOf f hfic.2.1 hfic.2.2.1 hfic.2.2.2 hfic.1
    | no =>
        cases hest : f.established with
        | yes => exact ResidentJudgment.domicileEstablished f hest (by rw [hf]; decide)
        | no => rw [effectiveDomicile, hf, hest] at des; cases des
        | conflict => rw [effectiveDomicile, hf, hest] at des; cases des
        | unknown =>
            have hU : presumptionOutcome (presumptionDomestic f) (presumptionForeign f) = Verdict.yes :=
              by simpa [effectiveDomicile, hf, hest] using des
            have hd' : presumptionDomestic f = Verdict.yes := by
              cases hd2 : presumptionDomestic f with
              | yes => rfl
              | no =>
                  cases hfor : presumptionForeign f with
                  | yes => simp [presumptionOutcome, hd2, hfor] at hU
                  | no => simp [presumptionOutcome, hd2, hfor] at hU
                  | unknown => simp [presumptionOutcome, hd2, hfor] at hU
                  | conflict => simp [presumptionOutcome, hd2, hfor] at hU
              | unknown =>
                  cases hfor : presumptionForeign f with
                  | yes => simp [presumptionOutcome, hd2, hfor] at hU
                  | no => simp [presumptionOutcome, hd2, hfor] at hU
                  | unknown => simp [presumptionOutcome, hd2, hfor] at hU
                  | conflict => simp [presumptionOutcome, hd2, hfor] at hU
              | conflict => simp [presumptionOutcome, hd2] at hU
            have hFor : presumptionForeign f = Verdict.no ∨ presumptionForeign f = Verdict.unknown := by
              cases hfor : presumptionForeign f with
              | yes => exact absurd hU (foreign_yes_outcome_not_yes f hfor)
              | no => exact Or.inl rfl
              | unknown => exact Or.inr rfl
              | conflict => exact absurd hU (foreign_conflict_outcome_not_yes f hd' hfor)
            exact ResidentJudgment.presumptionDomesticOnly f (Verdict.or_eq_yes.mp hd') hFor (by rw [hf]; decide) (Or.inr hest)
    | unknown =>
        cases hest : f.established with
        | yes => exact ResidentJudgment.domicileEstablished f hest (by rw [hf]; decide)
        | no => rw [effectiveDomicile, hf, hest] at des; cases des
        | conflict => rw [effectiveDomicile, hf, hest] at des; cases des
        | unknown =>
            have hU : presumptionOutcome (presumptionDomestic f) (presumptionForeign f) = Verdict.yes :=
              by simpa [effectiveDomicile, hf, hest] using des
            have hd' : presumptionDomestic f = Verdict.yes := by
              cases hd2 : presumptionDomestic f with
              | yes => rfl
              | no =>
                  cases hfor : presumptionForeign f with
                  | yes => simp [presumptionOutcome, hd2, hfor] at hU
                  | no => simp [presumptionOutcome, hd2, hfor] at hU
                  | unknown => simp [presumptionOutcome, hd2, hfor] at hU
                  | conflict => simp [presumptionOutcome, hd2, hfor] at hU
              | unknown =>
                  cases hfor : presumptionForeign f with
                  | yes => simp [presumptionOutcome, hd2, hfor] at hU
                  | no => simp [presumptionOutcome, hd2, hfor] at hU
                  | unknown => simp [presumptionOutcome, hd2, hfor] at hU
                  | conflict => simp [presumptionOutcome, hd2, hfor] at hU
              | conflict => simp [presumptionOutcome, hd2] at hU
            have hFor : presumptionForeign f = Verdict.no ∨ presumptionForeign f = Verdict.unknown := by
              cases hfor : presumptionForeign f with
              | yes => exact absurd hU (foreign_yes_outcome_not_yes f hfor)
              | no => exact Or.inl rfl
              | unknown => exact Or.inr rfl
              | conflict => exact absurd hU (foreign_conflict_outcome_not_yes f hd' hfor)
            exact ResidentJudgment.presumptionDomesticOnly f (Verdict.or_eq_yes.mp hd') hFor (by rw [hf]; decide) (Or.inr hest)
    | conflict =>
        rw [effectiveDomicile, hf] at des; cases des
