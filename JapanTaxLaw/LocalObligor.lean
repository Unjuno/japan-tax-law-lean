import JapanTaxLaw.Verdict

/-!
# LocalObligor — 地方税法 Act art. 24（道府県民税の納税義務者等, para. 1, Act category scope）
                                     — actor-scope slice

Source (pinned):
https://laws.e-gov.go.jp/law/325AC0000000226
Law id: 325AC0000000226（昭和二十五年法律第二百二十六号）
Revision: 325AC0000000226_20261101_508AC0000000002
Amendment enforcement date: 2026-11-01 (CurrentEnforced)
Raw snapshot sha256: 3DD29E0078BF24E09C79436CE7B0F00FD2CFB5A5BBCB97BD4F4352971BE68D53

Act art. 24(1) items addressed in this module (verbatim from the pinned text):

  （道府県民税の納税義務者等）
  道府県民税は、
  第一号に掲げる者に対しては均等割額及び所得割額の合算額により、
  第三号に掲げる者に対しては均等割額及び法人税割額の合算額により、
  第二号及び第四号に掲げる者に対しては均等割額により、
  第四号の二に掲げる者に対しては法人税割額により、
  第五号に掲げる者に対しては利子割額により、
  第六号に掲げる者に対しては配当割額により、
  第七号に掲げる者に対しては株式等譲渡所得割額により課する。

  一 道府県内に住所を有する個人
  二 道府県内に事務所、事業所又は家屋敷を有する個人で当該事務所、事業所又は
     家屋敷を有する市町村内に住所を有しない者
  三 道府県内に事務所又は事業所を有する法人
  四 道府県内に寮、宿泊所、クラブその他これらに類する施設（「寮等」という。
     以下道府県民税について同じ。）を有する法人で当該道府県内に
     事務所又は事業所を有しないもの
  四の二 法人課税信託（法人税法第二条第二十九号の二に規定する法人課税信託をいう。
     以下この節において同じ。）の引受けを行うことにより法人税を課される
     個人で道府県内に事務所又は事業所を有するもの

Scope:
* ONLY para. 1 items 一, 二, 三, 四, 四の二 (actor classification) are modeled.
* Items 五（利子割）， 六（配当割）， 七（株式等譲渡所得割） — withholding-track
  classification — are NOT modeled here; they belong to a separate
  withholding-agent slice.
* The charge method is stated (均等割・所得割・法人税割・均等割のみ・法人税割のみ)
  but the tax AMOUNT is not computed anywhere in this module; computation lives in L4.
* Act art. 24(2)-(9) (住民基本台帳 records みなし, 収益事業 scope by 政令, 人格のない社団等
  みなし法人, 恒久的施設=事務所/事業所 みなし for 外国法人, 一般事業法人の均等割判定 等) are
  out of this slice; each is recorded as `unsupported`.
* Parameters are *already assessed legal facts* in the four-valued logic. This module
  never decides domicile, existence of an office or dormitory, or taxable-trust status.

Known limits (recorded honestly, not verified claims):
* Overlap (e.g. one person holding item 一 and item 四の二 simultaneously) is legal in
  the statute text (個人で法人課税信託の引受けを行う者); it is represented here as
  `.multipleApplicable`, and NO rule in this module prefers one track over another.
  Whether Act art. 24(1) then requires both charge methods to be applied, and whether a
  tax authority would apply either, is a legal-interpretation question NOT resolved by
  this model — flagged for the PHASE E cross-law layer.
* A corporation with an office AND a dormitory (item 三 and item 四 cannot both apply) —
  `dormitoryOnlyCorporation` presupposes "no office or business place in the prefecture",
  so the model treats item 三 and item 四 as mutually exclusive by precondition; an input
  asserting both is not checked for consistency beyond `Verdict.conflict`.

Axiom discipline: all theorems are proved by `cases`/`simp`/`omega` over Verdict constructors.
No `sorry`, `admit`, or unverified axioms.
-/

namespace JapanTaxLaw

/-- Assessed facts relevant to Act art. 24(1) actor classification.
    Each field is an *already assessed* four-valued Verdict. -/
