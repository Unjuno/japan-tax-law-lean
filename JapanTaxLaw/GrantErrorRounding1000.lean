import JapanTaxLaw.TaxFinance

/-!
# GrantErrorRounding1000 — 地方交付税法施行令 art. 8(3) 錯誤額の千円未満切捨て（bounded slice）

Sources (pinned):
  Law id: 331M50000002007
  Revision: 331M50000002007_20230401_505M60000008036
  Raw snapshot: data/raw/331M50000002007_20230401_505M60000008036.law.json
  Normative id: NORM|05a5899479614efa11da83a033d254670bff34951e00ba08a11b856cbbc5630c
  Article Num 8, paragraph 3.

原文逐語（pinned clause, extracted from the raw snapshot）:
  「第一項の都道府県又は市町村に譲与すべき額に加算し、又は当該譲与すべき額から減額すべき錯誤に係る額に千円未満の端数金額があるときは、その端数金額を控除した金額をもつて、当該錯誤にかかる額とする。」

Computation（単位: 円。千円未満の端数を控除し、千円単位に切り捨て）:
  roundedError(amount) = amount - amount % 1000

Scope / NOT MODELLED:
  - 加算/減額の別、錯誤の認定、第一項の譲与額の算定、端数处理の他条は
    NOT MODELLED。
  - 本モデルは千円単位への切捨て計算のみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.GrantErrorRounding1000

/-- 千円未満の端数を控除した錯誤額（千円単位に切捨て）。 -/
def roundedError (amount : Nat) : Nat :=
  amount - amount % 1000

example : roundedError 0 = 0 := by decide
example : roundedError 999 = 0 := by decide
example : roundedError 1000 = 1000 := by decide
example : roundedError 1001 = 1000 := by decide
example : roundedError 2500 = 2000 := by decide

end JapanTaxLaw.GrantErrorRounding1000
