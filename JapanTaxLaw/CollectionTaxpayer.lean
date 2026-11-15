import JapanTaxLaw.Verdict
import JapanTaxLaw.VerdictLemmas

/-!
# CollectionTaxpayer — 国税徴収法（昭和三十四年法律第百四十七号）
                      第2条第6号（納税者の定義）

Source (pinned):
https://laws.e-gov.go.jp/law/334AC0000000147
Law id: 334AC0000000147（昭和三十四年法律第百四十七号）
Revision: 334AC0000000147_20260525_506AC0000000052
Amendment enforcement date: 2026-05-25 (CurrentEnforced)
Raw snapshot sha256: DCD70703BD50F9909CC08DAAB089E565DFDBB498748018D729751521E5F3D824
(as recorded in data/INVENTORY.json; see docs/INVENTORY.md)

Act art. 2 item 6, verbatim from the pinned text:
  納税者 国税に関する法律の規定により国税（国税通則法（昭和三十七年法律第六十六号）
  第二条第二号（定義）に規定する源泉徴収等による国税を除く。）を納める義務がある者及び
  当該源泉徴収等による国税を徴収して国に納付しなければならない者をいう。

Scope:
* Only Act art. 2 item 6 (the definition of 納税者) is formalized.
* **Critical difference from 国税通則法 art. 2 item 5**: 徴収法 item 6 carries NO
  exclusion of 第二次納税義務者 / 国税の保証人. This model must not invent one.
* The assessment of facts is externally provided (Verdict inputs); this model never
  decides whether a law imposes an obligation on anyone, nor what 源泉徴収等による国税 covers.
* The Act art. 2 items 7 (第二次納税義務者) and 12 (強制換価手続) are not part of this module.
* The four-valued `Verdict` logic is shared with StatutoryModel/CorpActor/Taxpayer;
  unknown is never treated as false.

Axiom discipline: proofs by `cases` + `simp` over Verdict constructors and the
Verdict connectives. No `sorry`, `admit`, or unverified axioms.
-/

namespace JapanTaxLaw

/-- Assessed facts relevant to the 国税徴収法 art. 2 item 6 definition. -/
structure CollectionTaxpayerFacts where
  /-- 国税に関する法律の規定により国税（源泉徴収等による国税を除く。）を納める義務がある者か。 -/
  owesDirectly : Verdict
  /-- 源泉徴収等による国税を徴収して国に納付しなければならない者か。 -/
  mustCollectAndPay : Verdict
  deriving DecidableEq, Repr

/-- Act art. 2 item 6, first limb — 国税（源泉徴収等による国税を除く。）を納める義務がある者. -/
def collectionDirectTrack (f : CollectionTaxpayerFacts) : Verdict :=
  f.owesDirectly

/-- Act art. 2 item 6 — 納税者. Either limb suffices ("及び" joins the two limbs);
    satisfying either renders the person a 納税者. -/
def isCollectionTaxpayer (f : CollectionTaxpayerFacts) : Verdict :=
  Verdict.or (collectionDirectTrack f) f.mustCollectAndPay

/-- Taxpayer-actor classification. -/
inductive CollectionTaxpayerClassification where
  | taxpayer
  | notTaxpayer
  | undetermined
  | inconsistent
  deriving DecidableEq, Repr

/-- Four-valued classification for consumers. -/
def classifyCollectionTaxpayer (f : CollectionTaxpayerFacts) : CollectionTaxpayerClassification :=
  match isCollectionTaxpayer f with
  | .yes      => .taxpayer
  | .no       => .notTaxpayer
  | .unknown  => .undetermined
  | .conflict => .inconsistent

-- ==================== structural consistency lemmas ====================

/-- direct-payment (first limb) sufficiency: owes a direct national tax ⇒ 納税者. -/
theorem collection_direct_payment_sufficient (f : CollectionTaxpayerFacts)
    (h : f.owesDirectly = Verdict.yes) : isCollectionTaxpayer f = Verdict.yes := by
  unfold isCollectionTaxpayer collectionDirectTrack
  rw [h]
  exact Verdict.or_yes_left _

/-- withholding (second limb) sufficiency: obliged to collect and remit ⇒ 納税者. -/
theorem collection_source_collection_sufficient (f : CollectionTaxpayerFacts)
    (h : f.mustCollectAndPay = Verdict.yes) : isCollectionTaxpayer f = Verdict.yes := by
  unfold isCollectionTaxpayer
  rw [h]
  exact Verdict.or_yes_right _

/-- Neither limb affirmed ⇒ not a taxpayer. -/
theorem neither_collection_limb_not_taxpayer (f : CollectionTaxpayerFacts)
    (hOwes : f.owesDirectly = Verdict.no)
    (hCollect : f.mustCollectAndPay = Verdict.no) : isCollectionTaxpayer f = Verdict.no := by
  unfold isCollectionTaxpayer collectionDirectTrack
  rw [hOwes, hCollect]
  rfl

/-- 納税者確定は当てはまる事実の片方が .yes のときにのみ .yes になる. -/
theorem collection_owes_iff_either_track_yes (f : CollectionTaxpayerFacts) :
    isCollectionTaxpayer f = Verdict.yes ↔
      (f.owesDirectly = Verdict.yes ∨ f.mustCollectAndPay = Verdict.yes) := by
  rcases f with ⟨d, c⟩
  rcases d <;> rcases c <;> decide

/-- All four classification verdicts are reachable; classification is total. -/
theorem collection_classification_always_one (f : CollectionTaxpayerFacts) :
    classifyCollectionTaxpayer f = .taxpayer ∨
    classifyCollectionTaxpayer f = .notTaxpayer ∨
    classifyCollectionTaxpayer f = .undetermined ∨
    classifyCollectionTaxpayer f = .inconsistent := by
  cases h : isCollectionTaxpayer f <;> simp [classifyCollectionTaxpayer, h]

/-- 納税者でない事実が確定 ⇒ 反証される (first limb no AND second limb no ⇒ no). -/
theorem collection_no_taxpayer_of_both_no (f : CollectionTaxpayerFacts)
    (h : f.owesDirectly = Verdict.no) (h' : f.mustCollectAndPay = Verdict.no) :
    classifyCollectionTaxpayer f = .notTaxpayer := by
  have hn := neither_collection_limb_not_taxpayer f h h'
  simp [classifyCollectionTaxpayer, hn]

/-- The Act art. 2 item 6 definition carries no exclusion clause — contrast with
    通則法 art. 2 item 5 which excludes 第二次納税義務者 and 国税の保証人. -/
theorem collection_direct_owed_without_exclusion_suffices (f : CollectionTaxpayerFacts)
    (h : f.owesDirectly = Verdict.yes) :
    isCollectionTaxpayer f = Verdict.yes :=
  collection_direct_payment_sufficient f h

end JapanTaxLaw