structure LocalObligorFacts where
  /-- 一: 道府県内に住所を有する個人. -/
  individualWithResidentAddress : Verdict
  /-- 二: 道府県内に事務所、事業所又は家屋敷を有する個人で、
      当該事務所、事業所又は家屋敷を有する市町村内に住所を有しない者. -/
  individualOfficeNoAddress : Verdict
  /-- 三: 道府県内に事務所又は事業所を有する法人. -/
  corporationWithOffice : Verdict
  /-- 四: 道府県内に寮等を有する法人で、事務所又は事業所を有しないもの. -/
  corporationDormitoryOnly : Verdict
  /-- 四の二: 法人課税信託の引受けを行うことにより法人税を課される個人で、
      道府県内に事務所又は事業所を有するもの. -/
  trustElectPersonWithOffice : Verdict
  deriving DecidableEq, Repr

/-- Act art. 24(1) track for items 一/三/四の二 (single-item tracks), and the
    merged 均等割のみ track for items 二/四. -/
inductive LocalObligorTrack where
  | equalAndIncome   -- 一 (均等割額及び所得割額の合算額により)
  | equalPlusCorporate -- 三 (均等割額及び法人税割額の合算額により)
  | equalOnly        -- 二 and 四 (均等割額により)
  | corporateOnly    -- 四の二 (法人税割額により)
  deriving DecidableEq, Repr

/-- item 一 track. -/
def equalAndIncomeTrack (f : LocalObligorFacts) : Verdict :=
  f.individualWithResidentAddress

/-- item 三 track. -/
def equalPlusCorporateTrack (f : LocalObligorFacts) : Verdict :=
  f.corporationWithOffice

/-- items 二/四 track（均等割のみ）: either item applies. -/
def equalOnlyTrack (f : LocalObligorFacts) : Verdict :=
  Verdict.or f.individualOfficeNoAddress f.corporationDormitoryOnly

/-- item 四の二 track. -/
def corporateOnlyTrack (f : LocalObligorFacts) : Verdict :=
  f.trustElectPersonWithOffice

/-- Actor classification outcome. `multipleApplicable` deliberately records
    overlapping affirmatively-established items WITHOUT ranking them — the
    statute grants multiple tracks to the same person, and a preference rule is
    not inferred here (see module docstring). -/
inductive LocalObligorClassification where
  | equalAndIncome              -- exactly item 一 established
  | equalPlusCorporate          -- exactly item 三 established
  | equalOnlyIndividual         -- exactly item 二 established
  | equalOnlyDormitory          -- exactly item 四 established (both 二・四 would be multipleApplicable)
  | corporateOnly               -- exactly item 四の二 established
  | multipleApplicable          -- 2 or more items affirmatively established
  | notEstablished              -- every item denied
  | undetermined                -- at least one unknown, none affirmatively established
  | inconsistent                -- at least one item contradicted
  deriving DecidableEq, Repr

/-- Deterministic classification over the assessed facts.
    Conflict anywhere ⇒ `.inconsistent`.
    Two or more affirmatively established items ⇒ `.multipleApplicable`.
    Otherwise the single affirmatively established item is reported; if none,
    fall back to `undetermined` (an unknown is present) or `notEstablished`. -/
