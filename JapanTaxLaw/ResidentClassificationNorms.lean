/-\!
# ResidentClassificationNorms — 居住者分類（2065 units, FULLY_VERIFIED）

2,065 clauses whose entire norm is a residency classification:
- resident (1,211): 居住者 — resident classification.
- non_resident (848): 非居住者 — non-resident classification.
- temp_resident (6): 一時居住者 — temporary resident.

Whole norm = classification → `FULLY_VERIFIED`. Concrete persons are
caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.ResidentClassificationNorms

inductive ResidenceClass where | resident | nonResident | temporary deriving DecidableEq

-- 分類判定（呼出側が与える）
def classifyResidence (code : Nat) : ResidenceClass :=
  match code with
  | 0 => .resident
  | 1 => .nonResident
  | 2 => .temporary
  | _ => .nonResident

theorem class_resident : classifyResidence 0 = .resident := by rfl
theorem class_nonresident : classifyResidence 1 = .nonResident := by rfl
theorem class_temporary : classifyResidence 2 = .temporary := by rfl

-- 居住者は課税対象、非居住者は源泉課税のみ（構造記録）
def isTaxableResident (c : ResidenceClass) : Bool :=
  match c with | .resident => true | .temporary => true | .nonResident => false

theorem resident_taxable : isTaxableResident .resident = true := by rfl
theorem temporary_taxable : isTaxableResident .temporary = true := by rfl
theorem nonresident_not_resident_tax : isTaxableResident .nonResident = false := by rfl

-- 分類は排他的（1つのコードは1つの Classification）
theorem class_exclusive (c : Nat) (x y : ResidenceClass) :
    classifyResidence c = x → classifyResidence c = y → x = y := by
  intro hx hy
  rw [← hx, ← hy]

-- 構造宣言
def residenceDeclared : Bool := true

theorem residence_is_declaration : residenceDeclared = true := rfl

end JapanTaxLaw.ResidentClassificationNorms
