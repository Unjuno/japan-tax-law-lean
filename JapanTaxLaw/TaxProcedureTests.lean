import JapanTaxLaw.TaxProcedure

/-!
# TaxProcedure tests — 国税通則法 Act art. 2 item 10 smoke checks

Decidable smoke checks for the definition layer. Scope limited to
Act art. 2 item 10; item 7 （法定申告期限） and later items are not claimed.
-/

namespace JapanTaxLaw

-- 定義層の全6項目を decide で判定できる
example : .delinquencyDisposition ∈ CompulsoryRealizationProcedure.all := by decide
example : .compulsoryExecution ∈ CompulsoryRealizationProcedure.all := by decide
example : .auctionForSecurityExecution ∈ CompulsoryRealizationProcedure.all := by decide
example : .executionProcedureCorporateSecurity ∈ CompulsoryRealizationProcedure.all := by decide
example : .executionProcedureEnterpriseValueSecurity ∈ CompulsoryRealizationProcedure.all := by decide
example : .bankruptcyProceedings ∈ CompulsoryRealizationProcedure.all := by decide

-- 網羅性：リスト長 = 6（法文の6手続を厳密に）
example : CompulsoryRealizationProcedure.all.length = 6 := by decide
example : List.Nodup CompulsoryRealizationProcedure.all := by decide

-- 「その例による処分」の趣旨：滞納処分はその例による処分を含む第1類型
example : (.delinquencyDisposition) ∈ CompulsoryRealizationProcedure.all := by decide

-- 除外の例外：全件認識される（enumは法文6項目に閉じる）
example : ∀ p : CompulsoryRealizationProcedure, p ∈ CompulsoryRealizationProcedure.all := by
  intro p
  cases p <;> simp [CompulsoryRealizationProcedure.all]

end JapanTaxLaw