def classifyLocalObligor (f : LocalObligorFacts) : LocalObligorClassification :=
  let nYes := (if f.individualWithResidentAddress = Verdict.yes then 1 else 0)
            + (if f.individualOfficeNoAddress = Verdict.yes then 1 else 0)
            + (if f.corporationWithOffice = Verdict.yes then 1 else 0)
            + (if f.corporationDormitoryOnly = Verdict.yes then 1 else 0)
            + (if f.trustElectPersonWithOffice = Verdict.yes then 1 else 0)
  if f.individualWithResidentAddress = Verdict.conflict
  ∨ f.individualOfficeNoAddress = Verdict.conflict
  ∨ f.corporationWithOffice = Verdict.conflict
  ∨ f.corporationDormitoryOnly = Verdict.conflict
  ∨ f.trustElectPersonWithOffice = Verdict.conflict then .inconsistent
  else if nYes ≥ 2 then .multipleApplicable
  else if f.individualWithResidentAddress = Verdict.yes then .equalAndIncome
  else if f.individualOfficeNoAddress = Verdict.yes then .equalOnlyIndividual
  else if f.corporationWithOffice = Verdict.yes then .equalPlusCorporate
  else if f.corporationDormitoryOnly = Verdict.yes then .equalOnlyDormitory
  else if f.trustElectPersonWithOffice = Verdict.yes then .corporateOnly
  else if f.individualWithResidentAddress = Verdict.unknown
       ∨ f.individualOfficeNoAddress = Verdict.unknown
       ∨ f.corporationWithOffice = Verdict.unknown
       ∨ f.corporationDormitoryOnly = Verdict.unknown
       ∨ f.trustElectPersonWithOffice = Verdict.unknown then .undetermined
  else .notEstablished

-- ==================== structural consistency lemmas ====================

/-- item 二 の否定が確定したとき、`equalOnlyTrack` は item 四 の値と一致する
    （令は事務所等なしを要件とするため、両立は入力矛盾として別扱いとする）. -/
theorem individual_office_no_address_no_track (f : LocalObligorFacts)
    (h : f.individualOfficeNoAddress = Verdict.no) :
    equalOnlyTrack f = f.corporationDormitoryOnly := by
  cases hC : f.corporationDormitoryOnly <;> simp [equalOnlyTrack, Verdict.or, h, hC]

/-- Each item implication: established item ⇒ affirmatively charged under its track. -/
theorem item1_established_equal_income (f : LocalObligorFacts)
    (h : f.individualWithResidentAddress = Verdict.yes) :
    equalAndIncomeTrack f = Verdict.yes := by
  simp [equalAndIncomeTrack, h]

theorem corporation_established_equal_and_corporate (f : LocalObligorFacts)
    (h : f.corporationWithOffice = Verdict.yes) :
    equalPlusCorporateTrack f = Verdict.yes := by
  simp [equalPlusCorporateTrack, h]

theorem dormitory_established_equal_only (f : LocalObligorFacts)
    (h : f.corporationDormitoryOnly = Verdict.yes) :
    equalOnlyTrack f = Verdict.yes := by
  cases hA : f.individualOfficeNoAddress <;> simp [equalOnlyTrack, Verdict.or, hA, h]

theorem office_individual_established_equal_only (f : LocalObligorFacts)
    (h : f.individualOfficeNoAddress = Verdict.yes) :
    equalOnlyTrack f = Verdict.yes := by
  simp [equalOnlyTrack, Verdict.or, h]

theorem trust_established_corporate_only (f : LocalObligorFacts)
    (h : f.trustElectPersonWithOffice = Verdict.yes) :
    corporateOnlyTrack f = Verdict.yes := by
  simp [corporateOnlyTrack, h]

/-- Single affirmatively established item 一, others not affirmatively established
    and not `.conflict` ⇒ `.equalAndIncome`. -/
theorem only_item1_gives_equal_and_income (f : LocalObligorFacts)
    (h1 : f.individualWithResidentAddress = Verdict.yes)
    (h2 : f.individualOfficeNoAddress ≠ Verdict.yes ∧ f.individualOfficeNoAddress ≠ Verdict.conflict)
    (h3 : f.corporationWithOffice ≠ Verdict.yes ∧ f.corporationWithOffice ≠ Verdict.conflict)
    (h4 : f.corporationDormitoryOnly ≠ Verdict.yes ∧ f.corporationDormitoryOnly ≠ Verdict.conflict)
    (h5 : f.trustElectPersonWithOffice ≠ Verdict.yes ∧ f.trustElectPersonWithOffice ≠ Verdict.conflict) :
    classifyLocalObligor f = .equalAndIncome := by
  cases h2c : f.individualOfficeNoAddress <;> cases h3c : f.corporationWithOffice <;>
    cases h4c : f.corporationDormitoryOnly <;> cases h5c : f.trustElectPersonWithOffice <;>
    simp_all [classifyLocalObligor]

end JapanTaxLaw
