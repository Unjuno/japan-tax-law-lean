import JapanTaxLaw.TaxFinance

/-!
# TaxAccountantExamExemption — 税理士法 art. 8(2) 二以上職務の従事期間通算（bounded slice）

Sources (pinned):
  Law id: 326AC1000000237
  Revision: 326AC1000000237_20251001_505AC0000000053
  Raw snapshot: data/raw/326AC1000000237_20251001_505AC0000000053.law.json
  Normative id: NORM|048aa353ea02c717841c6c88cc52e793e1aca0369d0e006568a840fd4a731f7d
  Article Num 8, paragraph 2.

原文逐語（pinned clause, extracted from the raw snapshot）:
  「前項第一号又は第四号から第九号までに規定する職又は事務のうち、試験の免除科目を同じくする職又は事務の二以上に従事した者に対しては、それぞれ当該職又は事務についてこれらの号に規定する年数を十年とする割合により年数を換算してこれらの職又は事務の二以上に従事した期間を通算した場合に、その期間が十年以上になるときは、その申請により、税理士試験において当該科目の試験を免除する。」

Computation（単位: 年。各職務の規定年数を十年に換算した割合で従事年数を換算し、
二職務分を通算。十年以上かつ申請があれば免除）:
  converted(prescribed, actual) = if prescribed = 0 then 0 else actual * 10 / prescribed
  eligible(p1,a1,p2,a2,applied) =
    applied && 10 <= converted(p1,a1) + converted(p2,a2)

Scope / NOT MODELLED:
  - 対象職務・免除科目の認定、三以上の職務、端数処理の詳細、
    申請手続は NOT MODELLED。
  - 本モデルは二職務の整数換算・通算スライスのみを扱い、
    法的レビューを提供しない。
-/

namespace JapanTaxLaw.TaxAccountantExamExemption

/-- 規定年数を十年とする割合で換算した従事年数。 -/
def convertedYears (prescribed : Nat) (actual : Nat) : Nat :=
  if prescribed = 0 then 0 else actual * 10 / prescribed

/-- 二職務の通算年数が十年以上で申請があれば免除対象。 -/
def exemptionEligible (p1 : Nat) (a1 : Nat) (p2 : Nat) (a2 : Nat)
    (applied : Bool) : Bool :=
  applied && 10 <= convertedYears p1 a1 + convertedYears p2 a2

example : convertedYears 10 9 = 9 := by decide
example : convertedYears 10 10 = 10 := by decide
example : convertedYears 5 5 = 10 := by decide
example : exemptionEligible 10 5 10 5 true = true := by decide
example : exemptionEligible 10 4 10 5 true = false := by decide

end JapanTaxLaw.TaxAccountantExamExemption
