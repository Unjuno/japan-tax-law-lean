import JapanTaxLaw.Verdict

/-!
# Statutory model — Income Tax Act Arts. 2(1)(iii), 2(1)(v), 3; Order arts. 13–15

Scope (R1):
* 所得税法第二条第一項第三号  resident の定義
* 所得税法第二条第一項第五号  non-resident の定義
* 所得税法第三条第一項        deemed domicile of public officials (法的擬制) and its exclusions
* 所得税法施行令第十三条      excluded persons (Japanese nationals residing abroad as permanent residents)
* 所得税法施行令第十四条      presumption of domestic domicile (推定)
* 所得税法施行令第十五条      presumption of absent domestic domicile (推定)

Design:
* Inputs are **already assessed legal facts** in the four-valued `Verdict` logic.
* `effectiveDomicile` computes the domicile verdict for the purposes of a *covered* provision.
* `residentVerdict` composes domicile with the abode predicate.
* The independent specification lives in `JapanTaxLaw.ResidencySpec`; the
  equivalence theorems are proven there.

What this model deliberately does **not** do:
* It does not decide what "住所" or "居所" is, nor the length of a "year".
* It does not model non-permanent residence (Art. 2(1)(iv)), treaties, etc.
-/

namespace JapanTaxLaw

/-- Statutory facts relevant to the residency classification. Every field is a
    four-valued `Verdict` produced externally by fact-finders or by application
    of separate rules; this module never derives a fact from nothing.

    `targetExcludedProvision` indicates that the provision under consideration
    is one of the provisions excluded from Art. 3(1) of the Act
    (Articles 10, 15 and 16 as listed there). -/
structure DomicileFacts where
  /-- 住所の有無についての直接認定 (yes=国内に住所あり, no=なし, unknown=不明, conflict=矛盾) -/
  established : Verdict
  /-- 「現在まで引き続いて一年以上居所を有する」の認定 -/
  abodeOneYear : Verdict
  /-- 国家公務員又は地方公務員であること -/
  publicOfficial : Verdict
  /-- 日本の国籍を有すること -/
  japaneseNational : Verdict
  /-- 現に国外に居住し、かつ、その地に永住すると認められること (Order art. 13) -/
  order13PermanentAbroad : Verdict
  /-- 国内に継続して一年以上居住することを通常必要とする職業を有する等 (Order art. 14(1)) -/
  order14Presumption : Verdict
  /-- 被推定者と生計を一にする配偶者その他の扶養する親族が国内に居住すること (Order art. 14(2)) -/
  order14Household : Verdict
  /-- 国外に継続して一年以上居住することを通常必要とする職業を有する等 (Order art. 15(1)) -/
  order15Presumption : Verdict
  /-- 被推定者と生計を一にする配偶者その他の扶養する親族が国外に居住すること (Order art. 15(2)) -/
  order15Household : Verdict
  /-- 対象となる条文が所得税法第十条・第十五条・第十六条等の場合 true -/
  targetExcludedProvision : Bool
  deriving DecidableEq, Repr

/-- Order art. 13: a Japanese national who actually resides abroad and is
    recognized as permanently residing there. -/
def order13Person (f : DomicileFacts) : Verdict :=
  Verdict.and f.japaneseNational f.order13PermanentAbroad

/-- Act art. 3(1), textually: 「これらのうち日本の国籍を有しない者その他政令で定める者を除く」.
    Excluded from the deemed-domicile rule. -/
def excludedFromFiction (f : DomicileFacts) : Verdict :=
  Verdict.or (Verdict.not f.japaneseNational) (order13Person f)

/-- Whether the deemed-domicile fiction of Act art. 3(1) applies to `f`. -/
def fictionVerdict (f : DomicileFacts) : Verdict :=
  match f.targetExcludedProvision with
  | true  => Verdict.no
  | false => Verdict.and f.publicOfficial (Verdict.not (excludedFromFiction f))

/-- Order art. 14 combined: any of art. 14(1) items or art. 14(2) household rule. -/
def presumptionDomestic (f : DomicileFacts) : Verdict :=
  Verdict.or f.order14Presumption f.order14Household

/-- Order art. 15 combined: any of art. 15(1) items or art. 15(2) household rule. -/
def presumptionForeign (f : DomicileFacts) : Verdict :=
  Verdict.or f.order15Presumption f.order15Household

