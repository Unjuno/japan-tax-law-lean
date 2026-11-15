import JapanTaxLaw.LocalObligor

/-!
# LocalObligor specification — independent restatement of 地方税法 Act art. 24,
                     Act art. 24(1) Act categories 一・二・三・四・四の二

Source (pinned):
https://laws.e-gov.go.jp/law/325AC0000000226
Revision: 325AC0000000226_20261101_508AC0000000002
Amendment enforcement date: 2026-11-01 (CurrentEnforced)
Raw snapshot sha256: 3DD29E0078BF24E09C79436CE7B0F00FD2CFB5A5BBCB97BD4F4352971BE68D53

This module restates Act art. 24(1)'s five actor-category judgments independently
of the implementation in LocalObligor.lean:

  一   道府県内に住所を有する個人                            … 均等割額及び所得割額の合算額
  二   道府県内に事務所、事業所又は家屋敷を有する個人で当該事務所等を有する
      市町村内に住所を有しない者                               … 均等割額のみ
  三   道府県内に事務所又は事業所を有する法人                … 均等割額及び法人税割額の合算額
  四   道府県内に寮、宿泊所、クラブその他これらに類する施設（寮等）を有する法人で、
      事務所又は事業所を有しないもの                           … 均等割額のみ
  四の二 法人課税信託の引受けを行うことにより法人税を課される個人で、
      道府県内に事務所又は事業所を有するもの                   … 法人税割額のみ

Out of scope (not restated here): 五（利子割）， 六（配当割）， 七（株式等譲渡所得割）,
paras. 2–9, amount computation. See LocalObligor.lean for the known-limit record.

Axiom discipline: all theorems are proved by `cases`/`simp` over Verdict constructors.
No `sorry`, `admit`, or unverified axioms.
-/

namespace JapanTaxLaw

namespace LocalObligorSpec

/-- Sufficient statutory sources of an Act art. 24(1) actor-category judgment,
    restated independently of the implementation. -/
inductive LocalObligorJudgment : LocalObligorFacts → Prop where
  | equalAndIncome      (f : LocalObligorFacts)
      (h : f.individualWithResidentAddress = Verdict.yes) : LocalObligorJudgment f
  | equalOnlyIndividual (f : LocalObligorFacts)
      (h : f.individualOfficeNoAddress = Verdict.yes) : LocalObligorJudgment f
  | equalPlusCorporate  (f : LocalObligorFacts)
      (h : f.corporationWithOffice = Verdict.yes) : LocalObligorJudgment f
  | equalOnlyDormitory  (f : LocalObligorFacts)
      (h : f.corporationDormitoryOnly = Verdict.yes) : LocalObligorJudgment f
  | corporateOnly       (f : LocalObligorFacts)
      (h : f.trustElectPersonWithOffice = Verdict.yes) : LocalObligorJudgment f

end LocalObligorSpec

open LocalObligorSpec

/-- Spec → impl: an established actor judgment yields an affirmatively-established
    track (at least one; the judgment's own item's track in particular). -/
theorem spec_local_obligor_sound (f : LocalObligorFacts)
    (h : LocalObligorJudgment f) :
    equalAndIncomeTrack f = Verdict.yes ∨
    equalOnlyTrack f = Verdict.yes ∨
    equalPlusCorporateTrack f = Verdict.yes ∨
    corporateOnlyTrack f = Verdict.yes := by
  cases h with
  | equalAndIncome h => exact Or.inl (item1_established_equal_income f h)
  | equalOnlyIndividual h => exact Or.inr (Or.inl (office_individual_established_equal_only f h))
  | equalPlusCorporate h => exact Or.inr (Or.inr (Or.inl (corporation_established_equal_and_corporate f h)))
  | equalOnlyDormitory h => exact Or.inr (Or.inl (dormitory_established_equal_only f h))
  | corporateOnly h => exact Or.inr (Or.inr (Or.inr (trust_established_corporate_only f h)))

/-- Impl → spec: an affirmative item-一 track yields the item-一 judgment. -/
theorem spec_equal_and_income_complete (f : LocalObligorFacts)
    (h : equalAndIncomeTrack f = Verdict.yes) : LocalObligorJudgment f := by
  cases h1 : f.individualWithResidentAddress <;>
    simp [equalAndIncomeTrack, h1] at h
  exact LocalObligorJudgment.equalAndIncome f h1

/-- Impl → spec: an affirmative 均等割のみ track yields an item二か item四の judgment. -/
theorem spec_equal_only_complete (f : LocalObligorFacts)
    (h : equalOnlyTrack f = Verdict.yes) : LocalObligorJudgment f := by
  cases hA : f.individualOfficeNoAddress <;> cases hB : f.corporationDormitoryOnly <;>
    simp [equalOnlyTrack, Verdict.or, hA, hB] at h <;>
    (first
      | exact LocalObligorJudgment.equalOnlyIndividual f hA
      | exact LocalObligorJudgment.equalOnlyDormitory f hB)

/-- Impl → spec: an affirmative item-三 track yields the item-三 judgment. -/
theorem spec_equal_plus_corporate_complete (f : LocalObligorFacts)
    (h : equalPlusCorporateTrack f = Verdict.yes) : LocalObligorJudgment f := by
  cases h3 : f.corporationWithOffice <;>
    simp [equalPlusCorporateTrack, h3] at h
  exact LocalObligorJudgment.equalPlusCorporate f h3

/-- Impl → spec: an affirmative item-四の二 track yields the item-四の二 judgment. -/
theorem spec_corporate_only_complete (f : LocalObligorFacts)
    (h : corporateOnlyTrack f = Verdict.yes) : LocalObligorJudgment f := by
  cases h5 : f.trustElectPersonWithOffice <;>
    simp [corporateOnlyTrack, h5] at h
  exact LocalObligorJudgment.corporateOnly f h5

/-- Soundness, per judgment constructor: each judgment witnesses an affirmative
    verdict on its own track. -/
theorem spec_equal_only_dormitory_sound (f : LocalObligorFacts)
    (h : f.corporationDormitoryOnly = Verdict.yes) :
    equalOnlyTrack f = Verdict.yes :=
  dormitory_established_equal_only f h

end JapanTaxLaw
