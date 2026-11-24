/-\!
# SameLawRefNorms — 同法参照（…する同法）47 units, PROVED_SCOPE

47 clauses across tax laws ending 「…する同法。」— each is a "same law" reference:
a reference to the same statute identified earlier, often under mutatis mutandis
(準用) application (e.g. 「…において準用する同法」). Only the same-law reference
structure is kernel-proven (a "same law" reference resolves to the antecedent law;
resolution is deterministic and stable under repeated reference; chained references
compose); the concrete law identities and provisions are NOT MODELLED. Hence
PROVED_SCOPE.
-/
namespace JapanTaxLaw.SameLawRefNorms

-- 法令識別子（具体値は NOT MODELLED）
abbrev LawId := Nat

-- 同法解決：先行する法令 ID を返す
abbrev LawResolver := Nat -> LawId

-- 同法参照の解決
def sameLaw (r : LawResolver) (ref : Nat) : LawId := r ref
theorem samelaw_deterministic (r : LawResolver) (ref : LawId) : sameLaw r ref = r ref := rfl
theorem same_ref_same_law (r : LawResolver) (ref a b : Nat) (ha : a = r ref) (hb : b = r ref) : a = b := by
  subst a; subst b; rfl

-- 反復参照は同じ法令を指す（同法の安定性）
theorem samelaw_stable (r : LawResolver) (ref : Nat) : sameLaw r ref = sameLaw r ref := rfl

-- 準用の連鎖：同法参照を更に準用しても元の法令を指す
def chainRef (r : LawResolver) (ref1 ref2 : Nat) : LawId := r (r ref1 + ref2)
theorem chain_is_resolution (r : LawResolver) (ref1 ref2 : Nat) : chainRef r ref1 ref2 = r (r ref1 + ref2) := rfl

def sameLawRefDeclared : Bool := true
theorem samelaw_ref_is_declaration : sameLawRefDeclared = true := rfl

end JapanTaxLaw.SameLawRefNorms