/-- Combine the two opposing presumptions.
    * any conflict in inputs  → conflict
    * both affirmatively favour domestic domiciliation → conflict (the materials
      prove both, which cannot jointly hold for one person; requires review)
    * only domestic           → yes (presumption of domicile)
    * only foreign            → no  (presumption of absence)
    * otherwise               → unknown -/
def presumptionOutcome (dom for1 : Verdict) : Verdict :=
  match dom, for1 with
  | .conflict, _          => .conflict
  | _,         .conflict  => .conflict
  | .yes,      .yes       => .conflict
  | .yes,      _          => .yes
  | _,         .yes       => .no
  | _,         _          => .unknown

/-- Effective domicile verdict **for a provision covered by the fiction**.
    Order of application:
    1. legal fiction (Act art. 3(1)) applies — residence is deemed regardless of fact
    2. directly established fact
    3. presumptions (Order arts. 14/15), rebuttable by established fact but not by
        one another — if presumptions clash, the outcome is `conflict`. -/
def effectiveDomicile (f : DomicileFacts) : Verdict :=
  match fictionVerdict f with
  | .yes      => .yes
  | .conflict => .conflict
  | .unknown  =>
    match f.established with
    | .yes      => .yes
    | .no       => .unknown
    | .conflict => .conflict
    | .unknown  => presumptionOutcome (presumptionDomestic f) (presumptionForeign f)
  | .no       =>
    match f.established with
    | .yes      => .yes
    | .no       => .no
    | .conflict => .conflict
    | .unknown  => presumptionOutcome (presumptionDomestic f) (presumptionForeign f)

/-- Effective domicile verdict for a provision **not** covered by the fiction. -/
def effectiveDomicileUncovered (f : DomicileFacts) : Verdict :=
  effectiveDomicile { f with targetExcludedProvision := true }

/-- Act art. 2(1)(iii): resident — domicile (incl. fiction/presumption) OR one-year abode. -/
def residentVerdict (f : DomicileFacts) : Verdict :=
  Verdict.or (effectiveDomicile f) f.abodeOneYear

/-- Act art. 2(1)(v): non-resident — anyone who is not a resident.
    In four-valued logic, negation of an undetermined classification is itself undetermined. -/
def nonResidentVerdict (f : DomicileFacts) : Verdict :=
  Verdict.not (residentVerdict f)

/-- Four-valued classification report for consumers. -/
inductive Classification where
  | resident       -- resident affirmatively established
  | nonResident    -- non-resident affirmatively established
  | indeterminate  -- materials insufficient to classify
  | inconsistent   -- materials contradict each other
  deriving DecidableEq, Repr

def classify (v : Verdict) : Classification :=
  match v with
  | .yes      => .resident
  | .no       => .nonResident
  | .unknown  => .indeterminate
  | .conflict => .inconsistent

def residentClassification (f : DomicileFacts) : Classification :=
  classify (residentVerdict f)

-- ==================== core soundness/consistency lemmas ====================

/-- The fiction yields an affirmative domicile regardless of actual domicile facts. -/
theorem fiction_yes_dom_yes (f : DomicileFacts)
    (h : fictionVerdict f = Verdict.yes) : effectiveDomicile f = Verdict.yes := by
  simp [effectiveDomicile, h]

/-- The deemed-domicile rule does not apply to the excluded provisions. -/
theorem fiction_no_when_excluded_provision (f : DomicileFacts)
    (h : f.targetExcludedProvision = true) : fictionVerdict f = Verdict.no := by
  simp [fictionVerdict, h]

/-- Order 13 persons are excluded from the fiction. -/
theorem order13_persons_excluded (f : DomicileFacts)
    (hNat : f.japaneseNational = Verdict.yes)
    (hAbroad : f.order13PermanentAbroad = Verdict.yes) :
    fictionVerdict f ≠ Verdict.yes := by
  have h13 : order13Person f = Verdict.yes := by
    simp [order13Person, hNat, hAbroad, Verdict.and]
  have h1 : Verdict.not f.japaneseNational = Verdict.no := by
    rw [hNat]; rfl
  have hEx : excludedFromFiction f = Verdict.yes := by
    simp [excludedFromFiction, h1, h13, Verdict.or]
  cases hT : f.targetExcludedProvision with
  | true => simp [fictionVerdict, hT]
  | false =>
      cases hP : f.publicOfficial with
      | yes => simp [fictionVerdict, hT, hP, hEx, Verdict.not, Verdict.and]
      | no => simp [fictionVerdict, hT, hP, hEx, Verdict.not, Verdict.and]
      | unknown => simp [fictionVerdict, hT, hP, hEx, Verdict.not, Verdict.and]
      | conflict => simp [fictionVerdict, hT, hP, hEx, Verdict.not, Verdict.and]

