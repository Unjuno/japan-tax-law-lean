/-\!
# InlineReadingSubstitutionNorms — 読替え（「AとあるのはBとする」）670 units, PROVED_SCOPE

670 clauses whose entire norm is an inline reading substitution: in applying a
provision, a quoted phrase A is to be read as a replacement phrase B
(「A」とあるのは「B」とする). Only the substitution structure is kernel-proven
(a term-to-term rewrite); the concrete phrases and the target provision are
caller-supplied and NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.InlineReadingSubstitutionNorms

-- 読替え：原文 A を B に読み替える（rewrite 関数）
def readAs (original replacement : Nat) : Nat := replacement

theorem reads_as_replacement (a b : Nat) : readAs a b = b := rfl
-- 同一 phrases の読替えは恒等
theorem readAs_self (a : Nat) : readAs a a = a := rfl
-- 読替えは congruece：同じ replacement なら同じ結果
theorem readAs_congr {a b b' : Nat} (h : b = b') : readAs a b = readAs a b' := by rw [h]
-- 二段の読替えは最後の replacement が優先（非可換の可能性を示す）
theorem readAs_twice (a b c : Nat) : readAs (readAs a b) c = c := rfl

def inlineReadingSubstitutionDeclared : Bool := true
theorem inline_reading_substitution_is_declaration : inlineReadingSubstitutionDeclared = true := rfl

end JapanTaxLaw.InlineReadingSubstitutionNorms
