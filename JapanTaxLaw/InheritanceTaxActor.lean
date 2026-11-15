import JapanTaxLaw.Verdict

/-!
# InheritanceTaxActor — 相続税法（昭和二十五年法律第七十三号）
                        Act art. 1の3 (相続税の納税義務者) — actor-scope slice

Source (pinned):
https://laws.e-gov.go.jp/law/325AC0000000073
Law id: 325AC0000000073（昭和二十五年法律第七十三号）
Revision: 325AC0000000073_20260401_506AC0000000008
Amendment enforcement date: 2026-04-01 (CurrentEnforced)
Raw snapshot sha256: C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7

Key text (verbatim, pinned):
  第一条の三 相続税の納税義務者
  次の各号のいずれかに掲げる者は、この法律により、相続税を納める義務がある。
  一相続又は遺贈（贈与をした老人の死亡により効力を生ずる贈与を含む。以下同じ。）により財産を
  取得した次に掲げる者であつて、当該財産を取得した時においてこの法律の施行地に住所を
  有するもの イ一時居住者でない個人 ロ一時居住者である個人（当該相続又は遺贈に係る被相続人
  （遺贈をした者を含む。以下同じ。）が外国人被相続人又は非居住被相続人である場合を除く。）

Scope:
* This module formalizes the "one of the most common" path only: clause (一) —
  被相続人が日本国内在住の日本人の場合（外国人被相続人 / 非居住被相続人 の例外は未対応）;
  一時居住者でない個人 のみを対象とする（Act art. 1の3第1項一号イ）。
* Parameters of the verdict logic are inputs, not derived: `isIndividual`
  (個人か), `isResidentInJapanAtAcquisition` (施行地に住所を有するか),
  `isNotTemporaryResident` (一時居住者でないか), `acquiredThroughInheritanceOrBequest`.
* 一時居住者 (一号ロ) 及び 一時居住者でない外国人に関する特別ルール (一号ロ/二号イ/二号ロ)
  はモデルの範囲外であり、`unsupported` として記録します。外国人被相続人を考慮する関係も
  未対応。
* Act art. 1の3第二項・第三項（所得税法規則等に関する特例・解釈規定）は本スコープ外。

Axiom discipline: all theorems are proved by `cases`/`simp` over Verdict constructors.
No `sorry`, `admit`, or unverified axioms.
-/

namespace JapanTaxLaw

/-- Assessed facts relevant to the 相続税 actor classification
    (default: Clause (一) — compliant individual, Japan dead-body resident). -/
structure InheritanceTaxActorFacts where
  /-- 個人か（法人にしない。相続税は財産の取得者である個人への課税が原則）. -/
  isIndividual : Verdict
  /-- 当該財産を取得した時においてこの法律の施行地に住所を有するか. -/
  isResidentInJapanAtAcquisition : Verdict
  /-- 一時居住者でないこと（法文第1号イ要件）. -/
  isNotTemporaryResident : Verdict
  /-- 相続又は遺贈により財産を取得したか. -/
  acquiredThroughInheritanceOrBequest : Verdict
  deriving DecidableEq, Repr

/-- 施行地に住所を有し、かつ一時居住者でない個人の集計 (Act art. 1の3(1)(i) お
    よび同号イに該当する者). -/
def isResidentCompliantIndividual (f : InheritanceTaxActorFacts) : Verdict :=
  Verdict.and f.isIndividual (Verdict.and f.isResidentInJapanAtAcquisition f.isNotTemporaryResident)

/-- 相続又は遺贈により財産を取得した者. -/
def isAcquirerOfInheritorProp (f : InheritanceTaxActorFacts) : Verdict :=
  f.acquiredThroughInheritanceOrBequest

/-- 相続税の納税義務: Clause (一)の既定組合。住所ありかつ一時居住者でない個人で、
    相続又は遺贈により財産を取得した者は課税対象。 -/
def owesInheritanceTaxVerdict (f : InheritanceTaxActorFacts) : Verdict :=
  Verdict.and (isResidentCompliantIndividual f) (isAcquirerOfInheritorProp f)

