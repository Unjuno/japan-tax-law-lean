import JapanTaxLaw.ElectronicSystemDesignation

/-!
# ElectronicSystemDesignation tests — 電子情報処理組織 smoke checks
Decidable smoke tests, pinned to law 415M60000040007 / revision 415M60000040007_20251012_507M60000040035.
輸出入等関連情報処理組織(0)→true、その他(1,2)→false。
-/

namespace JapanTaxLaw.ElectronicSystemDesignation

example : isDesignatedSystem 0 = true := by decide
example : isDesignatedSystem 1 = false := by decide
example : isDesignatedSystem 2 = false := by decide

end JapanTaxLaw.ElectronicSystemDesignation
