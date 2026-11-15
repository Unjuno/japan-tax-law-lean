import JapanTaxLaw.Verdict
import JapanTaxLaw.VerdictLemmas

/-!
# Taxpayer — 国税通則法（国税の通則に関する法律）第2条第5号（納税者の定義）

Source (pinned):
https://laws.e-gov.go.jp/law/337AC0000000066
Law id: 337AC0000000066（昭和三十七年法律第六十六号）
Revision: 337AC0000000066_20261101_507AC0000000013
Amendment enforcement date: 2026-11-01 (CurrentEnforced)
Raw snapshot sha256: 6F8B43E168652D228066CDA3389A3BF6823900A9268E6BF97297CB6B25189DEE
(as recorded in data/INVENTORY.json; see docs/INVENTORY.md)

Act art. 2 item 5, verbatim from the pinned text:
  納税者 国税に関する法律の規定により国税（源泉徴収等による国税を除く。）を納める義務が
  ある者（国税徴収法（昭和三十四年法律第百四十七号）に規定する第二次納税義務者及び国税の
  保証人を除く。）及び源泉徴収等による国税を徴収して国に納付しなければならない者をいう。

Scope:
* Only the definition layer (Act art. 2 item 5) is formalized here.
* The exclusion of 国税徴収法に規定する第二次納税義務者及び国税の保証人 is modeled
  as two assessed-fact inputs (the Act does not decide whether a person is one;
  the inputs are externally assessed facts in four-valued logic).

What this model deliberately does **not** do:
* It does not model 第二次納税義務 (国税徴収法), 国税の保証人, or any attaching order;
  it only records their presence/absence as externally assessed facts.
* It does not model 納税申告書 (item 6), 法的申告期限 (item 7), or later provisions.
* The four-valued `Verdict` logic is shared with StatutoryModel/CorpActor; unknown
  is never treated as false.

Axiom discipline: proofs by `cases` + `simp` over Verdict constructors and the
Verdict connectives (Verdict.or/and/not, VerdictLemmas.or_eq_yes/no). No
`sorry`, `admit`, or unverified axioms.
-/

namespace JapanTaxLaw

/-- Assessed facts relevant to the 納税者 definition (Act art. 2 item 5). -/
structure TaxpayerFacts where
  /-- 国税（源泉徴収等による国税を除く。）を納める義務があるか。 -/
  owesDirectly : Verdict
  /-- 源泉徴収等による国税を徴収して国に納付しなければならない者か。 -/
  mustCollectAndPay : Verdict
  /-- 国税徴収法に規定する第二次納税義務者か。 -/
  isSecondaryObligor : Verdict
  /-- 国税の保証人か。 -/
  isNationalTaxGuarantor : Verdict
  deriving DecidableEq, Repr

/-- Act art. 2 item 5, parenthetical exclusion for the direct-payment track:
    第二次納税義務者又は国税の保証人を除く。 -/
def directTrackExcluded (f : TaxpayerFacts) : Verdict :=
  Verdict.or f.isSecondaryObligor f.isNationalTaxGuarantor

/-- Act art. 2 item 5, first limb: a person obliged to pay national tax
    (other than source-collected national tax) who is NOT a secondary obligor
    under the National Tax Collection Act and NOT a national-tax guarantor. -/
def directTrack (f : TaxpayerFacts) : Verdict :=
  Verdict.and f.owesDirectly (Verdict.not (directTrackExcluded f))

/-- Act art. 2 item 5: 納税者 — either limb suffices ("及び" joins the two
    sufficient limbs; satisfying either renders the person a 納税者). -/
def isTaxpayer (f : TaxpayerFacts) : Verdict :=
  Verdict.or (directTrack f) f.mustCollectAndPay

-- ==================== structural consistency lemmas ====================

/-- Second-limb sufficiency: obligated to collect and pay ⇒ 納税者. -/
theorem source_collection_sufficient (f : TaxpayerFacts)
    (h : f.mustCollectAndPay = Verdict.yes) : isTaxpayer f = Verdict.yes := by
  unfold isTaxpayer
  rw [h]
  exact Verdict.or_yes_right _

/-- A secondary obligor is never a direct-track taxpayer. -/
theorem secondary_obligor_excluded_from_direct_track (f : TaxpayerFacts)
    (h : f.isSecondaryObligor = Verdict.yes) : directTrack f = Verdict.no := by
  have hx : directTrackExcluded f = Verdict.yes := by
    unfold directTrackExcluded
    rw [h]
    exact Verdict.or_yes_left _
  unfold directTrack
  rw [hx]
  rw [show Verdict.not Verdict.yes = Verdict.no from rfl]
  exact Verdict.and_no_right _

/-- A guarantor is never a direct-track taxpayer. -/
theorem guarantor_excluded_from_direct_track (f : TaxpayerFacts)
    (h : f.isNationalTaxGuarantor = Verdict.yes) : directTrack f = Verdict.no := by
  have hx : directTrackExcluded f = Verdict.yes := by
    unfold directTrackExcluded
    rw [h]
    exact Verdict.or_yes_right _
  unfold directTrack
  rw [hx]
  rw [show Verdict.not Verdict.yes = Verdict.no from rfl]
  exact Verdict.and_no_right _

/-- If BOTH exclusions deny, the obligation alone suffices for the direct track. -/
theorem neither_exclusion_suffices (f : TaxpayerFacts)
    (hOwes : f.owesDirectly = Verdict.yes)
    (hSec : f.isSecondaryObligor = Verdict.no)
    (hGuar : f.isNationalTaxGuarantor = Verdict.no) : directTrack f = Verdict.yes := by
  have hx : directTrackExcluded f = Verdict.no := by
    unfold directTrackExcluded
    rw [hSec, hGuar]
    rfl
  unfold directTrack
  rw [hx, hOwes]
  rfl

/-- Neither limb affirmed ⇒ not a taxpayer: direct track cannot yield yes, and the
    withholding track is no. -/
theorem neither_limb_not_taxpayer (f : TaxpayerFacts)
    (hSec : f.isSecondaryObligor = Verdict.no)
    (hGuar : f.isNationalTaxGuarantor = Verdict.no)
    (hOwes : f.owesDirectly = Verdict.no)
    (hCollect : f.mustCollectAndPay = Verdict.no) : isTaxpayer f = Verdict.no := by
  have hx : directTrackExcluded f = Verdict.no := by
    unfold directTrackExcluded
    rw [hSec, hGuar]
    rfl
  have hdt : directTrack f = Verdict.no := by
    unfold directTrack
    rw [hx, hOwes]
    exact Verdict.and_no_left _
  unfold isTaxpayer
  rw [hdt, hCollect]
  rfl

/-- A taxpayer determination never requires guessing: when every relevant fact is
    negated, no limb is satisfied. -/
theorem no_limb_no_taxpayer (f : TaxpayerFacts)
    (hOwes : f.owesDirectly ≠ Verdict.yes)
    (hCollect : f.mustCollectAndPay ≠ Verdict.yes) : isTaxpayer f ≠ Verdict.yes := by
  intro h
  unfold isTaxpayer at h
  have h2 : directTrack f = Verdict.yes ∨ f.mustCollectAndPay = Verdict.yes := Verdict.or_eq_yes.mp h
  rcases h2 with h1 | h3
  · have ha := (Verdict.and_eq_yes.mp h1).1
    exact hOwes ha
  · exact hCollect h3

end JapanTaxLaw
