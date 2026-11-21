import JapanTaxLaw.InheritanceTaxArt56And57RefSpec

/-!
# InheritanceTaxArt56And57RefTests — kernel-checked checks for 相続税法 第五十六条及び第五十七条

Verifies the article-title cross-reference membership: Articles 56 and 57 are
referenced; other article numbers are not; the two are distinct.
-/

namespace JapanTaxLaw.InheritanceTaxArt56And57Ref

-- The two listed article numbers (derived from the needle).
example : firstArticle = 56 := rfl
example : secondArticle = 57 := rfl

-- Both are referenced; neighbours are not.
example : referenced 56 := referenced_56
example : referenced 57 := referenced_57
example : ¬ referenced 55 := not_referenced_55
example : ¬ referenced 58 := not_referenced_58

-- The two referenced articles are distinct.
example : firstArticle ≠ secondArticle := articles_distinct

-- Universal agreement with the independent list-membership spec.
example (n : Nat) : referenced n ↔ SpecReferenced n := agree_referenced n

end JapanTaxLaw.InheritanceTaxArt56And57Ref
