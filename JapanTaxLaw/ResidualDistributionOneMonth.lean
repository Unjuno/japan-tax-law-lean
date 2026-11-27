import Std
import JapanTaxLaw.TaxFinance

/-
# ResidualDistributionOneMonth — 復興特別法人税に関する省令 第一条 第一項 第四号
（残余財産の最後の分配又は引渡しが課税事業年度終了の日の翌日から一月以内に行われる場合）

Pinned sources:
  Law id: 424M60000040007 (復興特別法人税に関する省令)
  Revision: 424M60000040007_20210415_503M60000040045
  Raw snapshot: data/raw/424M60000040007_20210415_503M60000040045.law.json
  Article Num 1, Paragraph 1, Item 4, Sentence 1.
  source_path: LawBody[2]/MainProvision/MainProvision[0]/Article:1/Article#1/Paragraph#1/Item#4/ItemSentence/Sentence#1
  Normative unit: NORM|2eb8d615b9ab137ca72da6b0491b738d10a5a9bca159220d94c84a410505c387

Verbatim 原文 needle (scoped to Article 1 Item 4):
  「当該課税事業年度が残余財産の確定の日の属する課税事業年度である場合において、当該課税事業年度終了の日の翌日から一月以内に残余財産の最後の分配又は引渡しが行われるときは、その分配又は引渡しが行われる日」

Variable contract (month ordinals; caller-established):
  fyEndMonth = 課税事業年度終了の日の属する月
  distMonth  = 残余財産の最後の分配又は引渡しの月
  oneMonth   = 一 = 1 calendar month
  withinOneMonth fyEndMonth distMonth =
      fyEndMonth < distMonth ∧ distMonth <= fyEndMonth + 1

This is a strict-after-FY-end, inclusive-one-month timing gate that selects the
actual distribution date. Day-level/leap-day calendar precision is NOT MODELLED
(the statute's 「翌日から」 is represented at the month ordinal level).

Scope: ONLY this one-month timing gate. The definition of 課税事業年度 and
残余財産の確定, calendar arithmetic, the tax base/computation, items 1–3 and 5
of art.1, all other articles and all legal conclusions are NOT MODELLED.
-/

namespace JapanTaxLaw.ResidualDistributionOneMonth

/-- 原文の「一」= 1 月。 -/
def oneMonth : Nat := 1

/-- 終了の日の翌日から一月以内か（翌日より後・一月以内は inclusive）。 -/
def withinOneMonth (fyEndMonth : Nat) (distMonth : Nat) : Bool :=
  fyEndMonth < distMonth && distMonth <= fyEndMonth + oneMonth

theorem one_month_is_one : oneMonth = 1 := rfl

-- 境界: 終了月 / 翌月 (L) / 翌々月 (L+1)
theorem in_fy_end_month : withinOneMonth 0 0 = false := by decide
theorem in_next_month : withinOneMonth 0 1 = true := by decide
theorem beyond_one_month : withinOneMonth 0 2 = false := by decide

-- シフトした終了月
theorem shifted_within : withinOneMonth 5 6 = true := by decide
theorem shifted_beyond : withinOneMonth 5 7 = false := by decide

end JapanTaxLaw.ResidualDistributionOneMonth