/-- Non-Japanese nationals are excluded from the fiction. -/
theorem non_japanese_excluded (f : DomicileFacts)
    (h : f.japaneseNational = Verdict.no) :
    fictionVerdict f ≠ Verdict.yes := by
  have h1 : Verdict.not f.japaneseNational = Verdict.yes := by rw [h]; rfl
  have hEx : excludedFromFiction f = Verdict.yes := by
    simp [excludedFromFiction, h1, Verdict.or]
  cases hT : f.targetExcludedProvision with
  | true => simp [fictionVerdict, hT]
  | false =>
      cases hP : f.publicOfficial with
      | yes => simp [fictionVerdict, hT, hP, hEx, Verdict.not, Verdict.and]
      | no => simp [fictionVerdict, hT, hP, hEx, Verdict.not, Verdict.and]
      | unknown => simp [fictionVerdict, hT, hP, hEx, Verdict.not, Verdict.and]
      | conflict => simp [fictionVerdict, hT, hP, hEx, Verdict.not, Verdict.and]

/-- A Japanese public official abroad is deemed domiciled (the paradigm case of
    Act art. 3(1)), provided the Order 13 exclusion does not affirmatively apply. -/
theorem public_official_abroad_deemed (f : DomicileFacts)
    (hPO : f.publicOfficial = Verdict.yes)
    (hNat : f.japaneseNational = Verdict.yes)
    (hGap : f.order13PermanentAbroad = Verdict.no)
    (hNotEx : f.targetExcludedProvision = false) :
    fictionVerdict f = Verdict.yes := by
  have h1 : Verdict.not f.japaneseNational = Verdict.no := by rw [hNat]; rfl
  have hO13 : order13Person f = Verdict.no := by
    simp [order13Person, hNat, hGap, Verdict.and]
  have hEx : excludedFromFiction f = Verdict.no := by
    simp [excludedFromFiction, h1, hO13, Verdict.or]
  simp [fictionVerdict, hNotEx, hPO, hEx, Verdict.not, Verdict.and]

/-- If the Order 13 recognition is undetermined, domicile under the fiction is
    undetermined (it is neither asserted nor denied for lack of qualification). -/
theorem public_official_abroad_unknown_fiction (f : DomicileFacts)
    (hNat : f.japaneseNational = Verdict.yes)
    (hGap : f.order13PermanentAbroad = Verdict.unknown)
    (hNotEx : f.targetExcludedProvision = false)
    (hPO : f.publicOfficial = Verdict.yes) :
    fictionVerdict f = Verdict.unknown := by
  have h1 : Verdict.not f.japaneseNational = Verdict.no := by rw [hNat]; rfl
  have hO13 : order13Person f = Verdict.unknown := by
    simp [order13Person, hNat, hGap, Verdict.and]
  have hEx : excludedFromFiction f = Verdict.unknown := by
    simp [excludedFromFiction, h1, hO13, Verdict.or]
  simp [fictionVerdict, hNotEx, hPO, hEx, Verdict.not, Verdict.and]

/-- Direct established `yes` wins regardless of fiction verdicts that do not apply. -/
theorem established_yes_dom_yes (f : DomicileFacts)
    (h : f.established = Verdict.yes) (hf : fictionVerdict f = Verdict.no ∨ fictionVerdict f = Verdict.unknown) :
    effectiveDomicile f = Verdict.yes := by
  rcases hf with hf | hf <;> simp [effectiveDomicile, hf, h]

/-- Established `no` wins over the presumptions (rebuttal by direct evidence). -/
theorem established_no_blocks_presumption (f : DomicileFacts)
    (h : f.established = Verdict.no) (hf : fictionVerdict f = Verdict.no) :
    effectiveDomicile f = Verdict.no := by
  simp [effectiveDomicile, hf, h]

theorem established_no_unknown_fiction (f : DomicileFacts)
    (h : f.established = Verdict.no) (hf : fictionVerdict f = Verdict.unknown) :
    effectiveDomicile f = Verdict.unknown := by
  simp [effectiveDomicile, hf, h]

