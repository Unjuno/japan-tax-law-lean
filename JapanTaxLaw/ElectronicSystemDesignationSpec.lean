import JapanTaxLaw.ElectronicSystemDesignation

/-!
# ElectronicSystemDesignation spec — 輸出入等関連情報処理組織 の独立定式
Sources (pinned): law 415M60000040007, revision 415M60000040007_20251012_507M60000040035.
Independent restatement: 指定組織 = {輸出入等関連情報処理組織(0)}、その他(1) 対象外。
-/

namespace JapanTaxLaw.ElectronicSystemDesignation

def specSystem (s : Nat) : Bool := s == 0

example : specSystem 0 = true := by decide
example : specSystem 1 = false := by decide

def agreeElectronicSystemDesignation : Bool :=
  [0, 1, 2].all fun s => isDesignatedSystem s == specSystem s

example : agreeElectronicSystemDesignation = true := by decide

end JapanTaxLaw.ElectronicSystemDesignation
