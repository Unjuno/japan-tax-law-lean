import Std
import JapanTaxLaw.TaxFinance

/-
# OpinionApplicantDocumentWindowThreeMonths — 関税法第六十九条の四意見申請手続規則 第二条 第三項 第一号
（個人である意見申請者：申請の日前三月以内に作成された戸籍謄本等）

Pinned sources:
  Law id: 418M60000400006 (関税法第六十九条の四第一項の規定による経済産業大臣
    に対する意見の求めに係る申請手続等に関する規則)
  Revision: 418M60000400006_20201228_502M60000400092
  Raw snapshot: data/raw/418M60000400006_20201228_502M60000400092.law.json
  Article Num 2, Paragraph 3, Item 1, Sentence 1.
  source_path: LawBody[2]/MainProvision/MainProvision[1]/Article:2/Article#2/Paragraph#3/Item#1/ItemSentence/Sentence#1
  Normative unit: NORM|db7032d11503902e09329e76f464f560e67b9feb9d10d013371baf321a15e7f2

Verbatim 原文 needle (scoped to Article 2 Paragraph 3 Item 1):
  「意見申請者が個人である場合にあっては、申請の日前三月以内に作成された戸籍の謄本若しくは抄本又は住民票の写し」

Variable contract:
  isIndividual = 意見申請者が個人であるか (caller-established Bool)
  createdMonth = 書類の作成月 (caller-established month ordinal)
  appliedMonth = 申請の月 (caller-established month ordinal)
  window       = 三 = 3 months
  timelyIndividualDoc isIndividual createdMonth appliedMonth =
      ¬ isIndividual ∨ (createdMonth <= appliedMonth ∧
                        appliedMonth <= createdMonth + 3)

This is a bounded three-month lookback with an inclusive upper bound; a
document dated after the application month is not 「申請の日前」. Calendar-day
precision is NOT MODELLED (month ordinals only), and the 法人 branch is
represented by the ¬isIndividual shortcut (its own document rules are out of
scope).

Scope: ONLY this individual-applicant recency gate. Article 2 paragraphs 1–2,
item 2 (法人 branch details), 別記様式, the definition of 意見申請者, the whole
administrative procedure and all other articles/laws are NOT MODELLED.
-/

namespace JapanTaxLaw.OpinionApplicantDocumentWindowThreeMonths

/-- 原文の「三」= 3 月。 -/
def windowMonths : Nat := 3

/-- 個人申請者の書類が申請の日前三月以内か。 -/
def timelyIndividualDoc (isIndividual : Bool) (createdMonth : Nat) (appliedMonth : Nat) : Bool :=
  if isIndividual then
    createdMonth <= appliedMonth && appliedMonth <= createdMonth + windowMonths
  else
    true

theorem window_is_three : windowMonths = 3 := rfl

-- 個人: 0 / 3 / 4 月境界
theorem individual_same_month : timelyIndividualDoc true 0 0 = true := by decide
theorem individual_at_window : timelyIndividualDoc true 0 3 = true := by decide
theorem individual_beyond_window : timelyIndividualDoc true 0 4 = false := by decide

-- 個人: 未来の書類は対象外
theorem individual_future_document : timelyIndividualDoc true 5 4 = false := by decide

-- 法人側はこの号の対象外（短絡）
theorem corporation_not_governed : timelyIndividualDoc false 0 100 = true := by decide

-- シフトした申請月
theorem shifted_within : timelyIndividualDoc true 5 8 = true := by decide
theorem shifted_beyond : timelyIndividualDoc true 5 9 = false := by decide

end JapanTaxLaw.OpinionApplicantDocumentWindowThreeMonths