theorem established_conflict_dom_conflict (f : DomicileFacts)
    (h : f.established = Verdict.conflict) (hf : fictionVerdict f = Verdict.no ∨ fictionVerdict f = Verdict.unknown) :
    effectiveDomicile f = Verdict.conflict := by
  rcases hf with hf | hf <;> simp [effectiveDomicile, hf, h]

/-- Fiction yields `yes` even when the abode fact is denied. -/
theorem fiction_overrules_abode_no (f : DomicileFacts)
    (h : fictionVerdict f = Verdict.yes) (_hA : f.abodeOneYear = Verdict.no) :
    residentVerdict f = Verdict.yes := by
  have hd := fiction_yes_dom_yes f h
  simp [residentVerdict, hd, Verdict.or]

/-- Both presumptions firing in favour of different sides ⇒ `conflict` (inconsistent materials). -/
theorem clashing_presumptions_conflict (f : DomicileFacts)
    (hEst : f.established = Verdict.unknown)
    (hFic : fictionVerdict f = Verdict.no)
    (hDom : presumptionDomestic f = Verdict.yes)
    (hFor : presumptionForeign f = Verdict.yes) :
    effectiveDomicile f = Verdict.conflict := by
  simp [effectiveDomicile, hFic, hEst, hDom, hFor, presumptionOutcome]

theorem no_fiction_no_presumption_unknown (f : DomicileFacts)
    (hEst : f.established = Verdict.unknown)
    (hFic : fictionVerdict f = Verdict.no)
    (hDom : presumptionDomestic f = Verdict.no ∨ presumptionDomestic f = Verdict.unknown)
    (hFor : presumptionForeign f = Verdict.no ∨ presumptionForeign f = Verdict.unknown) :
    effectiveDomicile f = Verdict.unknown := by
  rcases hDom with hDom' | hDom'
  · rcases hFor with hFor' | hFor'
    · simp [effectiveDomicile, hFic, hEst, hDom', hFor', presumptionOutcome]
    · simp [effectiveDomicile, hFic, hEst, hDom', hFor', presumptionOutcome]
  · rcases hFor with hFor' | hFor'
    · simp [effectiveDomicile, hFic, hEst, hDom', hFor', presumptionOutcome]
    · simp [effectiveDomicile, hFic, hEst, hDom', hFor', presumptionOutcome]

theorem domestic_presumption_alone_means_yes (f : DomicileFacts)
    (hEst : f.established = Verdict.unknown)
    (hFic : fictionVerdict f = Verdict.no)
    (hDom : presumptionDomestic f = Verdict.yes)
    (hForN : presumptionForeign f = Verdict.no ∨ presumptionForeign f = Verdict.unknown) :
    effectiveDomicile f = Verdict.yes := by
  rcases hForN with hFor | hFor
  · simp [effectiveDomicile, hFic, hEst, hDom, hFor, presumptionOutcome]
  · simp [effectiveDomicile, hFic, hEst, hDom, hFor, presumptionOutcome]

theorem foreign_presumption_alone_means_no (f : DomicileFacts)
    (hEst : f.established = Verdict.unknown)
    (hFic : fictionVerdict f = Verdict.no)
    (hFor : presumptionForeign f = Verdict.yes)
    (hDomN : presumptionDomestic f = Verdict.no ∨ presumptionDomestic f = Verdict.unknown) :
    effectiveDomicile f = Verdict.no := by
  rcases hDomN with hDom | hDom
  · simp [effectiveDomicile, hFic, hEst, hDom, hFor, presumptionOutcome]
  · simp [effectiveDomicile, hFic, hEst, hDom, hFor, presumptionOutcome]

/-- Resident classification is exhaustive — always one of four outcomes. -/
theorem classification_always_one (f : DomicileFacts) :
    residentClassification f = .resident ∨ residentClassification f = .nonResident ∨
    residentClassification f = .indeterminate ∨ residentClassification f = .inconsistent := by
  cases h : residentVerdict f <;> simp [residentClassification, classify, h]

/-- Resident and non-resident can never both be affirmed. -/
theorem classification_never_both (f : DomicileFacts) :
    ¬ (residentClassification f = .resident ∧ residentClassification f = .nonResident) := by
  intro ⟨h1, h2⟩
  cases hc : residentVerdict f with
  | yes => simp [residentClassification, classify, hc] at h2
  | no => simp [residentClassification, classify, hc] at h1
  | unknown => simp [residentClassification, classify, hc] at h1
  | conflict => simp [residentClassification, classify, hc] at h1

end JapanTaxLaw