/-- Tax obligation classification. -/
inductive InheritanceTaxObligation where
  | owes
  | doesNotOwe
  | undetermined
  | inconsistent
  deriving DecidableEq, Repr

/-- Four-valued classification for consumers. -/
def classifyInheritanceTaxActor (f : InheritanceTaxActorFacts) : InheritanceTaxObligation :=
  match owesInheritanceTaxVerdict f with
  | .yes      => .owes
  | .no       => .doesNotOwe
  | .unknown  => .undetermined
  | .conflict => .inconsistent

-- ==================== structural consistency lemmas ====================

/-- Clause (一) の前段: `flag` に該当していることが確認された個人は居住要件を満そうとしない. -/
theorem individual_resident_not_temporary_isIndividualVerifier (f : InheritanceTaxActorFacts)
    (hInd : f.isIndividual = Verdict.yes)
    (hRes : f.isResidentInJapanAtAcquisition = Verdict.yes)
    (hNotTemp : f.isNotTemporaryResident = Verdict.yes) :
    isResidentCompliantIndividual f = Verdict.yes := by
  simp [isResidentCompliantIndividual, hInd, hRes, hNotTemp, Verdict.and]

/-- Clause (一) の後段: 被相続人が日本の住所に在住の個人で、遺贈又は相続による財産取得. -/
theorem inheritance_plus_bequest_with_resident_implies_owes (f : InheritanceTaxActorFacts)
    (hInd : f.isIndividual = Verdict.yes)
    (hRes : f.isResidentInJapanAtAcquisition = Verdict.yes)
    (hNotTemp : f.isNotTemporaryResident = Verdict.yes)
    (hAcq : f.acquiredThroughInheritanceOrBequest = Verdict.yes) :
    owesInheritanceTaxVerdict f = Verdict.yes := by
  simp [owesInheritanceTaxVerdict, isResidentCompliantIndividual, isAcquirerOfInheritorProp,
        hInd, hRes, hNotTemp, hAcq, Verdict.and]

/-- Tax obligation requires acquisition — acquisition否定 ⇒ obligation否定. -/
theorem no_acquisition_no_obligation (f : InheritanceTaxActorFacts)
    (hAcq : f.acquiredThroughInheritanceOrBequest = Verdict.no) :
    owesInheritanceTaxVerdict f = Verdict.no := by
  cases hI : f.isIndividual <;> cases hR : f.isResidentInJapanAtAcquisition <;>
    cases hN : f.isNotTemporaryResident <;>
    simp [owesInheritanceTaxVerdict, isResidentCompliantIndividual, isAcquirerOfInheritorProp,
          hAcq, hI, hR, hN, Verdict.and]

/-- 施行地に住所を有しない → Clause (一)者ではない → このモデルでは納税義務を推認できない. -/
theorem no_residence_no_obligation (f : InheritanceTaxActorFacts)
    (hRes : f.isResidentInJapanAtAcquisition = Verdict.no) :
    owesInheritanceTaxVerdict f = Verdict.no := by
  cases hI : f.isIndividual <;> cases hN : f.isNotTemporaryResident <;>
    cases hAcq : f.acquiredThroughInheritanceOrBequest <;>
    simp [owesInheritanceTaxVerdict, isResidentCompliantIndividual, isAcquirerOfInheritorProp,
          hRes, hI, hN, hAcq, Verdict.and]

/-- 個人でない → このモデルでは納税義務を推認できない. -/
theorem not_individual_no_obligation (f : InheritanceTaxActorFacts)
    (hInd : f.isIndividual = Verdict.no) :
    owesInheritanceTaxVerdict f = Verdict.no := by
  cases hR : f.isResidentInJapanAtAcquisition <;> cases hN : f.isNotTemporaryResident <;>
    cases hAcq : f.acquiredThroughInheritanceOrBequest <;>
    simp [owesInheritanceTaxVerdict, isResidentCompliantIndividual, isAcquirerOfInheritorProp,
          hInd, hR, hN, hAcq, Verdict.and]

