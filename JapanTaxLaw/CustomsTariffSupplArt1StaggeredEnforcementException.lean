import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffSupplArt1StaggeredEnforcementException — EXCEPTION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|01ed33c34b3cea793208f86ea0e86fa6c3e2fc52b3f93a0b0dd94c09e6a0bd36
  Source path: LawBody[30]/SupplProvision/SupplProvision[1]/Article:1/Article#1/
               Paragraph#1/ParagraphSentence/Sentence#2

原文逐語（pinned, 一字一句改変なし）:
  「ただし、次の各号に掲げる改正規定は、当該各号に掲げる日から施行する。」

Norm kind: EXCEPTION — a supplementary-provision proviso (ただし書) to the Act's
general enforcement date: specified amendment provisions take effect from the date
listed in each respective item (各号に掲げる日), i.e. staggered per-item dates.
The computable slice models the enforcement-basis discrimination (general date
vs per-item listed date) and the per-item flag. The enumerated items and their
actual dates are NOT MODELLED (not present in this norm unit's needle).
Structural facts extracted from the needle; no hand-typed CJK.

Variable contract (meaning / domain / type):
  EnforcementBasis : Type — actWideDate (the Act's general enforcement date)
     or itemListedDate (this proviso's per-item date).
  effectiveBasis : EnforcementBasis — the basis established by this proviso.
  perItem : Bool — true (各号に掲げる日: the date listed in each item).
  No numeric amount/unit applies (structural temporal EXCEPTION, not a formula).

Scope: only the enforcement-basis discrimination. The enumerated amendment
provisions, their actual dates, and legal correctness are NOT MODELLED.
Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffSupplArt1StaggeredEnforcementException

/-- The enforcement basis: general Act date or per-item listed date. -/
inductive EnforcementBasis : Type
  | actWideDate : EnforcementBasis
  | itemListedDate : EnforcementBasis

deriving instance DecidableEq for EnforcementBasis

/-- This proviso establishes per-item listed dates. -/
def effectiveBasis : EnforcementBasis := EnforcementBasis.itemListedDate

/-- The dates are those listed in each respective item. -/
def perItem : Bool := true

/-- The enforcement basis is the per-item listed date. -/
theorem basis_is_item_listed : effectiveBasis = EnforcementBasis.itemListedDate := rfl

/-- The proviso is per-item (各号に掲げる日). -/
theorem is_per_item : perItem = true := rfl

/-- The general Act date is not the basis established by this proviso. -/
theorem not_act_wide : effectiveBasis ≠ EnforcementBasis.actWideDate := by decide

end JapanTaxLaw.CustomsTariffSupplArt1StaggeredEnforcementException
