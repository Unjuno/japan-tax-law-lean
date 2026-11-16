import JapanTaxLaw.ListedDividendWithholding

/-!
# ListedDividendWithholding spec — independent restatement of
  租税特別措置法 art. 9の3の二（上場株式等の配当等に係る源泉徴収義務等の特例）

Sources (pinned; identical to ListedDividendWithholding.lean):

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: E6E6013BBC0608C6B48DEA01D50AC847C3E5D094F0420223171FFE1B5CF8D5EE
  (data/raw/332AC0000000026_20261101_507AC0000000013.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Independent restatement of:
  * art. 9の3の二(1) — 支払の取扱者は、上場株式等の配当等の交付をする際、
    交付をする金額（第三項の規定により控除する同項各号に定める金額がある場合には、
    当該金額その他の政令で定める金額を加算した金額）に百分の十五
    （第一号に掲げる配当等でその配当等の支払をする内国法人に係る大口株主等に対し交付をするものについては、
      百分の二十）の税率を乗じて計算した金額の所得税を徴収し、
  * art. 9の3の二(3) — 当該各号に定める金額は、同項の規定により徴収して納付すべき
    当該上場株式等の配当等に係る所得税の額を限度として当該所得税の額から控除する
from the statutory text itself.

Scope boundary identical to the implementation.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: art. 9の3の二(1) — 交付をする金額 + 控除対象金額の和。 -/
def specWithholdingBase (exchangeAmount foreignSpecificTax : Money) : Money :=
  exchangeAmount + foreignSpecificTax

/-- Spec: art. 9の3の二(1) の税率（大口株主等に対し交付をする第一号配当等は二十パーセント）。 -/
def specListedDividendRate (isLargeShareholderDividend : Bool) : Nat :=
  if isLargeShareholderDividend then 20 else 15

/-- Spec: art. 9の3の二(1) の徴収すべき金額は、税率に切り捨て。 -/
def specWithholdingGross (isLargeShareholderDividend : Bool) (exchangeAmount foreignSpecificTax : Money) : Money :=
  specWithholdingBase exchangeAmount foreignSpecificTax
    * specListedDividendRate isLargeShareholderDividend / 100

/-- Spec: art. 9の3の二(3) — 控除額は所得税の額を限度とする。 -/
def specWithholdingDeduction (foreignSpecificTax gross : Money) : Money :=
  min foreignSpecificTax gross

/-- Spec: art. 9の3の二(3) — 実際の徴収額。 -/
def specWithholdingNet (isLargeShareholderDividend : Bool) (exchangeAmount foreignSpecificTax : Money) : Money :=
  specWithholdingGross isLargeShareholderDividend exchangeAmount foreignSpecificTax
    - specWithholdingDeduction foreignSpecificTax
        (specWithholdingGross isLargeShareholderDividend exchangeAmount foreignSpecificTax)

-- ==== points, all kernel-decided ====

example : specListedDividendRate false = 15 := by decide
example : specListedDividendRate true = 20 := by decide
example : specWithholdingGross false 100_000 0 = 15_000 := by decide
example : specWithholdingGross true 100_000 0 = 20_000 := by decide
example : specWithholdingGross false 1_000_000 50_000 = 157_500 := by decide
example : specWithholdingDeduction 50_000 157_500 = 50_000 := by decide
example : specWithholdingDeduction 50_000 22_500 = 22_500 := by decide
example : specWithholdingNet false 1_000_000 50_000 = 107_500 := by decide
example : specWithholdingNet false 100_000 50_000 = 0 := by decide
example : specWithholdingNet true 1_000_000 100_000 = 120_000 := by decide
example : specWithholdingNet true 10_000_000 100_000 = 1_920_000 := by decide

/-- Agreement examples between implementation and the Spec. -/
def agreeListedDividendPoints : Bool :=
  [ false, true ].all fun b =>
    [ (0, 0), (100_000, 0), (1_000_000, 0), (1_000_000, 50_000), (1_000_000, 200_000),
      (0, 150_000), (500_000_000, 0), (10_000_000, 100_000) ].all fun (amt, ftax) =>
    withholdingNet ⟨b, amt, ftax⟩ == specWithholdingNet b amt ftax

example : agreeListedDividendPoints = true := by decide

end JapanTaxLaw