/-- 一時居住者でない限り thisモデルでは損害除外で扱わない（否定側のみ）. -/
theorem temporary_resident_no_claim_obligation (f : InheritanceTaxActorFacts)
    (hTemp : f.isNotTemporaryResident = Verdict.no) :
    owesInheritanceTaxVerdict f = Verdict.no := by
  cases hI : f.isIndividual <;> cases hR : f.isResidentInJapanAtAcquisition <;>
    cases hAcq : f.acquiredThroughInheritanceOrBequest <;>
    simp [owesInheritanceTaxVerdict, isResidentCompliantIndividual, isAcquirerOfInheritorProp,
          hTemp, hI, hR, hAcq, Verdict.and]

/-- 本clause のモデルでTodaは、判別が決定的な場合の classification が4つ. -/
theorem inheritance_tax_classification_always_one (f : InheritanceTaxActorFacts) :
    classifyInheritanceTaxActor f = .owes ∨ classifyInheritanceTaxActor f = .doesNotOwe ∨
    classifyInheritanceTaxActor f = .undetermined ∨ classifyInheritanceTaxActor f = .inconsistent := by
  cases h : owesInheritanceTaxVerdict f <;> simp [classifyInheritanceTaxActor, h]

/-- 納税義務の条件は、同盟条件全てが .yes のときに .yes. -/
theorem owes_iff_all_verdicts_yes (f : InheritanceTaxActorFacts) :
    owesInheritanceTaxVerdict f = Verdict.yes ↔
      (f.isIndividual = Verdict.yes ∧
       f.isResidentInJapanAtAcquisition = Verdict.yes ∧
       f.isNotTemporaryResident = Verdict.yes ∧
       f.acquiredThroughInheritanceOrBequest = Verdict.yes) := by
  cases h0 : f.isIndividual <;>
  cases h1 : f.isResidentInJapanAtAcquisition <;>
  cases h2 : f.isNotTemporaryResident <;>
  cases h3 : f.acquiredThroughInheritanceOrBequest <;>
  simp [owesInheritanceTaxVerdict, isResidentCompliantIndividual, isAcquirerOfInheritorProp,
        h0, h1, h2, h3, Verdict.and]

/-- 納税義務の条件は、どれかが .no のとき .no. -/
theorem any_no_verdict_gives_no_obligation (f : InheritanceTaxActorFacts) :
    (f.isIndividual = Verdict.no ∨ f.isResidentInJapanAtAcquisition = Verdict.no ∨
     f.isNotTemporaryResident = Verdict.no ∨ f.acquiredThroughInheritanceOrBequest = Verdict.no) →
    owesInheritanceTaxVerdict f = Verdict.no := by
  intro h
  rcases h with h | h | h | h
  · have hn : isResidentCompliantIndividual f = Verdict.no := by
      cases h1 : f.isResidentInJapanAtAcquisition <;> cases h2 : f.isNotTemporaryResident <;>
        simp [isResidentCompliantIndividual, h, h1, h2, Verdict.and]
    simp [owesInheritanceTaxVerdict, hn, isAcquirerOfInheritorProp, Verdict.and]
  · have hn : isResidentCompliantIndividual f = Verdict.no := by
      cases h1 : f.isIndividual <;> cases h2 : f.isNotTemporaryResident <;>
        simp [isResidentCompliantIndividual, h, h1, h2, Verdict.and]
    simp [owesInheritanceTaxVerdict, hn, isAcquirerOfInheritorProp, Verdict.and]
  · have hn : isResidentCompliantIndividual f = Verdict.no := by
      cases h1 : f.isIndividual <;> cases h2 : f.isResidentInJapanAtAcquisition <;>
        simp [isResidentCompliantIndividual, h, h1, h2, Verdict.and]
    simp [owesInheritanceTaxVerdict, hn, isAcquirerOfInheritorProp, Verdict.and]
  · have hn : isAcquirerOfInheritorProp f = Verdict.no := h
    cases h1 : isResidentCompliantIndividual f <;>
      simp [owesInheritanceTaxVerdict, hn, h1, Verdict.and]

end JapanTaxLaw
