import JapanTaxLaw.OpinionApplicantDocumentWindowThreeMonths

/-
# OpinionApplicantDocumentWindowThreeMonthsSpec — 関税法意見申請手続規則 2(3)(1) の独立定式

Pinned: law 418M60000400006, revision 418M60000400006_20201228_502M60000400092,
Article 2 Paragraph 3 Item 1; needle 「…申請の日前三月以内に作成された…」.

Independent restatement: for an individual applicant the document month must be
no later than the application month and within three months of it. Definitions
use their own numerals and no implementation identifiers; bridges are separate.
-/

namespace JapanTaxLaw.OpinionApplicantDocumentWindowThreeMonths

/-- 独立定式: 三月 = 3。 -/
def specWindow : Nat := 3

/-- 独立定式: 個人なら c <= a ∧ a <= c + 3（右上限は inclusive）。 -/
def specTimely (indiv : Bool) (c : Nat) (a : Nat) : Bool :=
  if indiv then c <= a && a <= c + specWindow else true

theorem agreeWindow : windowMonths = specWindow := by
  unfold windowMonths specWindow
  rfl

theorem agreeTimely (indiv : Bool) (c a : Nat) :
    timelyIndividualDoc indiv c a = specTimely indiv c a := by
  unfold timelyIndividualDoc specTimely
  rw [agreeWindow]

example : specTimely true 0 3 = true := by decide
example : specTimely true 0 4 = false := by decide
example : specTimely false 0 100 = true := by decide

end JapanTaxLaw.OpinionApplicantDocumentWindowThreeMonths
