import JapanTaxLaw.TaxFinance

/-!
# AutoWeightGrantRate357 — 自動車重量譲与税法 art. 1(1) 譲与額（千分の三百五十七）bounded slice

Sources (pinned):
  Law id: 346AC0000000090
  Revision: 346AC0000000090_20260401_508AC0000000002
  Raw snapshot: data/raw/346AC0000000090_20260401_508AC0000000002.law.json
  Normative id: NORM|4b3f2123925910ae0cbf27eb99163228afeeb7961f5c09335fc9957585ba6a7a
  Article Num 1, paragraph 1.

原文逐語（pinned clause, extracted from the raw snapshot）:
  「自動車重量譲与税は、自動車重量税法（昭和四十六年法律第八十九号）の規定による自動車重量税の収入額の千分の三百五十七に相当する額とし、市町村（特別区を含む。以下同じ。）及び都道府県に対して譲与するものとする。」

Computation（単位: 円。譲与額 = 自動車重量税収入額 * 357 / 1000、
整数演算の床切り）:
  grantAmount(revenue) = revenue * 357 / 1000

Scope / NOT MODELLED:
  - 自動車重量税の収入額の算定、市町村・都道府県の配分方法、
    千円未満の端数処理、収入の帰属年度は NOT MODELLED。
  - 本モデルは単一の千分率計算のみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.AutoWeightGrantRate357

/-- 自動車重量税収入額の千分の三百五十七に相当する譲与額。 -/
def grantAmount (revenue : Nat) : Nat :=
  revenue * 357 / 1000

example : grantAmount 0 = 0 := by decide
example : grantAmount 1000 = 357 := by decide
example : grantAmount 1001 = 357 := by decide
example : grantAmount 10000 = 3570 := by decide

end JapanTaxLaw.AutoWeightGrantRate357
